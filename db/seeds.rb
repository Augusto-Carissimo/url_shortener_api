(1..100).each do |i|
  Link.create(url: Faker::Internet.url, title: Faker::Company.name, count: i)
end