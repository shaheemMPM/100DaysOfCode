const qrcode = require('qrcode-terminal')

let data = process.argv[2]

if (data === undefined) {
	console.log('Please Enter text to be converted to QR')
}else {
	qrcode.generate(data, {small: true})
}
