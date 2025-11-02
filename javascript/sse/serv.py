#!/usr/bin/env python
from flask import Flask, Response, stream_with_context
import random
import time
import datetime as dt

app = Flask(__name__)

@app.route('/')
def home():
    return '''
        <div id="custom_event" style="float:left; border-right: 1px dashed black;">
            <h2>Custom Event Type</h2>
            <div id="custom"></div>
        </div>

        <div id="xxx" style="float: left; margin-left: 10px;">
            <h2>Non-Defined Event Type</h2>
            <div id="nondefined"></div>
        </div>

        <script>
            setTimeout(function(){
                var es = new EventSource("/stream");
                var customDiv = document.getElementById('custom');
                var nondefinedDiv = document.getElementById('nondefined');

                es.addEventListener('custom_event', function(e){
                    var el = document.createElement('b')
                    var now = new Date();
                    var milli = "000" + now.getMilliseconds();
                    el.innerHTML = e.data + " :: " + now.getSeconds() + "." + milli.slice(-3) + "<br/>";
                    customDiv.appendChild(el);
                }, false);

                es.onopen = function(){ console.log("start connnect SSE!"); }

                es.onmessage = function(e){ 
                    var el = document.createElement('b')
                    el.innerHTML = e.data + "<br/>";
                    nondefinedDiv.appendChild(el);
                }

                // if error or done
                es.onerror = function(e){ 
                    console.log('error', e); es.close(); 
                }
            }, 3000);
        </script>
    '''

@app.route('/stream')
def hello():
    def stream_content():
        # http://html5doctor.com/server-sent-events/
        # https://developer.mozilla.org/en-US/docs/Server-sent_events/Using_server-sent_events#Event_stream_format
        # https://developer.mozilla.org/en-US/docs/Server-sent_events/Using_server-sent_events
        i = 0
        while i < 100:
            time.sleep(0.2)
            # sent custom_event type format with id that handle message lost
            # received by `custom_event`

            yield "event: custom_event\n"
            yield ("id: %s\n" % (i+1))
            now = dt.datetime.now()
            yield ("data: { \"randnumber\": %s, \"time\": %s }\n\n" % (random.randint(100, 999), now))

            # sent non-defined event type -> received by `onmessage`
            # yield ("data: { \"randnumber\": %s }\n\n" % (random.randint(100, 999)))
            i += 1

    return Response(stream_with_context(stream_content()), 
           headers={ 'Content-Type': 'text/event-stream' })

if __name__ == '__main__':
    app.run()
