module Body
 def build_body(values, params={})
    tbody = Tag.new("tbody").assign_parameters(params)
    tr_offset = 0
    tbody << build_body_rows(values, params[:tbody])
    tbody.append_end_tag
    return tbody
 end

 def build_body_rows(rows, params={}, offset=0)
   trs = []
  rows.each do |row|
    tr = Tag.new("tr").assign_parameters(params, offset)
    tr <<  build_row_entries(row, params)
    tr.append_end_tag
    offset += 1
    trs.push(tr)
   end
  return trs
 end

 def build_row_entries(row, params={}, offset=0)
    tds = []
    row.each do |k,v|
      td = Tag.new("td").assign_parameters(params, offset)
      td.value = v
      td.append_end_tag 
      tds.push(td)
      offset += 1
    end
    return tds
 end
end
