const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const adminSchema = new Schema({
    g:{
        type:String,
    },
    c:{
        type:String,
    },
    s:{
        type:String,
    },
    b:{
        type:String,
    },
    basic:{
        type:String,
    },
    pre:{
        type:String,
    },
    plat:{
        type:String,
    },
    basicd:{
        type:String,
    },
    pred:{
        type:String,
    },
    platd:{
        type:String,
    },
});

const adminModel = db.model('admin',adminSchema);
module.exports = adminModel;