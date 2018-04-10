class Person

  attr_accessor :name, :age, :children, :address, :student, :correspondences

end

class Address

  attr_accessor :street, :number, :neighborhood

end

class Object

  def to_json 
    object_to_json self
  end

  private

  def array_to_json(object)
      string_json = "["
      object.each_with_index {|object_array, index_array|
        string_json += object_to_json (object_array)
        string_json += "," if index_array < object.size - 1
      }
      string_json += "]"
      string_json
  end

  def class_object_to_json(object)
      string_json = "{"
      object.instance_variables.each_with_index {|attribute, index|
        attribute_name = "\"#{attribute.to_s.delete "@"}\""
        attribute_value = object.instance_variable_get(attribute)
        string_json += "#{attribute_name}: "
        string_json += object_to_json (attribute_value)
        string_json += ", " if index < object.instance_variables.size - 1
      }
      string_json += "}"
      string_json
  end

  def object_to_json(object)
    string_json = ""
    if object.kind_of? String
      string_json += "\"#{object}\"" 
    elsif object.kind_of? Numeric
      string_json += "#{object}" 
    elsif object.kind_of? TrueClass
      string_json += "#{object}" 
    elsif object.kind_of? FalseClass 
      string_json += "#{object}"
    elsif object.kind_of? Array
      string_json += array_to_json(object)
    else
      string_json += class_object_to_json(object)
    end 
    string_json
  end

end

address = Address.new
address.street = "Joaquim Geraldo"
address.number = 10
address.neighborhood = "Centro"

correspondence1 = Address.new
correspondence1.street = "JK"
correspondence1.number = 25
correspondence1.neighborhood = "Centro"

correspondence2 = Address.new
correspondence2.street = "TN"
correspondence2.number = 30
correspondence2.neighborhood = "Centro"

person = Person.new
person.name = "Joao"
person.age = 80
person.children = [ "Maria", "Pedro" ]
person.address = address
person.student = true
person.correspondences = [correspondence1, correspondence2]

puts person.to_json

puts 10.to_json

puts "a".to_json