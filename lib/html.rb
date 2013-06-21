require 'html/tag'
module HTML

  def self.table(objects, params)
    table = Tag.generate("table", params)
    table += table_head(objects[0].keys, params)
    table += table_body(objects, params)    
    table += Tag.generate_end("table")
    #try to format the table
    begin
      format_html(table)
    rescue Exception 
      table
    end
  end

  def self.table_head(keys, params)
    thead = Tag.generate("thead", params)
    thead += Tag.generate("tr", params)
    keys.each do |key|
      thead += Tag.generate("th", params[:thead])
      thead += key.to_s
      thead += Tag.generate_end("th")
    end
    thead += Tag.generate_end("tr")
    thead += Tag.generate_end("thead")
    return thead
  end
  
  def self.table_body(rows, params)
    tbody = Tag.generate("tbody", params)
    tr_offset = 0
    rows.each do |row|
      tbody += Tag.generate("tr", params[:tbody], tr_offset)
        td_offset = 0
        row.each do |k,v|
          tbody += Tag.generate("td", params[:tbody], td_offset)
          tbody += v
          tbody += Tag.generate_end("td")
          td_offset += 1
        end
      tbody += Tag.generate_end("tr")
      tr_offset += 1
    end
    tbody += Tag.generate_end("tbody")
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

end
