puts 'Loading seeds...'
user = User.create(email: 'foo@example.com')
deliverers = %w(Sagawa Yamato).map { |name| Deliverer.create(name: name) }
customer_attributes = %w(John Paul George Ringo).map { |name| { name: name } }
customers = user.customers.create(customer_attributes)
customers.each_with_index do |customer, index|
  order_attributes = [100, 200, 300, 400, 500].map { |price|
    [
      {
        price: price,
        deliverer: deliverers[0]
      },
      {
        price: price,
        deliverer: deliverers[1]
      }
    ]
  }.flatten
  customer.orders.create(order_attributes)
end
puts 'Finished.'
