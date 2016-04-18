class SpamFilter
  def initialize(obj_array)
    @obj_array = obj_array
  end

  def filter(field)
    @obj_array.each_with_index do |el,index|
      if (index % 5 == 0)
        el[field] = "Sanitized Post Title"
      end
    end
    @obj_array
  end
end
