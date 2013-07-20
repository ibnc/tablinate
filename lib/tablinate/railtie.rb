module Tablinate
  class Railtie < Rails::Railtie
    initializer "tablinate" do |app|
      ActiveSupport.on_load :active_record do
        require 'tablinate/active_record'
      end
    end
  end
end 

