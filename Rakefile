# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'

Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'Wuz Ma Sprint'
  app.prerendered_icon = true
  app.detect_dependencies = true
  #app.files_dependencies 'app/controllers/current_sprint_controller.rb' => 'app/controllers/tab_controller.rb'

  app.pods do
    pod 'ECSlidingViewController'
  end
end

