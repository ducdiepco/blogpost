FactoryBot.define do
  factory :post do
    title { 'test title' }
    body { 'test body' }
    published { true }
    user
  end
end
