users = ["tanaka", "ミキ", "近藤", "森友", "さと"]
users.each.with_index(1) do |user, i|
  User.seed(:id, {
    id: i,
    name: "#{user}",
    email: "#{i + 1}@hoge.com",
    password: "password"
  })
end
