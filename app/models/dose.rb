class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient
  validates :amount, :cocktail, :ingredient, presence: true
end
