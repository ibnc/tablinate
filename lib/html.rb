module HTML

  def self.table(objects, params)
    table = Tag.new("table").assign_parameters(params)
    table.html += table_head(objects[0].keys, params)
    table.html += table_body(objects, params)    
    table.append_end_tag 
    #try to format the table
    begin
      format_html(table)
    rescue Exception 
      table.html
    end
  end

  def self.table_head(keys, params)
    thead = Tag.new("thead").assign_parameters(params)
    tr = Tag.new("tr").assign_parameters(params)
    keys.each do |key|
      th = Tag.new("th").assign_parameters( params[:thead])
      th.html += key.to_s
      th.append_end_tag
      tr.html += th.html
    end
    tr.append_end_tag
    thead.html += tr.html
    thead.append_end_tag
    return thead.html
  end
  
  def self.table_body(rows, params)
    tbody = Tag.new("tbody").assign_parameters(params)
    tr_offset = 0
    rows.each do |row|
      tr = Tag.new("tr").assign_parameters(params[:tbody], tr_offset)
        td_offset = 0
        row.each do |k,v|
          td = Tag.new("td").assign_parameters(params[:tbody], td_offset)
          td.html += v
          td.append_end_tag 
          td_offset += 1
          tr.html += td.html
        end
      tr.append_end_tag
      tr_offset += 1
      tbody.html += tr.html
    end
    tbody.append_end_tag
    return tbody.html
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
