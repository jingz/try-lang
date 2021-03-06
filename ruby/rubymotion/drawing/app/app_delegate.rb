class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = AppController.alloc.initWithNibName nil, bundle: nil
    @window.makeKeyAndVisible
    true
  end
end

class AppController < UIViewController

  def viewDidLoad
    # appview = AppView.alloc.initWithFrame UIScreen.mainScreen.bounds
    # self.view.addSubview appview
    # appview.backgroundColor = UIColor.whiteColor
    @center_view = UIView.alloc.initWithFrame [[100,100], [100,100]]
    @center_view.backgroundColor = UIColor.whiteColor
    self.view.addSubview @center_view

    setup_gesture
    
    @red_block_view = UIView.alloc.initWithFrame [[10, 10], [70, 70]]
    @red_block_view.backgroundColor = UIColor.redColor
    self.view.addSubview @red_block_view
    @points = [[250, 0], [0, 450], [250, 450]]
    @colors = [UIColor.redColor, UIColor.blueColor, UIColor.greenColor]
    @transforms = [[1.5,1.5], [2,2], [0.5,0.5]]
    @rotates = [Math::PI, 2*Math::PI, Math::PI/2]
    @current_index = 0
  end

  def viewDidAppear(animate)
    super(animate)
    animate_sliding
  end

  def setup_gesture
    @swipe_gesture = UISwipeGestureRecognizer.alloc.initWithTarget self, action: "handle_swipe"
    @swipe_gesture.direction = UISwipeGestureRecognizerDirectionLeft
    @swipe_gesture.numberOfTouchesRequired = 1
    self.view.addGestureRecognizer @swipe_gesture
  end

  def handle_swipe(param)
    ap param 
  end

  def animate_sliding
    UIView.animateWithDuration(2,
             animations: lambda {
                @red_block_view.setFrame [ @points[@current_index], @red_block_view.size ]
                @red_block_view.backgroundColor = @colors[@current_index]
                t = @transforms[@current_index]
                # @red_block_view.transform = CGAffineTransformMakeScale(t[0], t[1])
                @red_block_view.transform = CGAffineTransformMakeRotation(@rotates[@current_index])
             },
             completion: lambda { |finished|
               @current_index += 1
               @current_index %= @points.count
               animate_sliding
             }
    )
  end

end

class AppView < UIView
  def drawRect(rect)
    y = [50 , 200, 350]
    types = [KCGLineJoinMiter, KCGLineJoinBevel, KCGLineJoinRound]
    y.each_with_index do |_y, i|
      draw_roof_at rect.size.width / 2, _y, types[i]
    end

    draw_rect_using_path rect
    draw_gradient rect
  end

  def draw_roof_at(x, y, join_type = KCGLineJoinMiter)
    UIColor.blackColor.set
    ctx = UIGraphicsGetCurrentContext() 
    CGContextSetLineJoin ctx, join_type
    CGContextSetLineWidth ctx, 20
    CGContextMoveToPoint ctx, x - 140, y + 100
    CGContextAddLineToPoint ctx, x, y
    CGContextAddLineToPoint ctx, x + 140, y + 100
    CGContextStrokePath ctx
  end

  def draw_rect_using_path(rect)
    # path == buffer storing image for willing flush into screen
    # construct path
    path = CGPathCreateMutable()
    CGPathAddRect path, nil, [[(rect.size.width / 2) - 75,100], [150, 150]]

    # get ctx
    ctx = UIGraphicsGetCurrentContext()

    # shadow
    CGContextSetShadowWithColor ctx, [10, 20], 25, UIColor.redColor.CGColor

    # procedure
    CGContextAddPath ctx, path
    UIColor.yellowColor.setFill
    UIColor.blackColor.setStroke
    CGContextSetLineWidth ctx, 8
    CGContextDrawPath ctx, KCGPathFillStroke

  end

  def draw_gradient(rect)
    start_color = UIColor.orangeColor
    start_components = CGColorGetComponents start_color
    end_color = UIColor.blueColor
    end_components = CGColorGetComponents end_color
  end
end
