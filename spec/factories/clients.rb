FactoryBot.define do
  factory :client do
    name           {Faker::Name.initials}
    postal_code    {"980-2345"}
    prefectures_id {1}
    city           {"新潟市中央区女池"}
    address        {1-1-1}
    phone_number   {"09012345678"}
  end
end
