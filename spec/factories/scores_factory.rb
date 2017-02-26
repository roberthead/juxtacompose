FactoryGirl.define do
  factory :score do
    name { FFaker::Music.song }
  end
end
