Product.delete_all
User.delete_all
ActiveStorage::Attachment.all.each { |attachment| attachment.purge }

merchants = User.create!(
  [
    {
      email: 'merchant1@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      role: 'merchant'
    },
    {
      email: 'merchant2@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      role: 'merchant'
    }
  ]
)

customers = User.create!(
  [
    {
      email: 'customer1@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      role: 'customer'
    },
    {
      email: 'customer2@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      role: 'customer'
    }
  ]
)

merchants.each do |merchant|
  merchant.products.create!(
    [
      {
        name: 'Product 1 by ' + merchant.email,
        description: 'Description for product 1 by ' + merchant.email,
        price: 19.99,
      },
      {
        name: 'Product 2 by ' + merchant.email,
        description: 'Description for product 2 by ' + merchant.email,
        price: 29.99,
      }
    ]
  )
end

merchants.each do |merchant|
  merchant.products.each do |product|
    product.images.attach(io: URI.open(Faker::LoremFlickr.image), filename: "#{product.name}.jpg")
  end
end

puts "Seed data created successfully!"
