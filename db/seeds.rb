@number = 0

20.times do
  name = Faker::Name.name
  @number = @number + 1
  image = ['https://media.giphy.com/media/3ov9kaqu7vKqO7fdn2/giphy.gif',
           'https://media.giphy.com/media/l378u1hvD851H5iW4/giphy.gif',
           'https://media.giphy.com/media/l378aMwZsLKz4zvA4/giphy.gif',
           'https://media.giphy.com/media/l378fOYSZWosYDtXW/giphy.gif',
           'https://media.giphy.com/media/3ohhwr3mjQREJNWLK0/giphy.gif',
           'https://media.giphy.com/media/3ov9jNh2K72BGc2Jvq/giphy.gif',
           'https://media.giphy.com/media/l378tHBjwt4xAUtvG/giphy.gif',
           'https://media.giphy.com/media/l378BontxZBXmdaLu/giphy.gif',
           'https://media.giphy.com/media/l1J9wbFuRS4TeBtE4/giphy.gif',
           'https://media.giphy.com/media/xT9IgpPyKKIrKuL8mA/giphy.gif'
          ].sample
  my_user = User.create(
    name: name,
    email: "test#{@number}@test.com",
    password: "password#{@number}",
    image: image
  )
  30.times do
    title = Faker::HitchhikersGuideToTheGalaxy.planet
    body = Faker::HitchhikersGuideToTheGalaxy.quote
    image = ['https://media.giphy.com/media/Eto9EuhZtddjG/giphy.gif',
             'https://media.giphy.com/media/l1IXWaOsgYSU8IC7m/giphy.gif',
             'https://media.giphy.com/media/uYuNfAcaAP06A/giphy.gif',
             'https://media.giphy.com/media/13tmSXAkm9DapO/giphy.gif',
             'https://media.giphy.com/media/sejzLjTz8cfnO/giphy.gif',
             'https://media.giphy.com/media/sS3q8naPF0TZK/giphy.gif',
             'https://media.giphy.com/media/xT8qB72Dfmxd8nv9DO/giphy.gif',
             'https://media.giphy.com/media/xT8qBj22SziBSj11hS/giphy.gif',
             'https://media.giphy.com/media/3o72F1QISmioKMES8U/giphy.gif',
             'https://media.giphy.com/media/oUYDwyQ3xUgo0/giphy.gif'
           ].sample
    Post.create(title: title, body: body, image: image, user_id: my_user.id)
  end
end

puts "Users and Posts seeded"
