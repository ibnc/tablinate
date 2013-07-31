class Table
  include Head
  include Body
  
  attr_accessor :table

  def initialize(params={})
    @table = Tag.new("table").assign_parameters(params)
  end

  def self.build(values, params={})
    table = self.new(params[:table])
    table.build_elements(values, params)
    table.build_structure()
    #try to format the table
    begin
      format_html(table.table)
    rescue Exception 
      table.table
    end
  end

  def build_elements(table_values, params={})
    @thead = build_head(table_values[0].keys, params)
    @tbody = build_body(table_values, params)
  end

  def build_structure
    @table << @thead
    @table << @tbody
    @table.append_end_tag
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
