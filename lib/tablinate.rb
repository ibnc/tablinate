require 'json'
require File.dirname(__FILE__)+'/html.rb'
## Thoughts:
# Support column summing?
module Tablinate

  def self.generate_table(objects, params={})
    #turns an ActiveRecord::Relation into an array of hashes.
    objects = JSON.parse(objects) if objects.class == String
    objects = objects.collect{ |x| x.attributes } unless objects.class == Array
    table = HTML.table(objects, params)
  end

end
