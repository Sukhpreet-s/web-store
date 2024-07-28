json.extract! product, :id, :name, :description, :price, :images, :created_at, :updated_at
json.url product_url(product, format: :json)
json.images do
  json.array!(product.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end
