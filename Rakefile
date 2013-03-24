# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'

def running_specs?
  ARGV.join(' ') =~ /spec/
end

def running_cukes?
  ARGV.join(' ') =~ /frank/
end

if running_cukes? || running_specs?
  Bundler.require :default, :test
else
  Bundler.require
end

Motion::Project::App.setup do |app|
  app.name = 'Wuz Ma Sprint'
  app.prerendered_icon = true
  app.frameworks = ["CoreGraphics", "Foundation", "UIKit", "MapKit"]

  app.pods do
    pod 'ECSlidingViewController'
  end

  app.files << './spec/stubs/web_stubs.rb' if running_cukes?

  p app.files

  app.vendor_project('vendor/KMLParser', :static)
end

