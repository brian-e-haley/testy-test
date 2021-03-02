const express = require('express')
const path = require('path')

const app = express()

const build = './build'

const { ENV, PORT } = { ...process.env }

app.set('views', path.join(__dirname, build))
app.engine('html', require('ejs').renderFile)
app.use(
    '/static',
    express.static(path.join(__dirname, `${build}/static`)),
)
app.get('/', function (req, res) {
    res.render('index.html', { ENV })
})
app.listen(process.env.PORT, () => console.log(`Example app listening on port ${process.env.PORT}!`))
