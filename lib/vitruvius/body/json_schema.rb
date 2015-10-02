require "json"

module Vitruvius
  module Body
    class JSONSchema
      DEFAULTS = {
        "string" => "abc",
        "boolean" => true,
        "integer" => 123,
        "number" => 123,
        "null" => nil,
      }

      def initialize(schema)
        @schema = schema
      end

      def body
        schema = @schema.reject { |key, value| key == "id" }
        render(schema).to_json
      end

      private

      def render(schema)
        schema.each_with_object({}) do |(key, value), body|
          type = value.fetch("type")
          if type == "array"
            body[key] = render({ "ARRAY" => value.fetch("items") }).values
          elsif type == "object"
            body[key] = render(value.fetch("properties"))
          else
            body[key] = default_value_for(type)
          end
        end
      end

      def default_value_for(type)
        DEFAULTS.fetch(type)
      end
    end
  end
end
