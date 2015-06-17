# test_helper.rb
ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new

require File.expand_path '../../app.rb', __FILE__