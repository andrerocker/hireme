FactoryGirl.define do
  factory :room do
    name { Faker::Name.name }
  end

  factory :week do
    number { Faker::Number.number(1) }
  end

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end

  factory :scheduling do
    room { create :room }
    week { create :week }
    user { create :user }
    hour { Faker::Time.forward(1).strftime("%H:%M") }
    day { Faker::Number.number(1) }
  end
end
