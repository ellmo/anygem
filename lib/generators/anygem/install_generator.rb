require "rails/generators/base"

module Anygem
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.join(__dir__, "templates")

      def copy_service
        copy_file "any_service.rb", "app/services/any_service.rb"
      end
    end
  end
end
