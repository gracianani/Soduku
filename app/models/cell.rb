class Cell < ActiveRecord::Base

  belongs_to :puzzle
  
  def [] (index)
    cell_value.split(//)[index.to_i]
  end

  def []= (index, value)
    cell_value[index.to_i] = value.to_s
  end
  
  def replace (index, value)
    new_value = String.new(cell_value)
    new_value[index.to_i] = value.to_s
    new_value
  end
  
  def include? (value)
    cell_value.include? value.to_s
  end
end