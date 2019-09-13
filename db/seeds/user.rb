# frozen_string_literal: true

def user

  User.create(
    username: 'admin',
    password: 'admin',
    admin: true,
  )

  1.upto 10 do |i|
    User.create(
      username: "user#{i}",
      password: "user#{i}",
      admin: true,
    )
  end

end
