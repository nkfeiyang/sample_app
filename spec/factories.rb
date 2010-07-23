# By using the symbol ':user', weget Factory Girl to simulate the User model.

Factory.define :user do |user|
  user.name                            "Michael Hartl"
  user.email                           "nhartl@example.com"
  user.password                        "foobar"
  user.password_confirmation           "foobar"
end
