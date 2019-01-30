20.times do
  Kitten.create(
    name: Faker::Cat.name,
    age: Faker::Number.between(1, 10),
    cuteness: Faker::Number.between(1, 10),
    softness: Faker::Number.between(1, 10),
  )
end