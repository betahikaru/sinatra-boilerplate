# encoding: utf-8
ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'lib', 'sinatra_boilerplate.rb')

require 'rubygems'
require 'sinatra'
require 'rspec'
require 'rack/test'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false
