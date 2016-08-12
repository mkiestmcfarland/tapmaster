# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

beverage_type_list = {"Beer" => nil, "Cider" => nil, "Mead" => nil, "Soda" => nil, "Other" => nil}
beverage_type_list.keys.each do |name|
  beverage_type_list[name] = BeverageType.create!( name: name )
end

beer_type_list = {
    "Light Lager" => ["American Light Lager", "American Lager", "International Pale Lager", "Munich Helles", "Festbier","German Helles Exportbier"],
    "Pilsner" => ["German Leichtbier", "Czech Pale Lager", "German Pils", "Czech Premium Pale Lager", "Pre-Prohibition Lager (Historical Beer)"],
    "European Amber Lager" => ["Vienna Lager","Czech Amber Lager", "Märzen","Kellerbier"],
    "Dark Lager" => ["International Dark Lager","Munich Dunkel","Czech Dark Lager","Schwarzbier"],
    "Bock" =>["Helles Bock","Dunkles Bock","Doppelbock","Eisbock"],
    "Light Hybrid Beer" => ["Cream Ale"," Blonde Ale","Kölsch","American Wheat Beer"],
    "Hybrid Amber Beer" => ["International Amber Lager","Kentucky Common (Historical Beer)", "California Common", "Altbier"],
    "English Pale Ale" => ["Ordinary Bitter","Best Bitter","Strong Bitter","British Golden Ale","Australian Sparkling Ale"],
    "Scottish & Irish Ale" => ["Scottish Light","Scottish Heavy","Scottish Export","Irish Red Ale","Wee Heavy"],
    "American Pale Ale" => ["American Pale Ale"],
    "Other American Ale"=> ["American Amber Ale","American Brown Ale"],
    "English Brown Ale" => [],
    "Porter"=> [],
    "Stout" => [],
    "Strong Stout" => [],
    "American IPA" => [],
    "India Pale Ale (IPA)" => [],
    "German Wheat & Rye Beer" => [],
    "Belgian & French Ale" => [],
    "Sour Ale" => [],
    "Belgian STRONG Ale" => [],
    "STRONG Ale" => [],
    "Fruit Beer" => [],
    "Spice/Herb/Vegetable Beer" => [],
    "Smoke-Flavored & Wood-Aged Beer" => [],
    "Specialty Beer" => []
}

beer = beverage_type_list["Beer"]
beer_type_list.each do |type, sub_type_list|
  BeverageStyle.create(name: type, beverage_type: beer)
end

cider_type_list = ["Standard Cider & Perry", "Specialty Cider & Perry"]
cider = beverage_type_list["Cider"]
cider_type_list.each do |type|
  BeverageStyle.create(name: type, beverage_type: cider)
end

#"TRADITIONAL MEAD","FRUIT MEAD","SPICE & SPECIALTY MEAD"


c = BeverageStyle.where(name: "Standard Cider & Perry").first
cider = Beverage.create(name: "Cider", abv: 4.0, ibu: 0, beverage_style: c)

i = BeverageStyle.where(name: "India Pale Ale (IPA)").first
ipa = Beverage.create(name: "Nick IPA", abv: 9.2, ibu: 110, beverage_style: i)

s = BeverageStyle.where(name: "Stout").first
stout = Beverage.create(name: "Stout Clone", abv: 5.5, ibu: 50, beverage_style: s)

list = TapList.create(user: user)
Tap.create(beverage: cider, tap_list: list, position: 1)
Tap.create(beverage: ipa, tap_list: list, position: 2)
Tap.create(beverage: stout, tap_list: list, position: 3)
