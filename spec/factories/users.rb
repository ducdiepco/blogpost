FactoryBot.define do
  factory :user do
    name { 'test name' }
    email { 'test_email@test.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
