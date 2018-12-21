var app = require('express')()

app.get('/api/v1/posts', function (req, res) {
  const page = Number(req.query.page) || 1

  let posts = { error: 'list not found' }
  try {
    posts = require(`./fixtures/posts/index/${page}.json`)
  } catch { /* ignored */ }

  res.json(posts)
})

app.get('/api/v1/post/:post_id', function (req, res) {
  // eslint-disable-next-line camelcase
  const post_id = Number(req.params.post_id)

  let post = { error: 'post not found' }

  try {
    // eslint-disable-next-line camelcase
    post = require(`./fixtures/posts/show/${post_id}.json`)
  } catch { /* ignored */ }

  res.json(post)
})

app.listen(9292)
