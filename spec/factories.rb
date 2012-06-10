FactoryGirl.define do
  factory :user do
    name "Ben"
    email "ben@gmail.com"
    password "abcdef"
    password_confirmation "abcdef"
  end
end