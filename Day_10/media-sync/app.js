const express = require('express'),
      app     = express(),
      fs      = require('fs'),
      userFns = require('./functions/functions')

let flag      = process.argv[2],
    port      = process.env.PORT || 1234

app.set('view engine', 'ejs')
app.use(express.static('/'))
app.use(express.static('public'))

app.get('/', (req, res) => {
    if (flag === 'f') {
        let directory = process.argv[3]
        directory = directory.split(' ').join('\ ')
        fs.readdir(directory, (err, filenames) => {
            let list = []
            if (err) {
                console.log(err)
                return
            }
            for (let i = 0; i < filenames.length; i++){
                let extension = filenames[i].split('.').pop() 
                let image_extensions = ['jpeg', 'jpg', 'png', 'gif', 'svg', 'bmp', 'ico', 'apng']
                let video_extensions = ['mp4', 'ogg', 'webm', 'mov']
                if (image_extensions.includes(extension)) {
                    let name = filenames[i]
                    name = name.split(' ').join('%20')
                    list.push({type: 'image', path: directory+'/'+name})
                }else if (video_extensions.includes(extension)) {
                    let name = filenames[i]
                    name = name.split(' ').join('%20')
                    list.push({type: 'video', path: directory+'/'+name})
                }
            }
            res.render('index', {data: list})         
        })
    } else if (flag === 'l') {
        let link = process.argv[3]
        res.render('link', {data: link})
    }
})

app.listen(port, () => {
    console.log(`Connect to Same Network and Goto http://${userFns.getIpAdress()}:${port}/`)
})
