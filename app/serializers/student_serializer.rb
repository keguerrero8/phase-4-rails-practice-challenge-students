class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :major, :age

  # def summary
  #   "Hi my name is #{object.name} and I am a #{object.major} major"
  # end
end
