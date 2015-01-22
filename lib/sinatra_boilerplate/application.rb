# encoding: utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/contrib'
require 'sinatra/partial'

require 'sinatra_boilerplate/tab1'
require 'sinatra_boilerplate/helpers/html_helper'

module SinatraBoilerplate
  class Application < Sinatra::Base
    include SinatraBoilerplate::Tab1
    include SinatraBoilerplate::Helpers::HtmlHelper

    # for "sinatra/content-for"
    register Sinatra::Contrib

    # for "partial 'some_partial', template_engine: :erb"
    register Sinatra::Partial
    set :partial_template_engine, :erb

    # setting for directory path
    set :root, File.join(File.dirname(__FILE__), "..", "..")
    set :views, Proc.new { File.join(root, "views") }

    get '/' do
      @navbar_button_active = "navbar_button_home"
      @title = site_title("")
      erb :index
    end

    get '/tab1' do
      @navbar_button_active = "navbar_button_tab1"
      @title = site_title("Tab1")
      erb :"tab1", locals: {}
    end

  end
end
