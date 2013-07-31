require 'json'
require 'tag'
require 'table/head'
require 'table/body'
require 'table'
require 'tablinate/array'
## Thoughts:
# Support column summing?
# TODO: Support hidden columns?
module Tablinate
  #turns an ActiveRecord::Relation into an array of hashes.
  def self.generate_table(objects, params={})
    Table.build(self.parse_objects(objects), params)
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
