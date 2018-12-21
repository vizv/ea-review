module.exports = {
  'render multiple posts in listing': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .assert.elementCount('.v-list > .post', 5)
      .end()
  },

  'render single post in listing': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts?page=2`)
      .assert.elementCount('.v-list > .post', 1)
      .end()
  },

  'post info in the listing should contains a title, an author, and count of comments': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts?page=2`)
      .assert.containsText('.v-list > .post', 'FAKE_POST_TITLE_1')
      .assert.containsText('.v-list > .post', 'FAKE_USER_NAME_1')
      .assert.containsText('.v-list > .post', '1 comment')
      .end()
  },

  'use plural form for comments count if count is not 1': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .assert.containsText('.v-list', '0 comments')
      .assert.containsText('.v-list', '1 comment')
      .assert.containsText('.v-list', '2 comments')
      .assert.containsText('.v-list', '3 comments')
      .end()
  },

  'navigate to post show view on click': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .click('.v-list > .post')
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}post/1`)
      .end()
  },

  'render same page on navigation back after viewing post': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts?page=2`)
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}posts?page=2`)
      .assert.elementCount('.v-list > .post', 1)
      .click('.v-list > .post')
      .back()
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}posts?page=2`)
      .assert.elementCount('.v-list > .post', 1)
      .end()
  },

  'render pagination component': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .assert.elementCount('.v-pagination__item', 5)
      .assert.elementCount('.v-pagination__item--active', 1)
      .end()
  },

  'highlight current page on pagination component': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts?page=2`)
      .assert.elementCount('.v-pagination__item--active', 1)
      .assert.containsText('.v-pagination__item--active', '2')
      .end()
  },

  'render pagination component with various size': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts?page=3`)
      .assert.elementCount('.v-pagination__item', 3)
      .assert.elementCount('.v-pagination__item--active', 1)
      .assert.containsText('.v-pagination__item--active', '3')
      .end()
  },

  'hide pagination component if there is only one page': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .assert.elementCount('.v-pagination', 1)
      .url(`${process.env.VUE_DEV_SERVER_URL}posts?page=5`)
      .assert.elementCount('.v-pagination', 0)
      .end()
  },

  'navigate to corresponding page on pagination item click': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .click('.v-pagination > :nth-child(3) > .v-pagination__item')
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}posts?page=2`)
      .end()
  },

  'render same page on navigation back after switch page': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .assert.elementCount('.v-list > .post', 5)
      .click('.v-pagination > :nth-child(3) > .v-pagination__item')
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}posts?page=2`)
      .assert.elementCount('.v-list > .post', 1)
      .back()
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .assert.elementCount('.v-list > .post', 5)
      .end()
  },

  'render error page with refresh link on error': browser => {
    browser
      .url(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}posts`)
      .assert.elementCount('.v-alert', 0)
      .url(`${process.env.VUE_DEV_SERVER_URL}posts?page=4`)
      .assert.urlEquals(`${process.env.VUE_DEV_SERVER_URL}posts?page=4`)
      .assert.elementCount('.v-alert', 1)
      .assert.containsText('.v-alert', 'FAKE_ERROR')
      .assert.elementCount('.v-alert a', 1)
      .assert.containsText('.v-alert a', 'HERE')
      .end()
  }
}
