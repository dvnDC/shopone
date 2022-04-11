# Create a main sample user.
User.create!(name: "Damian Ci",
             email: "cichy1991@wp.pl",
             password: "admin1",
             password_confirmation: "admin1",
             admin: true)

# Generate a bunch of additional users.
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@example.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

10.times do
  category = Faker::Commerce.send(:categories, 1)
  Category.create!(name: category[0])
end

categories = Category.order(:created_at).take(6)
10.times do
  subcategory = Faker::Commerce.brand
  categories.each { |category| Subcategory.create!(name: subcategory, category_id: category.id) }
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
subcategories = Subcategory.order(:created_at).take(6)
subcategories.each do |subcategory|
  15.times do
    content = Faker::Lorem.sentence(word_count: 5)
    product_name = Faker::Commerce.product_name
    users.each { |user| user.microposts.create!(content: content) }
    users.each { |user| user.items.create!(name: product_name, content: content, price: 99.99, subcategory_id: subcategory.id) }
  end
end

# Create following relationships.
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
