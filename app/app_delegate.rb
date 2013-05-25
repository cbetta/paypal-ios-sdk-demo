class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    @payments_controller = PaymentsController.alloc.initWithNibName(nil, bundle: nil)


    @window.rootViewController = @payments_controller

    true
  end
end
