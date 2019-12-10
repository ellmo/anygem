require "rails/generators/base"

module Anygem
  module Generators
    class ServiceGenerator < Rails::Generators::Base
      SERVICE_SUFFIX = "_service".freeze

      source_root File.join(__dir__, "templates")

      def copy_service_template
        compose_path
        template "named_service.rb", "app/services/#{service_path}.rb"
      end

      def compose_path
        @path_parts     = args[0].split(":").reject(&:blank?)
        @file_name      = (@path_parts.pop + SERVICE_SUFFIX)
        @dir            = @path_parts.join("/")
      end

      def service_path
        "#{@dir}/#{@file_name.underscore}"
      end

      def service_name
        @service_name ||= service_path.camelize
      end
    end
  end
end
