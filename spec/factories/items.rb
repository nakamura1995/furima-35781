FactoryBot.define do
  factory :item do
    name {"地球"}
    category_id {2}
    explanation_id {2}
    status_id {2}
    days_id {2}
    prefectures_id {2}
    price {'300'}
    user_id { FactoryBot.create(:user).id }
    description {'aaaa'}
  end
end
