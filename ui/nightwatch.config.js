module.exports = {
  test_settings: {
    chrome: {
      desiredCapabilities: {
        browserName: 'chrome',
        'chromeOptions': {
          'args': ['no-sandbox', 'headless', 'disable-gpu']
        }
      }
    }
  }
}
