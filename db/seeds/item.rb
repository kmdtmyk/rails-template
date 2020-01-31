# frozen_string_literal: true

def item

  return if Item.any?

  user_ids = User.ids

  items = []

  500.times do

    name = [
      Faker::Food.method(:dish),
      Faker::Food.method(:fruits),
      Faker::Food.method(:vegetables),
      Faker::Beer.method(:name),
      Faker::Book.method(:title),
      Faker::Game.method(:title),
      Faker::Music.method(:album),
    ].sample.call

    items << {
      name: name,
      price: rand(1000) * 10,
      create_user_id: user_ids.sample,
      update_user_id: user_ids.sample,
      created_at: Time.current,
      updated_at: Time.current,
    }
  end

  Item.insert_all items

end
