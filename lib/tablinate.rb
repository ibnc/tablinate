require 'json'
require 'html'
require 'html/tag'
## Thoughts:
# Support column summing?
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
      return objects
    else
     return objects.collect{ |x| x.attributes }
    end
  end

end
