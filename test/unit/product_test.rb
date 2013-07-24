require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end


  def new_product(image_url)
    Product.new(title:      "My Book Title",
               description:  "yfffffffjijiffyy",
               price:        1.00,
               image_url:    image_url)
  end


  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
              http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/mode fred.gif.mode }

    ok.each do |img_name|
      assert new_product(img_name).valid?, "#{img_name} should be valid"
    end

    bad.each do |img_name|
      assert new_product(img_name).invalid?, "#{img_name} shouldn't be valid"
    end
  end

  test "los atributos no deben estar vacios" do
  product = Product.new
  assert product.invalid?
  assert product.errors[:title].any?
  assert product.errors[:description].any?
  assert product.errors[:price].any?
  assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(title:       "My Book Title",
                          description: "yyy",
                          image_url:   "zzz.jpg")

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0.001
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], 
      product.errors[:price]

    product.price = 1
    assert product.valid?
  end
  test "product is not valid without a unique title" do
    product = Product.new(title:
    products(:ruby).title,
    description: "yyy",
    price:
    1,
    image_url:
    "fred.gif")
    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join('; ')
  end


  test "el producto no es valido, si posee un titulo existente(uniqueness) i18n internacionalizado " do
    product = Product.new(title: products(:ruby).title,
                          description: "yyy",
                          price: 1,
                          image_url: "fred.gif")
    assert !product.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'), product.errors[:title].join('; ')
  end
end

