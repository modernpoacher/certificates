import debug from 'debug'
import {
  join
} from 'node:path'
import {
  ensureDir
} from 'fs-extra'
import {
  writeFile
} from 'node:fs/promises'
import PATH from '../../where-am-i.mjs'

const CERTIFICATES = join(PATH, 'certificates')
const FILE = join(CERTIFICATES, 'localhost.ext')

const log = debug('@modernpoacher/certificates')

function getExt (hostname, address) {
  return (`
authorityKeyIdentifier = keyid, issuer
basicConstraints = CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = localhost
IP.1 = 127.0.0.1
IP.2 = 0.0.0.0
IP.3 = ::1
DNS.2 = ${hostname.toLowerCase()}
IP.4 = ${address}
  `).trim().concat('\n')
}

log('`certificates` is awake')

export default async function ext (hostname, address) {
  await ensureDir(CERTIFICATES)
  await writeFile(FILE, getExt(hostname, address))
}
