# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bubble-wrap'

Motion::Project::App.setup do |app|
  app.name = 'paypal-ios-sdk-demo'

  app.vendor_project(
    'vendor/PayPalMobile',
    :static,
    cflags: "-lstdc++ -ObjC"
  )

  app.libs << '/usr/lib/libxml2.2.dylib'

  app.frameworks << "AVFoundation"
  app.frameworks << "AudioToolbox"
  app.frameworks << "CoreMedia"
  app.frameworks << "CoreVideo"
  app.frameworks << "MessageUI"
  app.frameworks << "MobileCoreServices"
  app.frameworks << "OpenGLES"
  app.frameworks << "QuartzCore"
  app.frameworks << "Security"

end
