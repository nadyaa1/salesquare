namespace :scraper do
  desc "Retrieves newest sale items and puts them in database"
  task run: [:environment] do

    sales_index_url_string = "http://www.hm.com/us/products/sale"

    sales_index_page = Nokogiri::HTML(open(sales_index_url_string))

    sale_list_items = sales_index_page.css("ul.products-list > li")


# TO DEBUG
# sale_list_items = sale_list_items.take(1)

sale_list_items.each do |sale_product|
  #set the product's name
  product_name = sale_product.css("div.details").first.children[0]

  #set the product image string
  # product_photo = sale_product.css('div.image').first.children[1].attributes.values[1].value
  product_photo = sale_product.css('div.image img').first
  photo_url = "http:#{product_photo.attribute('src').value}"

  puts photo_url


  # set the product price
  product_price_string = sale_product.css('div.price').first.children[1].children.first.to_s.gsub(',','.')

  #set product url
  product_url = sale_product.children[1].attributes['href'].value

  new_product = Product.new( name: product_name,
                             remote_photo_url: photo_url,
                             price: product_price_string,
                             url: product_url,
                             category: 'women',
                             description: "roghoirjgor"
    )

  new_product.save!
end

# #name
# sale_list_items_name = sales_index_page.css("div.details").first.children[0]

# # image
# product_image_string = product.css('div.image').first.children[1].attributes.values[1].value

# # description

# # price
# producy_price_string = first_item.css('div.price').first.children[1].children.first.to_s

# # url
# product_url = product.children[1].attributes['href'].value





end
end
