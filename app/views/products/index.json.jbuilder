json.array!(@products) do |product|
  json.extract! product, :id, :title, :length, :width, :thickness, :diameter, :capacity, :weight, :color, :material, :extender, :manufacturer, :description, :image_url, :price
  json.url product_url(product, format: :json)
end
