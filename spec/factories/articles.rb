FactoryGirl.define do
  factory :article do
    title 'MyString'
    body 'MyString'
    image { fixture_file_upload("#{Rails.root}/spec/fixtures/test.jpg", 'image/jpg') }
  end
end
