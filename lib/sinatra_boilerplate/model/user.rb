require 'active_record'
require 'bcrypt'

module SinatraBoilerplate
  module Model
    class User < ActiveRecord::Base
      include BCrypt
      def password
        @password ||= Password.new(password_digest)
      end

      def password=(new_password)
        @password = Password.create(new_password)
        self.password_digest = @password
      end

    end
  end
end
