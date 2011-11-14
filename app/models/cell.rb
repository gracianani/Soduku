class Cell
  def initialize(values)
    raise Invalid, "Grid is the wrong size"+values.size().to_s unless values.length == 9

    char_to_replace = values[rand(8)].to_s()
    values = values.tr(char_to_replace,'.')
    @values = values.split(//).shuffle().join()
    @current_values = @values
  end
  
  def values
    @values
  end
  
  def values=(new_values)
    @values = new_values
  end
  
  def [] (index)
    @current_values.split(//)[index]
  end
  
  def current_vales
    @current_values
  end
  
  def []= (index,new_value)
    @current_values.split(//)[index] = new_value
  end
  
  def include? (value)
    @current_values.include? value.to_s
  end
end