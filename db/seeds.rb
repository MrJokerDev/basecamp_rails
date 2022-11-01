user = User.new(
    :id                    => 1,
    :email                 => "admin@admin.com",
    :role                  => 1,
    :password              => "123456",
    :password_confirmation => "123456"
  )
  user.save!