# encoding: utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/contrib'
require 'sinatra/partial'
require 'active_record'

require 'sinatra_boilerplate/tab1'
require 'sinatra_boilerplate/helpers/html_helper'
require 'sinatra_boilerplate/model/user'

module SinatraBoilerplate
  class Application < Sinatra::Base
    include SinatraBoilerplate::Tab1
    include SinatraBoilerplate::Helpers::HtmlHelper

    # initialize db
    ActiveRecord::Base.configurations = YAML.load_file('conf/database.yml')
    ActiveRecord::Base.establish_connection(:development)

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

    get '/users' do
      @navbar_button_active = "navbar_button_users"
      @title = site_title("Users")
      @users = SinatraBoilerplate::Model::User.all
      erb :"users"
    end

    post '/users' do
      id = params["id"]
      name = params["name"]
      email = params["email"]
      # check params
      err_message =  check_create_user(id, name, email)
      return err_message unless err_message.empty?

      # create user
      begin
        user = SinatraBoilerplate::Model::User.new(id: id, name: name, email: email)
        if user.save
          @navbar_button_active = "navbar_button_users"
          @title = site_title("Users")
          @users = SinatraBoilerplate::Model::User.all
          erb :"users"
        else
          "Error user.save"
        end
      rescue ActiveRecord::RecordNotUnique => e
        "This ID can't use."
      rescue => e
        e
      end
    end

    def check_create_user(id, name, email)
      if id.empty?
        "ID is required."
      elsif name.empty?
        "Name is required"
      elsif email.empty?
        "E-mail is required"
      else
        ""
      end
    end

  end
end
