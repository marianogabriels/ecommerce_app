ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  # Add more helper methods to be used by all tests here...
 
 # def nuevo_producto(atributos_que_fallan = {})
 #   producto = {title: "My book Title",
 #               description: "correct description",
 #               price: "66.66",
 #               image_url: "CorrectImage.jpg"}
 #               
 #   atributos_que
 #   producto[:fail_atribute] = valor
 #
 #   product.new(producto)
 # end 
end
