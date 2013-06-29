module HTML
  class Tag

    attr_accessor :html, :tag_name, :value

    def initialize(tag_name)
      self.tag_name = tag_name
      self.html = "<#{tag_name}>"
    end

    def assign_parameters(params, offset=0)
      if params && params[self.tag_name.to_sym] then
        self.html = self.html.chop
        params[self.tag_name.to_sym].each do |param, value|
          next if value.class == Hash
          if value.class == Array then
            self.html += " #{param}='#{value[ offset % value.count ]}'" 
          else
            self.html += " #{param}='#{value}'"
          end
        end
        self.html += ">"
      end
      return self
    end

    def append_end_tag
      self.html += "</#{self.tag_name}>"
    end

    def to_s
      return self.html
    end

    def append_sub_tag(tag_object)
      if self.html.include?("</#{self.tag_name}>") then
        self.html = self.html.gsub(/\<\/#{self.tag_name}\>/, '')
        self.html += tag_object.html
        append_end_tag()
      else
        self.html += tag_object.html
      end
      self.html
    end

  end
end
