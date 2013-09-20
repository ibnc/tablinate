module Head
  def build_head(columns, params={})
    tr_params = params ? params.delete(:tr) : {}
    thead = Tag.new("thead", "", params)
    thead.children << build_head_rows(columns, tr_params)
    thead
  end

  def build_head_rows(columns, params={})
    th_params = params ? params.delete(:th) : {}
    tr = Tag.new("tr", "", params)
    columns.each do |column|
      th = Tag.new("th", column, th_params)
      tr.children << th
    end
    tr
  end
end
