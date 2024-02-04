const debug = require('debug')

const log = debug('@modernpoacher/certificates')

log('`certificates` is awake')

module.exports = {
  presets: [
    [
      '@babel/env',
      {
        targets: {
          node: 'current'
        },
        useBuiltIns: 'usage',
        corejs: 3
      }
    ]
  ]
}
