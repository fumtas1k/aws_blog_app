n = 10

n.times do |i|
  Blog.create!(
    title: Faker::Movie.title[0,20],
    content: Faker::Hacker.say_something_smart,
  )
end
