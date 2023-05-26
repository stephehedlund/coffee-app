class HomeController < ApplicationController
  def login
    render({ :template => "home/login.html.erb" })
  end

  def signup
    render({ :template => "home/signup.html.erb" })
  end

  def home
    render({ :template => "home/discover.html.erb" })
  end

  def results
    render({ :template => "home/results.html.erb" })
  end

  def playground
    @my_array = { "id" => 1, "name" => "Intelligentsia Coffee", "address" => "53 E Randolph St, Chicago, IL 60601", "latitude" => 41.8841, "longitude" => -87.6259, "rating" => 4.6 }, { "id" => 2, "name" => "Hero Coffee Bar", "address" => "22 E Jackson Blvd, Chicago, IL 60604", "latitude" => 41.8789, "longitude" => -87.6254, "rating" => 4.5 }, { "id" => 3, "name" => "La Colombe Coffee", "address" => "955 W Randolph St, Chicago, IL 60607", "latitude" => 41.8849, "longitude" => -87.6512, "rating" => 4.5 }, { "id" => 4, "name" => "Sawada Coffee", "address" => "112 N Green St, Chicago, IL 60607", "latitude" => 41.8837, "longitude" => -87.6489, "rating" => 4.5 }, { "id" => 5, "name" => "Caffe Streets", "address" => "1750 W Division St, Chicago, IL 60622", "latitude" => 41.9035, "longitude" => -87.6725, "rating" => 4.4 }
    
    # @my_array.each do |coffee|
    #   name = coffee.fetch("name")
    #   address = coffee.fetch("address")
    #   latitude = coffee.fetch("latitude")
    #   longitude = coffee.fetch("longitude")
    #   rating = coffee.fetch("rating")
    #   shop = Shop.new
    #   shop.name = name
    #   shop.address = address
    #   shop.latitude = latitude
    #   shop.longitude = longitude
    #   shop.rating = rating
    #   shop.save
    # end

    # @coffee = @my_array.fetch(4)
    # name = @coffee.fetch("name")
    # address = @coffee.fetch("address")
    # latitude = @coffee.fetch("latitude")
    # longitude = @coffee.fetch("longitude")
    # rating = @coffee.fetch("rating")
    # shop = Shop.new
    # shop.name = name
    # shop.address = address
    # shop.latitude = latitude
    # shop.longitude = longitude
    # shop.rating = rating
    # shop.save

    @coffee_shops = Shop.last(5)
    @my_location = "60601"

    render({ :template => "home/playground.html.erb" })
  end

  def bookmark
    shop_id = params.fetch("shop_id")

    bookmark = Bookmark.new
    bookmark.shop_id = shop_id
    bookmark.save

    @bookmark_array = Bookmark.all

    render({:template=> "home/bookmarks.html.erb"})
  end
end
