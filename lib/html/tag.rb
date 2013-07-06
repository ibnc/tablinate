module HTML
  class Tag

    attr_accessor :tag_content, :tag_name

    def initialize(tag_name)
      self.tag_name = tag_name
      self.tag_content = "<#{tag_name}>"
    end

    def assign_parameters(params, offset=0)
      if params && params[self.tag_name.to_sym] then
        self.tag_content = self.tag_content.chop
        params[self.tag_name.to_sym].each do |param, value|
          next if value.class == Hash
          if value.class == Array then
            self.tag_content += " #{param}='#{value[ offset % value.count ]}'" 
          else
            self.tag_content += " #{param}='#{value}'"
          end
        end
        self.tag_content += ">"
      end
      return self
    end

    def append_end_tag
      self.tag_content += "</#{self.tag_name}>"
    end

    def to_s
      self.tag_content
    end

    def append_sub_tag(tag_object)
      self.tag_content += tag_object.tag_content
    end

    def append_value(value)
      self.tag_content += value.to_s
    end

  end
end
