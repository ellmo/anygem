require "rails/generators/base"

module Anygem
  module Generators
    class ServiceGenerator < Rails::Generators::Base
      SERVICE_SUFFIX = "service".freeze

      source_root File.join(__dir__, "templates")

      argument :name, required: true
      class_option :nosuffix, aliases: "-n", type: :boolean, default: false

      def copy_service_template
        template "named_service.rb", "app/services/#{service_path}.rb"
      end

    protected

      def path_parts
        name.split(":").reject(&:blank?)
      end

      def service_path
        "#{directories}/#{file_name.underscore}"
      end

      def directories
        @directories ||= path_parts[0..-2].join("/")
      end

      def file_name
        suffix = options[:nosuffix] ? "" : "_#{SERVICE_SUFFIX}"
        path_parts.last + suffix
      end
    end
  end
end
