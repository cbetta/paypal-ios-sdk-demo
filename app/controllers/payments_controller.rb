class PaymentsController < UIViewController
  CLIENT_ID = "12345667"
  RECEIVER_EMAIL = "seller@example.com"

  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor

    @button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button.setTitle "Pay!", forState: UIControlStateNormal
    @button.sizeToFit
    @button.center = CGPointMake(self.view.frame.size.width / 2, @button.center.y+100)

    self.view.addSubview(@button)

    @button.when(UIControlEventTouchUpInside) do
      launch_payment_view

    end
  end

  def launch_payment_view
    @payment = PayPalPayment.new
    @payment.amount = 100
    @payment.currencyCode = "USD"
    @payment.shortDescription = "iPod"

    if @payment.processable
      PayPalPaymentViewController.setEnvironment PayPalEnvironmentNoNetwork
      PayPalPaymentViewController.prepareForPaymentUsingClientId CLIENT_ID;

      controller = PayPalPaymentViewController.alloc.initWithClientId CLIENT_ID,
                        receiverEmail: RECEIVER_EMAIL,
                        payerId: "customer@example.com",
                        payment: @payment,
                        delegate: self

      self.presentViewController controller, animated:true, completion: nil
    end
  end

  def payPalPaymentDidComplete completedPayment
    # TODO: verify payment here
    self.dismissViewControllerAnimated(true, completion:nil)
  end

  def payPalPaymentDidCancel
    self.dismissViewControllerAnimated(true, completion:nil)
  end

end