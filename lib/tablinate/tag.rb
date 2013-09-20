class Tag
  attr_reader :name
  attr_accessor :children, :text, :attributes

  def initialize(name, text="", attributes={}, children=[])
    @name = name.to_sym
    @attributes = attributes || {}
    @children = children || []
    @text = text.to_s
  end

  def to_s
    build_open_tag + text + add_sub_tags + build_close_tag
  end
  alias_method :to_html, :to_s

  private
    def build_close_tag
      "</#{name}>"
    end

    def add_sub_tags
      children.map {|tag| tag.to_html }.join(" ")
    end

    def build_open_tag
    "<#{name}" + attributes_to_html + ">"
    end

    def attributes_to_html
      attributes.map do |key,value| 
        case value
        when String
          " #{key}='#{value}'"
        when Array
        " #{key}='#{value.join(" ")}'"
        end
      end.join(" ")
    end
end
