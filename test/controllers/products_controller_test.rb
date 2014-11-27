require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
      @update = {
          title: 'Lorem Ipsum',
          length: 200,
          width: 60,
          thickness: 0.5,
          diameter: 180,
          capacity: 0.250,
          weight: 3.1,
          color: 'red',
          material: 'rubber',
          extender: 'buckwheat',
          manufacturer: 'Bodhi Yoga',
          description: 'Lorem Ipsum',
          image_url: 'image.jpg',
          price: 19.95
      }

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update #{  title: @product. title, capacity: @product.capacity, color: @product.color, description: @product.description, diameter: @product.diameter, extender: @product.extender, image_url: @product.image_url, length: @product.length, manufacturer: @product.manufacturer, material: @product.material, price: @product.price, thickness: @product.thickness, weight: @product.weight, width: @product.width }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: @update #{  title: @product. title, capacity: @product.capacity, color: @product.color, description: @product.description, diameter: @product.diameter, extender: @product.extender, image_url: @product.image_url, length: @product.length, manufacturer: @product.manufacturer, material: @product.material, price: @product.price, thickness: @product.thickness, weight: @product.weight, width: @product.width }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
