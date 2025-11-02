class Map
  
  def initialize(arr_of_string, distance)
    @map = arr_of_string
    @start = [0,0]
    @map.each_index do |l|
      @start = [l, @map[l].index("X") ] if @map[l].index "X"
    end
    @state = @start
    @step = 0
    @light = Light.new(@start)
    @direction = []
    @light = distance
    @hits = 0
  end
  
  def set_light_direction(d)
    # [1,1]
    @direction = d
  end

  def get_up_left
    if canmove?
      @map[@state[0]-1][@state[1]-1]
      @state.map{|x|x-1}
      @lignt -= 0.5*1.414
    else
      update_direction
    end
  end

  def update_direction
      # all reflect ?
      r = @map[@state[0]][@state[1] + 1]
      l = @map[@state[0]+1][@state[1]]
      if r == "#" and l == "#"
        # all reflect
        @direction = [@direction[0]*-1, @direction[1]*-1]
      elsif r != "#" and l != "#"
        # destroy
        @light = 0
      elsif r != "#" and l == "."
        
      end
     
  end

  def reset
    @state = @start 
  end

  def canmove?
    return false if @light <= 0
    get_cur_pos == "." or get_cur_pos == "X" 
  end

  def get_cur_pos
    @map[@state[0]][@state[1]]
  end

end

class Light
  def initialize(direction, visible)
    @direction = direction
    @distance = visible
    @hits = 0
  end

  def move(direction)
      return hits if @distance <= 0
      case direction
      when "up-left"
        set_direction(-1,-1) 
      when "down-right"
        
      end
      process
  end

  def process 
  end
end


File.open("sample.in") do |f|
  cases = f.readline.to_i 
  cases.times do |i| 
    args = f.readline.split(" ").map &:to_i 
    h, w, d = args
    map = []
    h.times do |_h|
       map << f.readline.strip
    end
    map = Map.new(map) 
    images = 0
    r2 = 1.414 
    # 8 direction
    # up-left
    while(d > 0)
      m = map.get_up_right
      if m == "#" 
    end
  end
end
