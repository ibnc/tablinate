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

  def to_html
    format_html(to_s)
  end

  private
    def build_close_tag
      "</#{name}>"
    end

    def add_sub_tags
      children.map {|tag| tag.to_s }.join(" ")
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

    def format_html(html)
    #Finds html tags via regex and adds whitespace so
    #that the table doesn't look disgusting in the 
    #source code.
      tags = html.scan(%r{</?[^>]+?>}).uniq
      tags.each do |tag|
        if tag.length > 5 || tag.include?("/") || tag.include?("tr>") then
          html.gsub!(tag,"#{tag}\n") 
        else
          html.gsub!(tag,"\s\s#{tag}")
        end
      end
      return html
    end
end
