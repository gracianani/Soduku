class Cell
  def initialize(values)
    raise Invalid, "Grid is the wrong size"+values.size().to_s unless values.length == 9

    @values = values
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
    a = @current_values.split(//)
    a[index] = new_value.to_s
    @current_values = a.join()
  end
  
  def include? (value)
    @current_values.include? value.to_s
  end
end