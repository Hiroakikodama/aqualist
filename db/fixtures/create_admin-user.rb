User.create!(
    name: "管理人K",
    password: ENV['PASSWORD'],
    password_confirmation: ENV['PASSWORD'],
    administrator: true
  )
