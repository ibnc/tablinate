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
        next if v.class == Hash
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
    tr_i = 0
    rows.each do |row|
      tbody += generate_tag("tr", params[:tbody], tr_i)
        td_i = 0
        #there needs to be some way to determinte the max offset and reset back to 0 when that number is reached. 
        row.each do |k,v|
          tbody += "#{generate_tag("td", params[:tbody], td_i)}#{v}</td>"
          td_i += 1
        end
      tbody +="</tr>"
      tr_i += 1
    end
    tbody +="</tbody>"
    return tbody
  end
  def self.format_html(html)
  #Finds html tags via regex and adds whitespace so
  #that the table doesn't look disgusting in the 
  #source code.
    html.split('')
    tags = html.scan(%r{</?[^>]+?>}).uniq
    tags.each do |tag|
      if tag.length > 5 || tag.include?("/") || tag.include?("tr>")
        html = html.gsub(tag,"#{tag}\n") 
      else
        html = html.gsub(tag,"\s\s#{tag}")
      end
    end
    return html
  end
  def self.generate_table(object, params)
    table = generate_tag("table", params)
    #thead
    table += table_head(object[0].keys, params[:thead])
    #tbody
    table += table_body(object, params)    
    #tfoot?
    table += "</table>"
    begin
      format_html(table)
    rescue
      table
    end
  end
end
