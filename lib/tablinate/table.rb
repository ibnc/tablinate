class Table
  include Head
  include Body
  
  attr_accessor :table

  def initialize(params={})
    @table = Tag.new("table", "", params)
  end

  def self.build(values, params={})
    thead_params = params ? params.delete(:thead) : {}
    tbody_params = params ? params.delete(:tbody) : {}
    table = self.new(params)
    table.build_elements(values, tbody_params, thead_params)
    table.build_structure()
    #try to format the table
    begin
      format_html(table.table)
    rescue Exception 
      table.table
    end
  end

  def build_elements(table_values, tbody_params={}, thead_params={})
    @thead = build_head(table_values[0].keys, thead_params)
    @tbody = build_body(table_values, tbody_params)
  end

  def build_structure
    @table.children << @thead
    @table.children << @tbody
  end
  
  def self.format_html(html)
  #Finds html tags via regex and adds whitespace so
  #that the table doesn't look disgusting in the 
  #source code.
    html.split('')
    tags = html.scan(%r{</?[^>]+?>}).uniq
    tags.each do |tag|
      if tag.length > 5 || tag.include?("/") || tag.include?("tr>") then
        html = html.gsub(tag,"#{tag}\n") 
      else
        html = html.gsub(tag,"\s\s#{tag}")
      end
    end
    return html
  end
end
