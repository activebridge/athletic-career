FactoryGirl.define do
  factory :user, class: User do
    provider :facebook
    avatar { fixture_file_upload("#{Rails.root}/spec/fixtures/test.jpg", 'image/jpg') }
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:name) { |n| "person#{n}" }
    gender 'male'
  end
end
