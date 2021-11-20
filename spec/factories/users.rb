FactoryBot.define do
  factory :user do
     nickname {'ショーキチ'}
     email {'test@email.com'}
     password {'aaa00000'}
     password_confirmation {password}
     first_name {'中村'}
     last_name {'優汰'}
     first_name_kana {'ナカムラ'}
     last_name_kana {'ユウタ'}
     birthday {"1989-03-02"}
  end
end
