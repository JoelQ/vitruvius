require "json"
require "vitruvius/endpoint"
require "vitruvius/body/json_schema"

module Vitruvius
  module Parser
    class JSONSchema
      def initialize(path)
        @json = JSON.parse(File.read(path))
      end

      def endpoints
        methods.map do |method|
          body_key = method.fetch("response").fetch("$ref")
          Endpoint.new(
            verb: method.fetch("httpMethod").downcase,
            path: method.fetch("railsRoute").gsub("(.:format)", ""),
            body_parser: Vitruvius::Body::JSONSchema.new(schema_for(body_key))
          )
        end
      end

      private

      def methods
        @json.fetch("resources").each_value.flat_map do |resource|
          resource.fetch("methods").values
        end
      end

      def schema_for(key)
        @json.fetch("schemas").fetch(key, {})
      end
    end
  end
end
