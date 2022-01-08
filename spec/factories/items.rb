FactoryBot.define do
  factory :item do
    name { '地球' }
    category_id { 2 }
    explanation_id { 2 }
    status_id { 2 }
    day_id { 2 }
    prefecture_id { 3 }
    price { '300' }
    association :user
    description { 'aaaa' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/a.png'), filename: 'a.png')
    end
  end
end
