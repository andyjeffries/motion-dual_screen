class SecondaryScreen
  def initialize
    checkForSecondScreen
    setupSecondScreenListeners
  end

  def checkForSecondScreen
    if UIScreen.screens.count > 1
      secondScreen = UIScreen.screens[1]
      setupSecondScreenUI(secondScreen)
    end
  end

  def setupSecondScreenUI(screen)
    screenBounds = screen.bounds
    @secondWindow = UIWindow.alloc.initWithFrame(screenBounds)
    @secondWindow.screen = screen

    @blue_view = UIView.alloc.initWithFrame(screenBounds)
    @blue_view.backgroundColor = UIColor.blueColor
    @secondWindow.addSubview(@blue_view)
    @secondWindow.hidden = false;
  end

  def setupSecondScreenListeners
    notification_center = NSNotificationCenter.defaultCenter
    notification_center.addObserver(self, selector:"handleScreenDidConnectNotification:", name:UIScreenDidConnectNotification, object:nil)
    notification_center.addObserver(self, selector:"handleScreenDidDisconnectNotification:", name:UIScreenDidDisconnectNotification, object:nil)
  end

  def handleScreenDidDisconnectNotification(notification)
    newScreen = notification.object
    if (!@secondWindow)
      setupSecondScreenUI(newScreen)
    end
  end

  def handleScreenDidDisconnectNotification(notification)
    if (@secondWindow)
      @secondWindow.hidden = true
      @secondWindow = nil
    end
  end

end