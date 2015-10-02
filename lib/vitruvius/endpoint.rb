module Vitruvius
  class Endpoint
    attr_reader :verb, :path

    def initialize(verb:, path:, body_parser:)
      @verb = verb
      @path = path
      @body_parser = body_parser
    end

    def body
      @body_parser.body
    end
  end
end
