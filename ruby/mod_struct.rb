module Cheque; module Test; end end
module Cheque::Test
  module Format
    Format = Struct.new(:payin_code, :format)
    @format_collections = []
    @format_collections << Format.new("01", {:x => 'payin 01'})
    @format_collections << Format.new("02", {:x => 'payin 02'})
    def self.[](x)
      @format_collections.find{|f| f.payin_code == x }.format rescue "nil"
    end
  end
end

puts Cheque::Test::Format['03']
