6.times do |i|
  Task.create(
    content: "Content #{i + 1}",
    assignee: "Assignee #{i + 1}",
    status: i % 2,
  )
end
