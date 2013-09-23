module Tbody
  def build_body(values, params={})
    tr_params = params ? params.delete(:tr) : {}
    tbody = Tag.new("tbody", "", params)
    tbody.children.concat build_body_rows(values, tr_params)
    return tbody
  end

  def build_body_rows(rows, params={})
    td_params = params ? params.delete(:td) : {}
    trs = []
    rows.each do |row|
      tr = Tag.new("tr", "", params)
      tr.children.concat build_row_entries(row, td_params)
      trs << tr
    end
    trs
  end

  def build_row_entries(row, params={})
    tds = []
    row.each do |key, value|
      td = Tag.new("td", value, params)
      tds << td
    end
    return tds
  end
end
