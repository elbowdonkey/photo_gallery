FactoryGirl.define do
  factory :user do
    sequence(:email)    {|n| "person#{n}@example.com" }
    sequence(:name)     {|n| "John Doe#{n}" }
    sequence(:password) {|n| "supersecure#{n}" }
  end
end