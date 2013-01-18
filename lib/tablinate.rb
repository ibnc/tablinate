require 'json'
require File.dirname(__FILE__)+'/html.rb'
## Thoughts:
# Support column summing?
module Tablinate

  def self.generate_table(object, params={})
    #turns an ActiveRecord::Relation into an array of hashes.
    object = JSON.parse(object) if object.class == String
    object = object.collect{ |x| x.attributes } unless object.class == Array
    table = HTML::Tag.generate("table", params)
    #thead
    table += HTML::Tag.table_head(object[0].keys, params)
    #tbody
    table += HTML::Tag.table_body(object, params)    
    #tfoot?
    table += "</table>"
    begin
      HTML.format_html(table)
    rescue Exception 
      table
    end
  end

end
