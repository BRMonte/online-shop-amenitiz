module ItemsHelper
  def item_image(item)
    item.item_images.first.try(:img_url) || 'https://wiki.dave.eu/images/4/47/Placeholder.png'
  end

  def item_name(item)
    item.try(:name) || 'Fake name'
  end

  def item_description(item)
    item.try(:description) || 'Fake description'
  end

  def item_price(item)
    item.try(:price) || 0.01
  end
end
