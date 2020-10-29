FactoryBot.define do
  factory :client_user, class: User do
    name { "client" }
    email { "client@client.com" }
    password { "password" }
    password_confirmation { "password" }
    client { true }
  end
  factory :second_user, class: User do
    name { "picasso" }
    email { "picasso@picasso.com" }
    password { "password" }
    password_confirmation { "password" }
    client { false }
  end
end
