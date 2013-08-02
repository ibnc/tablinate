class Tag
  attr_accessor :tag_content, :tag_name

  def initialize(tag_name)
    self.tag_name = tag_name
    self.tag_content = "<#{tag_name}>"
  end

  def assign_parameters(params={}, offset=0)
    if params && params[self.tag_name.to_sym] then
      self.tag_content = self.tag_content.chop
      params[self.tag_name.to_sym].each do |param, value|
        self << prepare_param(param.to_s, value, offset)
      end
      self.tag_content += ">"
    end
    return self
  end

  def prepare_param(name, value, offset=0)
    case value
    when Array then
      " #{name}='#{value[ offset % value.count ]}'"
    when String then
      " #{name}='#{value}'"
    else
      ""
    end
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

  def << (object)
    case object
    when Array then 
      object.each { |x| self << x }
    when Tag then
      append_sub_tag(object)
    when String then
      self.tag_content += object
    when Fixnum then
      self.tag_content += object.to_s
    end
  end

  def value=(value)
    self.tag_content += value.to_s
  end
end
