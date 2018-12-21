module.exports = {
  'render a post with a title, a user name, and content': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}post/1`)
      .assert.elementCount('.post .headline', 1)
      .assert.containsText('.post .headline', 'FAKE_POST_TITLE_1')
      .assert.elementCount('.post .author', 1)
      .assert.containsText('.post .author', 'FAKE_USER_NAME_1')
      .assert.elementCount('.post .content', 1)
      .assert.containsText('.post .content', 'FAKE_POST_CONTENT_1')
      .end()
  },

  'render multiple comments in post display': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}post/1`)
      .assert.elementCount('.comments .comment', 2)
      .end()
  },

  'render an author and content for a comment': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}post/1`)
      .assert.containsText('.comments .comment .author', 'FAKE_USER_NAME_1')
      .assert.containsText('.comments .comment .content', 'FAKE_COMMENT_CONTENT_1')
      .end()
  },

  'render no comments if post has no comment': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}post/2`)
      .assert.elementCount('.comments', 0)
      .end()
  },

  'render multiple lines of content for the post': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}post/3`)
      .assert.elementCount('.post .content p', 2)
      .end()
  },

  'render multiple lines of content for a comment': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}post/4`)
      .assert.elementCount('.comments .comment .content p', 2)
      .end()
  },

  'render error page with refresh link on error': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}post/1`)
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}post/1`)
      .assert.elementCount('.v-alert', 0)
      .url(`${process.env.VUE_DEV_SERVER_URL}post/5`)
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}post/5`)
      .assert.elementCount('.v-alert', 1)
      .assert.containsText('.v-alert', 'FAKE_ERROR')
      .assert.elementCount('.v-alert a', 1)
      .assert.containsText('.v-alert a', 'HERE')
      .end()
  },

  'render error page with refresh link if post was not found': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}post/99`)
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}post/99`)
      .assert.containsText('.v-alert', 'not found')
      .end()
  }
}
