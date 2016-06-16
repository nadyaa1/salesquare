# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p = Product.create(name: "Ripped Jeans", description: "These jeans are not for basic bitches", category: "women", price: 39.99, url: "http://www.hm.com", photo: "image/upload/v1466090703/nice_vh5nlt.jpg" )
p.photo = "image/upload/v1466090703/nice_vh5nlt.jpg"
p.save!
Product.create(name: "Boxer Shorts", description: "With a nice pokemon pattern", category: "men", price:  9.99, url: "http://www.zara.com", photo: "http://unsplash.it/300/200" )
Product.create(name: "Maxi Dress", description: "No need for shaving your legs. Just put on this maxidress!", category: "women", price:  65.50, url: "http://www.wefashion.nl", photo: "http://unsplash.it/300/200" )
Product.create(name: "Summer Hat", description: "Super ultra hipster", category: "kids", price:  50.00, url: "http://www.g-star.com", photo: "http://unsplash.it/300/200" )
Product.create(name: "Killer Heals", description: "Warning: do not wear longer then 1 hour!", category: "women", price:  25.00, url: "http://jackjones.nl", photo: "http://unsplash.it/300/200" )
Product.create(name: "Flower Scarf", description: "For the basic bitches", category: "women", price:  99.99, url: "http://topman.com", photo: "http://unsplash.it/300/200" )
