class MenuController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.redColor
    @secondary_screen = SecondaryScreen.new
  end

end