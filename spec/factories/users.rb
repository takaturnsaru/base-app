FactoryBot.define do
  factory :user do
    name                  {"abe"}
    email                 {"hoge@mail.com"}
    password              {"0000000"}
    password_confirmation {password}
  end
end
    
  

