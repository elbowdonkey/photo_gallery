# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    filepicker_url "MyString"
    gallery_id 1
  end
end
