6.times do |i|
  Task.create(
    content: "Content #{i}",
    assignee: "Assignee #{i}",
    status: i % 2,
  )
end
