module HTML
  class Tag
    def self.generate_tag(tag, params, offset=0)
      unless params.nil? || params[tag.to_sym].nil?
        html = "<#{tag}"
        params[tag.to_sym].each do |k,v|
          next if v.class == Hash
          if v.class == Array
            ## (mod #{v.count})
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
      thead = generate_tag("thead", params)
      thead += generate_tag("tr", params[:thead])
      keys.each do |key|
        thead += "#{generate_tag("th", params[:thead])}#{key}</th>"
      end
      thead += "</tr></thead>"
      return thead
    end
    def self.table_body(rows, params)
      tbody = generate_tag("tbody", params)
      tr_i = 0
      rows.each do |row|
        tbody += generate_tag("tr", params[:tbody], tr_i)
          td_i = 0
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
end
