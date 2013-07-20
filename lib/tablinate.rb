require 'json'
require 'html'
require 'html/tag'
require 'tablinate/array'
## Thoughts:
# Support column summing?
# TODO: Support hidden columns?
module Tablinate

  def self.generate_table(objects, params={})
    #turns an ActiveRecord::Relation into an array of hashes.
    objects = self.parse_objects(objects)
    HTML.table(objects, params)
  end

  def self.parse_objects(objects)
    if objects.class == String then
      return JSON.parse(objects)
    elsif objects.class == Array
      unless objects[0].class == Hash then
        return objects.collect{ |x| x.attributes }
      end
    end
    return objects
  end

end

if defined?(Rails::Railtie)
  require 'tablinate/railtie'
end
