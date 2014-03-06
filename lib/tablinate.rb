require 'json'
require 'tablinate/tag'
require 'tablinate/table/thead'
require 'tablinate/table/tbody'
require 'tablinate/table'
require 'tablinate/adapters/array'
## Thoughts:
# Support column summing?
# TODO: Support hidden columns?
module Tablinate
  #turns an ActiveRecord::Relation into an array of hashes.
  def self.generate_table(objects, params={})
    Table.new(self.parse_objects(objects), params)
  end

  private 
    def self.parse_objects(objects)
      if objects.class == String then
        return JSON.parse(objects)
      elsif objects.class.to_s == "ActiveRecord::Relation"
          return objects.collect{ |x| x.attributes }
      else
        return objects
      end
    end
end

if defined?(Rails::Railtie)
  require 'tablinate/railtie'
end
