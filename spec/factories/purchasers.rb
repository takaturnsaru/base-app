FactoryBot.define do
  factory :purchaser do
    buyday           {"2020/2/9"}
    product_specification_id {1}
    unit_price            {"1000000"}
    quanity               {"1"}
    amount                {"1000000"}
    association           :client
  end
end
