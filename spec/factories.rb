FactoryGirl.define do
  factory :user do
    email "test_user"
    password_digest "password"
  end

  factory :post do
    user
    tag_list "New Rspec"
  end
end

