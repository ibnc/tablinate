## Thoughts:
# Support column summing?
module Tablinate
#  initalizer "tablinate" do |app|
#  end
  def self.parse_table_parameters(params={})
  end
  ## A method that determines whether or not to apply params to a tag.
  ## If they are to be applied, apply
  #TODO: get a better function name
  def self.generate_tag(tag, params, offset=0)
    unless params.nil? || params[tag.to_sym].nil?
      html = "<#{tag}"
      params[tag.to_sym].each do |k,v|
        if v.class==[].class
          ## mod #{v.count}
          adjusted_offset = offset % v.count
          html+= " #{k}='#{v[adjusted_offset]}'"
        else
          html+= " #{k}='#{v}'"
        end
      end
      html+=">"
    else 
      "<#{tag}>"
    end
  end
  def self.table_head(keys, params)
    params = {} if params.nil?
    thead = generate_tag("thead", params)
    thead += generate_tag("tr", params[:thead])
    keys.each do |key|
      thead += "#{generate_tag("td", params[:thead])}#{key}</td>"
    end
    thead += "</thead>"
    return thead
  end
  def self.table_body(rows, params)
    tbody = generate_tag("tbody", params)
    rows.each do |row|
      tbody += generate_tag("tr", params[:tbody])
        i = 0
        #there needs to be some way to determinte the max offset and reset back to 0 when that number is reached. 
        row.each do |k,v|
          tbody += "#{generate_tag("td", params[:tbody], i)}#{v}</td>"
          i += 1
        end
      tbody +="</tr>"
    end
    tbody +="</tbody>"
  end
  #the extraneous args are excluded columns?
  def self.generate_table(object, params, *args)
    thead = table_head(object[0].keys, params[:thead])
    tbody = table_body(object, params)
    raise tbody.inspect
      
    objects[0].attributes.keys.collect{ |key| }
    objects.each do |object|
      
    end
  end
end
table_params = { 
  :table => { :class => "eek", :id => 'rawr' },
  :tbody => {
    :tr => { :class => [ 'class1', 'class2', 'class3' ], :id => 'meow' },
    :td => { :class => 'rawr', :id => [1,2,3] }
  }
}
table = [
  { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
  { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
  { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
  { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' }
]
Tablinate.generate_table table, table_params
