puts 'Loading seeds...'
user = User.new(email: 'foo@example.com')
customer_attributes = %w(John Paul George Ringo).map { |name| { name: name } }
customers = user.customers.build(customer_attributes)
customers.each do |customer|
  order_attributes = [100, 200, 300, 400, 500].map { |price| { price: price } }
  customer.orders.build(order_attributes)
end
user.save!
puts 'Finished.'
