FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.unique.email}
    password { '1a' + Faker::Internet.unique.password(min_length: 6)}
    password_confirmation {password}
    last_name {'佐藤'}
    first_name {'太郎'}
    last_name_kana {'サトウ'}
    first_name_kana {'タロウ'}
    birthday {Faker::Date.birthday}
  end
end