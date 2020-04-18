const express = require('express'),
      app     = express(),
      fs      = require('fs'),
      userFns = require('./functions/functions')

let directory = process.argv[2],
    port      = process.env.PORT || 1234

app.set('view engine', 'ejs')
app.use(express.static('/'))
app.use(express.static('public'))

app.get('/', (req, res) => {
    fs.readdir(directory, (err, filenames) => {
        let list = []
        if (err) {
            console.log(err)
            return
        }
        for (let i = 0; i < filenames.length; i++){
            let extension = filenames[i].split('.').pop()
            if (extension === 'png' || extension === 'jpg' || extension === 'gif') {
                let name = filenames[i]
                name = name.split(' ').join('%20')
                list.push(directory+'/'+name)
            }
        }
        res.render('index', {data: list})         
    })
})

app.listen(port, () => {
    console.log(`Connect to Same Network and Goto http://${userFns.getIpAdress()}:${port}/`)
})