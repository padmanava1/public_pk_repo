var express = require('express');
const UserController = require('../controllers/userControlller');
var router = express.Router();
const app = express();
app.use(express.json());
const UserControler = require('../controllers/userControlller');

router.post('/create',UserControler.create)
router.get('/',UserController.get)
router.get('/:uid',UserControler.getParticularUser)

module.exports = router;
