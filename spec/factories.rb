FactoryGirl.define do
  factory :user do
    email "test_user@test.com"
    password_digest "password"
  end

  factory :post do
    title "elves men hobbits dawrfs"
    tag_list "Middle Earth"
    content "middle earth rocks, Toklien was an amazing person "
  end
end

