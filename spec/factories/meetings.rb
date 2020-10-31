FactoryBot.define do
  factory :meeting do
    name       {Faker::Lorem.sentence}
    start_time {"2020/10/31"}
    text       {Faker::Lorem.sentence}
    association :user
  end
end
