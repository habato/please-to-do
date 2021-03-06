FactoryBot.define do
  factory :request do
    title   { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    association :user
    association :room

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
