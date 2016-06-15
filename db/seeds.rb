# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(name: "H&M", description: "t-shirt", category: "men", price: 19.99, url: "http://www.hm.com" )
Product.create(name: "Zara", description: "bag", category: "men", price:  35, url: "http://www.zara.com" )
Product.create(name: "WE", description: "shoes", category: "women", price:  65.50, url: "http://www.wefashion.nl" )
Product.create(name: "G-Star", description: "hat", category: "kids", price:  50, url: "http://www.g-star.com" )
Product.create(name: "Jack & Jones", description: "sweater", category: "kids", price:  25, url: "http://jackjones.nl" )
Product.create(name: "Topman", description: "jacket", category: "men", price:  99.99, url: "http://topman.com" )
