class Item < ApplicationRecord
  before_create :generate_code
  before_create :slugify

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :code, presence: true, uniqueness: true
  validates :slug, presence: true

  private

  def generate_code
    CodeGeneratorService.new(self, { letters: 2, numbers: 1 }).call
  end

  def slufigy
    self.slug = name.parameterize
  end
end
