class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question

  has_many :answers

  class AnswerSerializer < ActiveModel::Serializer
    attributes :id, :answer, :correct
  end
end

