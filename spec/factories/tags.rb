FactoryGirl.define do
  factory :tag, class: Tag do
    is_active false

    trait :ruby do
      name 'ruby'
      official_name 'Ruby'
    end

    trait :php do
      name 'php'
      official_name 'PHP'
    end
  end

end
