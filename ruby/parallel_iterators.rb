require "thread"

def combine(*iterators)
  queues = []
  threads = []

  iterators.each do |it|
    queue = SizedQueue.new(1)
    th = Thread.new(it, queue) do |i, q|
           send(i) {|x| q << x }
         end
    queues  << queue
    threads << th
  end

  loop do
    ary = []
    queues.each {|q| ary << q.pop }
    yield ary

    iterators.size.times do |i|
      return if !threads[i].status && queues[i].empty?
    end
  end
end

def it1
  yield 1; yield 2; yield 3
end

def it2
  yield 4; yield 5; yield 6
end

combine(:it1, :it2) do |x|
  # x is [1, 4], then [2, 5], then [3, 6]
  puts x
end
