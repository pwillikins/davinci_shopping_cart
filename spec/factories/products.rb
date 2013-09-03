# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description {
      description = <<-DESCRIPTION
        These #{Faker::Commerce.color} #{name.pluralize}
        will help you generate
        #{Faker::Company.catch_phrase} with
        #{Faker::Company.bs}
      DESCRIPTION
      description.gsub!(/[\n\s]+/, ' ')
      description
    }
    image_url { "/images/#{rand(10_000)}.png" }
    price { sprintf("%.02f", rand * 999) }
  end
end
