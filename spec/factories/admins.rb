FactoryBot.define do
  factory :admin do
    name         {Faker::Name.initials}
    email        {Faker::Internet.free_email}
    password     {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    
  end
end
