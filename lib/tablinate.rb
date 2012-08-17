## Thoughts:
# Support column summing?
module Tablinate
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
      thead += "#{generate_tag("th", params[:thead])}#{key}</th>"
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
    return tbody
  end
  #the extraneous args are excluded columns?
  def self.generate_table(object, params, *args)
    thead = table_head(object[0].keys, params[:thead])
    tbody = table_body(object, params)    
    #account for table options
    if params[:table].nil?
      html = "<table>"+thead+tbody+"</table>"
      return html
    else
      html = "<table "
      params[:table].each do |k,v|
        html += "#{k}='#{v}',"
      end
      html += ">"+thead+tbody+"</table>"
      return html
    end
  end
end
#table_params = { 
#  :table => { :class => "eek", :id => 'rawr' },
#  :tbody => {
#    :tr => { :class => [ 'class1', 'class2', 'class3' ], :id => 'meow' },
#    :td => { :class => 'rawr', :id => [1,2,3] }
#  }
#}
#table = [
#  { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
#  { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
#  { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' },
#  { :column1 => 'value1', :column2 => 'value2', :column3 => 'value3' }
#]
#Tablinate.generate_table table, table_params
