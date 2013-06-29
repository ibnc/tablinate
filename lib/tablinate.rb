require 'json'
require 'html'
require 'html/tag'
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
