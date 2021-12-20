FactoryBot.define do
  factory :item do
    name {"地球"}
    category_id {2}
    explanation_id {2}
    status_id {2}
    days_id {2}
    prefectures_id {2}
    price {'300'}
    association :user
    description {'aaaa'}
    
    after(:build) do |item|
    item.image.attach(io: File.open('projects/image/a.jpeg'), filename: 'a.jpeg')
      end
    end
end
