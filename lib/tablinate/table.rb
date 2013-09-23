class Table < Tag
  include Thead
  include Tbody
  
  def initialize(values, params={})
    thead = build_head(values[0].keys, thead_params(params))
    tbody = build_body(values, tbody_params(params))
    super("table", "", params, [thead, tbody])
  end

  private
    def thead_params params
      params ? params.delete(:thead) : {}
    end

    def tbody_params params
      params ? params.delete(:tbody) : {}
    end
end
