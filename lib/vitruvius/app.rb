require "sinatra"

module Vitruvius
  class App
    def initialize(parser)
      @endpoints = parser.endpoints
    end

    def build
      app = Class.new(Sinatra::Base)
      @endpoints.each do |endpoint|
        app.public_send(endpoint.verb, endpoint.path) { endpoint.body }
      end

      app
    end
  end
end
