const mongoose = require('mongoose');

const connection = mongoose.createConnection("mongodb+srv://k24467615:wVsbM1niiMl9KSEa@cluster0.afq7m3g.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")
    .on('open',()=>{
    console.log('MongoDb connected');
}).on('error',()=>{
    console.log('MongoDb error');
});

module.exports = connection;
