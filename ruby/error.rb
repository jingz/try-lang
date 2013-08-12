def test_error
  raise Exception, { :xxx => "Error message" }
end

begin
  test_error
rescue Exception => e
  p e # #<Exception: #<Exception:0x9fdb8cc>>
  p e.message # {:xxx=>"Error message"}
end


