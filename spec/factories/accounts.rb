FactoryGirl.define do
  factory :account, class: Account do
    sequence(:name) { |n| "person#{n}" }
    sequence(:uid)
    token :token
  end
  factory :vkontakte, parent: :account, class: Account do
    provider :twitter
  end

  factory :facebook, parent: :account, class: Account do
    provider :instagram
  end
end
