items = [
  {
    name: 'Coffee',
    img_url: 'https://assets.bonappetit.com/photos/5c366551f212512d0e6cefd0/16:9/w_2240,c_limit/Basically-Coffee-0219-03.jpg',
    description: 'Delicious and amazing food'
  },
  {
    name: 'Bread',
    img_url: 'https://assets.bonappetit.com/photos/5c62e4a3e81bbf522a9579ce/1:1/w_2240,c_limit/milk-bread.jpg',
    description: 'Delicious and amazing food'
  },
  {
    name: 'Strawberries',
    img_url: 'https://hips.hearstapps.com/clv.h-cdn.co/assets/15/22/1432664914-strawberry-facts1.jpg?resize=980:*',
    description: 'Delicious and amazing food'
  },
  {
    name: 'Egg',
    img_url: 'https://cdn.britannica.com/94/151894-050-F72A5317/Brown-eggs.jpg',
    description: 'Delicious and amazing food'
  },
  {
    name: 'Green tea',
    img_url: 'https://www.revolutiontea.com/cdn/shop/articles/history-of-green-tea.jpg?v=1623361605',
    description: 'Delicious and amazing food'
  },
  {
    name: 'White bread',
    img_url: 'https://www.bhg.com/thmb/ix1jf9aUXcxyFtekIBlVCAIBW4w=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/BHG-milk-bread-4CdeIL1uKGyB5ryU8J_EED-aaa76729c86a413ca7500029edba79f0.jpg',
    description: 'Delicious and amazing food'
  },
  {
    name: 'Blue cheese',
    img_url: 'https://cdn.britannica.com/09/3809-004-50E1BB9B/Roquefort-cheese.jpg',
    description: 'Delicious and amazing food'
  }
]

def generate_random_price
  random_number = rand * 10.00
  random_number = random_number.round(2)
end

def define_price(item)
  return 3.11 if item == 'Green tea'
  return 5.00 if item == 'Strawberries'
  return 11.23 if item == 'Coffee'
  return 15.00 if item == 'Red wine'

  return generate_random_price
end

items.each do |i|
  item = Item.new(
    name: i[:name],
    description: i[:description],
    price: define_price(i),
    slug: i[:name].parameterize
  )

  CodeGeneratorService.new(item, { numbers: 1, letters: 2 }).call

  item.save

  item_image = ItemImage.create(
    item_id: item.id,
    img_url: i[:img_url]
  )
end
