module Head
  def build_head(columns, params={})
    thead = Tag.new("thead").assign_parameters(params)
    thead << build_head_rows(columns, params[:thead])
    thead.append_end_tag
    thead
  end

  def build_head_rows(columns, params={})
    tr = Tag.new("tr").assign_parameters(params)
    columns.each do |column|
      th = Tag.new("th").assign_parameters(params)
      th.value = column.to_s
      th.append_end_tag
      tr << th
    end
    tr.append_end_tag
    tr
  end
end
