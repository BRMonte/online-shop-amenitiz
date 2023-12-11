class Item < ApplicationRecord
  paginates_per 3

  has_many :item_images, dependent: :destroy
  has_many :order_items

  before_create :generate_code
  before_create :generate_slug

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :code, uniqueness: true
  validates :slug, uniqueness: true

  scope :alphabetical, -> { order(name: :asc) }
  scope :by_price, -> { order(price: :asc) }

  def self.search(search_param)
    return Item.all unless search_param.present?

    Item.where('name ~* ?', search_param)
  end

  private

  def generate_code
    CodeGeneratorService.new(self, { letters: 2, numbers: 1 }).call
  end

  def generate_slug
    self.slug = name.parameterize
  end
end
