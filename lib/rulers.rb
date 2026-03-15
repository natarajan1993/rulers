# frozen_string_literal: true

require_relative "rulers/version"
require_relative "rulers/routing"
require_relative "rulers/util"
require_relative "rulers/dependencies"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        [404,
        {'content-type' => 'text/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act.nil? ? "index" : act)
      [200, {'content-type' => 'text/html'},
        [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end