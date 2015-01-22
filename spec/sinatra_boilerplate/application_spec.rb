# encoding: utf-8
require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

require 'sinatra_boilerplate/application'

describe SinatraBoilerplate::Application do
  include Rack::Test::Methods

  def app
    @app ||= SinatraBoilerplate::Application
  end

  %w{
    /
    /tab1
    }.each do |uri|
    describe "'#{uri}' page" do
      it "return 200 OK" do
        get uri
        expect(last_response).to be_ok
      end
    end
  end
end
