FactoryBot.define do
  factory :favorite do
    association :user, factory: :alice
    association :article, factory: :bob_article
  end
end
