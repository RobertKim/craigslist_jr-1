def seed_table_users
  50.times do
    User.create(:first_name => Faker::Name.first_name,
                :last_name => Faker::Name.first_name,
                :email => Faker::Internet.email
               )
  end
end

def seed_table_category
  10.times do 
    Category.create(:name => Faker::Name.title) 
  end
end


def seed_table_posts
  10.times do
    Post.create(:title => Faker::Lorem.word,
                :description => Faker::Lorem.sentence,
                :price => rand(1..1000),
                :category_id => rand(1..10),
                :user_id => rand(1..50)
               )
  end
end


seed_table_users
seed_table_category
seed_table_posts
