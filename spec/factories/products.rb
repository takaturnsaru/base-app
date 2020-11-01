FactoryBot.define do
  factory :product do
    name          {Faker::Name.initials}
    grade_id      {1}
    price         {2000000}
    association   :admin
  end
end
