FactoryBot.define do
  factory :listing do
    title { "MyString" }
    price { 1 }
    sold { false }
    description { "MyText" }
    suburb { "MyString" }
    user { nil }
    type { nil }
    size { nil }
    state { nil }
    gender { nil }
  end
end
