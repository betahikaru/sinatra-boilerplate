# encoding: utf-8

module SinatraBoilerplate
  module Helpers
    module HtmlHelper

      def site_title(page_name)
        site_name = "Sinatra Boilerplate"
        if page_name == site_name or page_name == ""
          site_name
        else
          page_name + "-" + site_name
        end
      end

    end
  end
end
