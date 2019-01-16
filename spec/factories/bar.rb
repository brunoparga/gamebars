FactoryBot.define do
  factory :bar do
    name { 'El bar' }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    opening_hours { '24/7' }
  end
end
