require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end
  test 'product attributes must not be empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:length].any?
    assert product.errors[:width].any?
    assert product.errors[:thickness].any?
    assert product.errors[:diameter].any?
    assert product.errors[:capacity].any?
    assert product.errors[:weight].any?
    assert product.errors[:color].any?
    assert product.errors[:material].any?
    assert product.errors[:extender].any?
    assert product.errors[:manufacturer].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test 'product price must be positive' do
    # цена товара должна быть положительной
    product = Product.new(title: 'LotusMat',
                          length: 183,
                          width: 61,
                          thickness: 0.6,
                          diameter: 'nil',
                          capacity: 'nil',
                          weight: 1.5,
                          color: 'orange',
                          material: 'rubber',
                          extender: 'nil',
                          manufacturer: 'BodhiYoga',
                          description: 'MyText',
                          image_url: 'lotus_orange.jpg')
    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'],

    product.errors[:price]
      # должна быть больше или равна 0.01
    product.price = 0

    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
      product.errors[:price]
    product.price = 1
    assert product.valid? , " #{:price} must be greater than or equal to 0.01"
  end

  def new_product(image_url)
    Product.new(title: 'LotusMat',
                length: 183,
                width: 61,
                thickness: 0.6,
                diameter: 'nil',
                capacity: 'nil',
                weight: 1.5,
                color: 'orange',
                material: 'rubber',
                extender: 'nil',
                manufacturer: 'BodhiYoga',
                description: 'MyText',
                image_url: image_url,
                price: 34.99)
  end

  test 'image url' do
    # url изображения
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
    http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
      # не должно быть неприемлемым
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
      # не должно быть приемлемым
    end

  end

  test 'product is not valid without a unique title' do
    # если у товара нет уникального названия, то он недопустим
    product = Product.new(title: products(:lotus).title,
                          length: 183,
                          width: 61,
                          thickness: 0.6,
                          diameter: 'nil',
                          capacity: 'nil',
                          weight: 1.5,
                          color: 'orange',
                          material: 'rubber',
                          extender: 'nil',
                          manufacturer: 'BodhiYoga',
                          description: 'MyText',
                          image_url: 'lotus_orange.jpg',
                          price: 34.99)
    assert product.invalid?
    assert_equal ['has already been taken'], product.errors[:title]
  end

end
