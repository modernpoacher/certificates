import debug from 'debug'
import nconf from 'nconf'

const log = debug('@modernpoacher/certificates')
const error = debug('@modernpoacher/certificates/error')

log('`certificates` is awake')

try {
  nconf
    .argv()
    .file({
      file: nconf.get('file') || 'certificates.json'
    })
    .required([
      'country',
      'state',
      'locality',
      'organisation',
      'commonName',
      'emailAddress'
    ])
} catch ({
  message = 'N/A'
}) {
  error(message)

  process.exit(1)
}

export default nconf.get()
