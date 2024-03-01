# Create a main sample user.
User.find_or_create_by!(email: "cichy@wp.pl") do |user|
  user.name = "Damian Ci"
  user.password = "admin1"
  user.password_confirmation = "admin1"
  user.admin = true
end

# Generate a bunch of additional users.
user_attributes = 99.times.map do |n|
  {
    name: Faker::Name.name,
    email: "example-#{n + 1}@example.org",
    password_digest: User.digest('password'),
    created_at: Time.now,
    updated_at: Time.now
  }
end

User.insert_all(user_attributes)

categories = { "Electronics" => ["Camera & Photo", "Headphones"],
               "Computers" => ["CPU", "GPU", "Motherboards", "Cooling", "Cases", "RAM", "HDD/SSD"],
               "Sport" => ["Sport shoes", "Bikes"],
               "Real Estate" => ["Apartments", "Houses", "Allotments", "Offices"],
               "Video Games" => ["RPG", "Action", "Strategy", "Online goods"],
               "Home and Garden" => ["Kitchen", "Living room", "Toilet", "Garden"],
               "Music" => ["Vinyl records", "Music CDs"] }

categories.each do |category, subcategories|
  cat = Category.create!(name: category)
  subcategories.each { |subcat| Subcategory.create!(name: subcat, category_id: cat.id) }
end

(1..5).each do
  User.find_each do |user|
    word_count = rand(5..30)
      content = Faker::Lorem.sentence(word_count: word_count)
      user.microposts.create!(content: content)
  end
end

Subcategory.find_each do |subcategory|
  items_to_create = rand(5..50)
  items_to_create.times do
    user = User.order('RANDOM()').first # Random User

    content = Faker::Lorem.sentence(word_count: 5)
    product_name = Faker::Commerce.product_name
    price = Faker::Commerce.price(range: 0.0..1000.0).round(2)
    user.items.create!(
      name: product_name,
      content: content,
      price: price,
      subcategory_id: subcategory.id
    )
  end
end

users = User.all
user = users.first
following = users[2..10] # Reduced range for demonstration
followers = users[3..9] # Reduced range for demonstration

following.each { |followed| user.follow(followed) unless user.following?(followed) }
followers.each { |follower| follower.follow(user) unless follower.following?(user) }
