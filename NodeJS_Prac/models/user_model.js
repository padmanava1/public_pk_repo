const mongoose = require('mongoose');

//mongoose.Promise = global.Promise;

// Connect MongoDB at default port 27017.
mongoose.connect('mongodb://localhost/User').then(console.log('Mongoose connected...'));
 // Declare the Schema of the Mongo model
 var userSchema = new mongoose.Schema({
    _id:{
        type:String
    },
     name:{
         type:String,
         required:true,
         unique:true,
         index:true,
     },
     email:{
         type:String,
         required:true,
         unique:true,
     },
     mobile:{
         type:String,
         required:true,
         unique:true,
     },
     password:{
         type:String,
         required:true,
     },
 });
 
 //Export the model
 module.exports = mongoose.model('User', userSchema);