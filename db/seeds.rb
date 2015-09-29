require 'faker'

9.times do
  Task.create!(
    task_string: Faker::Lorem.sentence,
    task_completed: [true, false].sample
    )
end