# frozen_string_literal: true

require_relative "rulers/version"

module Rulers
  class Error < StandardError; end
  
  class Application
    def call(env)
      run proc {
        [200, {'content-type' => 'text/html'}, 
          ['Hello World from the Gem']]
      }
    end
  end
end
