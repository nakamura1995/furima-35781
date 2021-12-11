FactoryBot.define do
  factory :item do
    name
    caregory_id {'レディース'}
    explanation_id {'着払い(購入者負担)' }
    status_id {'新品・未使用'}
    days_id { '1日〜2日で発送' }
    prefectures_id { '北海道' }

  end
end
