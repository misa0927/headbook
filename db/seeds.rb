10.times do |n|
    email = Faker::Internet.email
    name = Faker::Cat.name
    password = Faker::Internet.password
    uid = SecureRandom.uuid
    user = User.create(email: email,
            name: name,
            password: password,
            password_confirmation: password,
            uid: uid
            )

    topic = Topic.new(title:"sample",
            content: "content",
            user_id: user.id)

    10.times do
      topic.comments.build(content:"comment",
      user_id: user.id)
    end

    topic.save
  end
