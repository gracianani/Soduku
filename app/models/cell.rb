class Cell < ActiveRecord::Base
  #def initialize(values)
  #  raise Invalid, "Grid is the wrong size"+values.size().to_s unless values.length == 9

  #  @values = values
  #  @current_values = @values
  #end
  
  belongs_to :puzzle
  
 # def values
 #   @values
 # end
  
 # def values=(new_values)
 #   @values = new_values
 # end
  
  def [] (index)
    cell_value.split(//)[index.to_i]
  end
  
 # def current_vales
 #   @current_values
 # end
  
 # def []= (index,new_value)
 #   a = @current_values.split(//)
 #   a[index] = new_value.to_s
 #   @current_values = a.join()
 # end
  
  def include? (value)
    cell_value.include? value.to_s
  end
end