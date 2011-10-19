module Debugger
  @proxy_port = 43806
  singleton_class.class_eval do
    attr_reader :proxy_port
  end

  class Engine < Rails::Engine
    initializer 'debugger.start_server' do
      Debugger.start_server('127.0.0.1', Debugger.proxy_port || '43806')
    end
  end
end
