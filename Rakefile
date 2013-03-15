# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'

Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'Wuz Ma Sprint'
  app.prerendered_icon = true
  app.detect_dependencies = true
  app.frameworks = ["CoreGraphics", "Foundation", "UIKit", "MapKit"]

  app.pods do
    pod 'ECSlidingViewController'
  end

  app.vendor_project('vendor/KMLParser', :static)
end


