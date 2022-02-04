class StudentSummarySerializer < ActiveModel::Serializer
  attributes :summary

  def summary
    "Hi my name is #{object.name} and I am a #{object.major} major"
  end
end
