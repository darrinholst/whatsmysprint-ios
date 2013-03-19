# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require File.join(File.expand_path(File.dirname(__FILE__)), "lib", "rake_override")
require 'motion/project'
require 'bundler'

Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'Wuz Ma Sprint'
  app.prerendered_icon = true
  app.frameworks = ["CoreGraphics", "Foundation", "UIKit", "MapKit"]

  app.pods do
    pod 'ECSlidingViewController'
  end

  app.vendor_project('vendor/KMLParser', :static)
end

namespace :spec do
  override_task :simulator do
    Bundler.require(:test)
    Rake::Task["spec:simulator:original"].execute
  end
end

desc "run the cucumber tests"
task :cucumber do
  Bundler.require(:test)
  Rake::Task["frank:run"].execute
end
