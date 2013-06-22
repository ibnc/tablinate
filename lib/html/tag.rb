module HTML
  class Tag

    attr_accessor :html, :tag_name, :value

    def initialize(tag_name)
      self.tag_name = tag_name
      self.html = "<#{tag_name}>"
    end
    
    def self.hassign_parameters(params, offset=0)
      html = ""
      if params then
        params.each do |param, value|
          next if value.class == Hash
          if value.class == Array then
            html += " #{param}='#{value[ offset % value.count ]}" 
          else
            html += " #{param}='#{value}'"
          end
        end
      end
      return html
    end

    def assign_parameters(params, offset=0)
      self.html = self.html.chop
      if params && params[self.tag_name.to_sym] then
        params[self.tag_name.to_sym].each do |param, value|
          next if value.class == Hash
          if value.class == Array then
            self.html += " #{param}='#{value[ offset % value.count ]}'" 
          else
            self.html += " #{param}='#{value}'"
          end
        end
        
      end
      self.html += ">"
    end

    def self.generate_end(tag)
      "</#{tag}>"
    end


  end
end
