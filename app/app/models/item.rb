class Item < ApplicationRecord
  before_create :generate_code

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :code, presence: true, uniqueness: true

  private

  def generate_code
    CodeGeneratorService.new(self, { letters: 2, numbers: 1 }).call
  end
end
