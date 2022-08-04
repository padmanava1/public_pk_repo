const express = require('express')
const app = express()
const port = 3000
const userRouter = require('./routers/userRouter');
app.use(express.json());


app.use('/user', userRouter)






app.listen(port, () => console.log(`listening on port ${port}!`))




