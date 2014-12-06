# Readme
# This application lists all fonts in the UIScrollView 
# by using low-level method, drawRect
# this app is in CG-Animation part
# use UITextView

# TODO enhancement : 
# programatic height of FontView
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
    self.view.backgroundColor = UIColor.whiteColor 
    fv = FontView.alloc.initWithFrame [[0,0], [250, 3700]]
    fv.backgroundColor = UIColor.redColor
    sv = UIScrollView.alloc.initWithFrame [[20, 20],[250, 300]]
    sv.backgroundColor = UIColor.grayColor
    sv.contentSize = fv.frame.size
    ap fv.frame
    sv.addSubview fv
    self.view.addSubview sv
    t = UITextView.alloc.initWithFrame [[20, 330], [250, 200]]
    t.backgroundColor = UIColor.cyanColor
    t.text = %Q{
      In this example, we are going to place two views on top of each other, 
      but we are going to make the view on the bottom have a very high elasticity 
      and the view on top have quite a low elasticity. This way, 
      when both views hit the bottom of the screen, where they will collide with 
      the bottom bounds of the screen, the view on the bottom will jump 
      around and bounce much more, due to its high elasticity, than the view on 
      the top. So let’s get started by defining the animator and other 
      properties of our view controller:
    }
    self.view.addSubview t
  end
end  

class TestView < UIView
  def drawRect(rec)
    ap rec 
    self.frame = [[20, 20], [100, 300]]
  end
end

class FontView < UIView

  def initWithFrame(frame)
    ap frame
    super(frame)
    self 
  end

  def drawRect(rec)
    self.backgroundColor = UIColor.yellowColor
    allfonts = []
    fontsize = 10
    offset_new_line = fontsize + fontsize*0.5 

    UIFont.familyNames.each do |family|
      UIFont.fontNamesForFamilyName(family).each do |font_name|
         allfonts << font_name
      end
    end

    # TODO calc frame
    max_height = allfonts.count * offset_new_line
    ap "max height: #{max_height}"
    # ap allfonts.count
    # self.frame = [self.frame.origin, [self.frame.size.width, max_height]]

    # set color of drawing font
    c = UIColor.colorWithRed 0, green: 1, blue: 0.5, alpha: 1
    c.set

    img = UIImage.imageNamed("test.jpg")
    img.drawAtPoint [0,100]
    img.drawInRect [[50, 1300], [150, 250]]


    y_point = 0
    i = 0
    allfonts.each do |font_name|
      i += 1
      font = UIFont.fontWithName(font_name, size: fontsize)
      str = "#{i}. #{font_name} ภาษาไทย"
      y_point += offset_new_line
      str.drawAtPoint([10, y_point],
                      withFont: font)
    end

    # self.frame = [[self.position.x, self.position.y], [self.frame.size.width, y_point]]
    # self.contentSize = [self.frame.size.width, y_point]
    # self.contentInset = [20, 20, 200, 20]
    # self.pagingEnabled = true
    # self.scrollEnabled = true
    # test = UIView.alloc.initWithFrame [[0,0], [300,500]]
    # test.backgroundColor = UIColor.redColor
    # self.addSubview test
    # self.delegate = self
  end

  def scrollViewDidScroll(sv)
    # self.setContentOffset(sv.contentOffset, animated: true)
    self.alpha = 0.5
    # ap "content offset x:#{sv.contentOffset.x} y:#{sv.contentOffset.y}"
    # ap "content size w:#{sv.contentSize.width} h:#{sv.contentSize.height}"
    # ap "content inset t:#{sv.contentInset.top} b:#{sv.contentInset.bottom}"
  end

  def scrollViewDidEndDecelerating(sv)
    self.alpha = 1
  end

end
