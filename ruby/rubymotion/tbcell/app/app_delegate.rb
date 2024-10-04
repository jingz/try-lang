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
    super
    @table = UITableView.alloc.initWithFrame self.view.bounds, style: UITableViewStylePlain
    # cell_template = UITableViewCell.initWithStyle UITableViewCellStyleSubtitle, "mycell"
    @table.registerClass UITableViewCell.alloc.class, forCellReuseIdentifier: "mycell"
    @table.dataSource = self
    self.view.addSubview @table
  end

  def tableView(tv, numberOfSectionInTableView: ind)
    20 
  end

  def tableView(tv, numberOfRowsInSection: ind)
    20 
  end

  def sectionIndexTitlesForTableView(tv)
    ("a".."z").to_a
  end

  def tableView(tv, cellForRowAtIndexPath: ind)
    cell = UITableViewCell.alloc.initWithStyle UITableViewCellStyleDefault, reuseIdentifier: "mycell" 
    l = UILabel.alloc.initWithFrame [[50,4],[200, 20]]
    l.text = "custom text #{ind.row}"
    cell.contentView.addSubview l
    img = UIImageView.alloc.initWithFrame [[250, 4],[30,30]]
    img.image = UIImage.imageNamed("thumbs_up.png")
    cell.contentView.addSubview img
    sub = UILabel.alloc.initWithFrame [[60,24],[200, 20]]
    sub.font = UIFont.italicSystemFontOfSize(10)
    sub.text = "sub font"
    cell.contentView.addSubview sub
    cell
  end

  def tableView(tv, xcellForRowAtIndexPath: ind)
    # cell = tv.dequeueReusableCellWithIdentifier "mycell", forIndexPath: ind
    cell = UITableViewCell.alloc.initWithStyle UITableViewCellStyleSubtitle, reuseIdentifier: "mycell"
    cell.textLabel.text = "Row ##{ind.row}"
    cell.detailTextLabel.text = "Detail #{ind.row}"
    cell.imageView.image = UIImage.imageNamed("thumbs_up.png")
    cell
  end
end
