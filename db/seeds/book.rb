# frozen_string_literal: true

def book

  return if Book.any?

  user_ids = User.ids

  books = []

  1.upto 1000 do |i|
    books << {
      name: "book#{i}",
      price: i * 100,
      release_date: Time.zone.today - i,
      create_user_id: user_ids.sample,
      created_at: Time.current,
      updated_at: Time.current,
    }
  end

  Book.insert_all books
end
