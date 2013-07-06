require 'json'
require File.dirname(__FILE__)+'/html.rb'
require File.dirname(__FILE__)+'/html/tag.rb'
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
