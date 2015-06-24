# test_helper.rb
$:.unshift File.expand_path("./../../lib", __FILE__)

ENV['RACK_ENV'] = 'test'
require './config/environment'
require 'minitest/autorun'
require 'rack/test'
require "minitest/reporters"
Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter)

require File.expand_path '../../app.rb', __FILE__




