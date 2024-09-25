const usermodel = require('../model/user.modal');
const jwt = require("jsonwebtoken");

class UserService{
   static async registerUser(number,name,gender,img,
    cnic,pass,address,age,cat,deviceid,fathername,experience,pvcname,pvcnumber,pvcdoc,servantcat,status,plans,counts,totalcounts){
        try{
            const creteuser = new usermodel({number,name,gender,img,cnic,pass,address,
                age,cat,deviceid,fathername,experience,pvcname,pvcnumber,pvcdoc,servantcat,status,plans,counts,totalcounts});
            return await creteuser.save();
        } catch(e){
            console.log(e)
            res.json({status:false,sucess:"server error service register"});
        }
   }

   static async checkuser(number){
    try{
        return await usermodel.findOne({number});
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

   static async checkusercnic(cnic){
    try{
        return await usermodel.findOne({cnic});
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

   static async findservant(cat,servantcat){
    try{
        return await usermodel.find({cat,servantcat});
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

   static async updatedevice(userId,deviceid){
    try{
        await usermodel.findByIdAndUpdate(userId, { $set: { deviceid: deviceid } });
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

   static async generateToken(tokenData,secretKey,jwt_expiry){
    return jwt.sign(tokenData,secretKey,{expiresIn:jwt_expiry});
   }

   static async deleteuser(id,status){
    try{
        await usermodel.findByIdAndUpdate(id,{$set:{status:status}});
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

   static async allusers(){
    try{
        return await usermodel.find();
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }



   static async updateof(number,of){
    try{
        await usermodel.findOneAndUpdate({number:number},{$set:{of:of}});
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

   static async planupdate(number,plans,totalcounts){
    try{
        await usermodel.findOneAndUpdate({number:number},{$set:{plans:plans,totalcounts:totalcounts}});
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

   static async counts(number,counts){
    try{
        await usermodel.findOneAndUpdate({number:number},{$set:{counts:counts}});
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

}

module.exports = UserService;