FactoryGirl.define do
  factory :banner do
    name 'MyString'
    priority 0
    visible true
    image { fixture_file_upload("#{Rails.root}/spec/fixtures/test.jpg", 'image/jpg') }
  end
end
