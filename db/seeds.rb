users = ["tanaka", "ミキ", "近藤", "森友", "さと"]
users.each_with_index do |user, i|
 User.create(
   name: "#{user}",
   email: "#{i + 1}@hoge.com",
   password: "password"
 )
end
