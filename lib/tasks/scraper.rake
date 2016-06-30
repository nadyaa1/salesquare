namespace :scraper do
  desc "Retrieves newest sale items and puts them in database"
  task run: [:environment] do

    puts "about to scrape H&M women"

    categories = ['ladies', 'men', 'kids']


    categories.each do |category|
      puts "Started destroying every product for category #{category}"
      Product.where(category: category).destroy_all
      puts "Destroyed all products"
      category_index_url_string = "http://www.hm.com/nl/products/sale/#{category}"

    #sales_index_url_string = "http://www.hm.com/nl/products/sale"

    category_index_page = Nokogiri::HTML(open(category_index_url_string))


    sale_list_items = category_index_page.css("ul.products-list > li")


    sale_list_items.each do |sale_product|
  #set the product's name
  product_name = sale_product.css("div.details").first.children[0].to_s.strip

  puts "Adding product #{product_name}"

  #set the product image string
  # product_photo = sale_product.css('div.image').first.children[1].attributes.values[1].value
  product_photo = sale_product.css('div.image img').first
  photo_url = "http:#{product_photo.attribute('src').value}"

  # set the product price
  product_price_string = sale_product.css('div.price').first.children[1].children.first.to_s.gsub(',','.')

  #set product url
  product_url = sale_product.children[1].attributes['href'].value

  #grabbing description of product
  begin
    product_details_page = Nokogiri::HTML(open(product_url))
    product_description = product_details_page.css('div.description').first.children[5].children.first.to_s.strip
  rescue StandardError
    next
  end

  category == 'ladies' ? product_category = 'women' : product_category = category

  # 2 == 3 ? true : false
  begin
    new_product = Product.new( name: product_name,
     remote_photo_url: photo_url,
     price: product_price_string,
     url: product_url,
     category: product_category,
     description: product_description
     )
      new_product.save!

  rescue ActiveRecord::RecordInvalid
    next
  end

end

end



# sale_list_items = sales_index_page.css("ul.products-list > li")


# # TO DEBUG
# # sale_list_items = sale_list_items.take(1)

# puts "Started destroying every product"
# Product.where(category: 'women').destroy_all
# puts "Destroyed all products"

# sale_list_items.each do |sale_product|
#   #set the product's name
#   product_name = sale_product.css("div.details").first.children[0].to_s.strip

#   puts "Adding product #{product_name}"

#   #set the product image string
#   # product_photo = sale_product.css('div.image').first.children[1].attributes.values[1].value
#   product_photo = sale_product.css('div.image img').first
#   photo_url = "http:#{product_photo.attribute('src').value}"

#   # set the product price
#   product_price_string = sale_product.css('div.price').first.children[1].children.first.to_s.gsub(',','.')

#   #set product url
#   product_url = sale_product.children[1].attributes['href'].value

#   #grabbing description of product
#   product_details_page = Nokogiri::HTML(open(product_url))
#   product_description = product_details_page.css('div.description').first.children[5].children.first.to_s.strip


#   new_product = Product.new( name: product_name,
#    remote_photo_url: photo_url,
#    price: product_price_string,
#    url: product_url,
#    category: 'women',
#    description: product_description
#    )

#   new_product.save!
# end

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
