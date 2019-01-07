# Seed database with fake data for demonstration

FAKE_USER = 50
FAKE_POST = 100
FAKE_POST_PARAGRAPH_COUNT = (1..20)
FAKE_POST_PARAGRAPH_SENTENSE_COUNT = (10..30)
FAKE_COMMENT_PER_POST = (0..20)
FAKE_COMMENT_PARAGRAPH_COUNT = (1..5)
FAKE_COMMENT_PARAGRAPH_SENTENSE_COUNT = (1..3)

users = DB[:users]
posts = DB[:posts]
comments = DB[:comments]

FAKE_USER.times do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"

  users.insert(name: name)
end

FAKE_POST.times do
  title = Faker::Lorem.words(60, true).map(&:capitalize).join(' ')[0..60]
  title = title[0..title.rindex(' ') - 1]
  content = rand(FAKE_POST_PARAGRAPH_COUNT).times.map do
    Faker::Lorem.paragraph(rand(FAKE_POST_PARAGRAPH_SENTENSE_COUNT), true)
  end.join("\n")
  author_id = rand(FAKE_USER) + 1

  post_id = posts.insert(title: title, content: content, author_id: author_id)

  rand(FAKE_COMMENT_PER_POST).times do
    content = rand(FAKE_COMMENT_PARAGRAPH_COUNT).times.map do
      Faker::Lorem.paragraph(rand(FAKE_COMMENT_PARAGRAPH_SENTENSE_COUNT), true)
    end.join("\n")
    author_id = rand(FAKE_USER) + 1
    comments.insert(content: content, author_id: author_id, post_id: post_id)
  end
end
