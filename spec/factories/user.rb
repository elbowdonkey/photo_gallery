FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    name "Michael Buffington"
    password "fishbirdsnake"
  end
end