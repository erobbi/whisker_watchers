class Cat < ApplicationRecord
  belongs_to :user
  has_many :weights, dependent: :destroy

  def current_weight
    self.weights.last.weight
  end
end
