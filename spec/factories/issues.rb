FactoryBot.define do
  factory :issue do
    sequence(:title) { |n|  "Test Title #{n}" }
    content { 'sample content' }
  end
end
