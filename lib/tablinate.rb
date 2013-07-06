require 'json'
require File.dirname(__FILE__)+'/html.rb'
require File.dirname(__FILE__)+'/html/tag.rb'
## Thoughts:
# Support column summing?
#TODO: Throw meaningful errors
module Tablinate

  #turns an ActiveRecord::Relation into an array of hashes.
  def self.generate_table(objects, params={})
    HTML.table(self.parse_objects(objects), params)
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
