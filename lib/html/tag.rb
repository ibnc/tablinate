module HTML
  class Tag

    def self.generate(tag_name, params, offset=0)
      if params then
        html = "<#{tag_name}"
        html += assign_parameters(params[tag_name.to_sym], offset)
        html += ">"
      else
        "<#{tag_name}>"
      end
    end
    
    def self.assign_parameters(params, offset=0)
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

    def self.generate_end(tag)
      "</#{tag}>"
    end

  end
end
