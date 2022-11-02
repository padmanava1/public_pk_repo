var express = require('express');

const app = express();
const User = require('../models/user_model');

class UserController{
    static async create(req,res){
           const user = await  User.create(req.body);
           user.save();
           res.send(user);
           console.log(JSON.stringify(user));
           res.end();

    }

    static async get(req,res){
        const user = await User.find();
        res.send(user);
        res.end();
    }

    static async getParticularUser(req,res){
        const user = await User.find({_id:req.params.uid});
        res.send(user);
        console.log(JSON.stringify(user))
        res.end();
    }

}


module.exports = UserController;

