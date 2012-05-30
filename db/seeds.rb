# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Product.create(:name => 'Zapatos', :description => 'Pareja de zapatos', :price => 20)
#Product.create(:name => 'Camisa', :description => 'Camisa blanco', :price => 30)
#Product.create(:name => 'Pantalon', :description => 'Pantalones marrones', :price => 40)
#Product.create(:name => 'Jersey', :description => 'Jersey de lana', :price => 50)
#Product.create(:name => 'Chaqueta', :description => 'Chaqueta negra', :price => 100)
#Product.create(:name => 'Calcetines', :description => 'Calcetines blancos', :price => 3)

User.create(:email => "foobar@shop.es", :password=> "abcd_1234")
User.create(:email => "admin@shop.es", :password=> "abcd_1234", :admin => true)
