const UserService = require('../services/user.service');

exports.register = async(req,res,next)=>{
    try{
        const {number,name,gender,img,cnic,pass,
            address,age,cat,deviceid,fathername,experience,pvcname,pvcnumber,pvcdoc,servantcat,status,plans,counts,totalcounts} = req.body;
            const user = await UserService.checkuser(number);
        if(!user){
            const usercnic = await UserService.checkusercnic(cnic);
            if (!usercnic){
                const response = await UserService.registerUser(number,name,gender,img,cnic,pass,address,age,
                    cat,deviceid,fathername,experience,pvcname,pvcnumber,pvcdoc,servantcat,status,plans,counts,totalcounts);
                res.json({status:true,sucess:"User registered Sucessfully"});
            } else {
                res.json({status:false,sucess:"User cnic aldready exist"});
            }
        } else{
            res.json({status:false,sucess:"User aldready exist"});
        }
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller register"});
    }
}

exports.login = async(req,res,next)=>{
    try{
        const {number,pass,deviceid} = req.body;
        
        const user = await UserService.checkuser(number);
        if(!user){
            res.status(200).json({status:false,message:"no user found"});
        } else{

            const isMatch = await user.comparePassword(pass);
            if(isMatch == false){
                res.status(200).json({status:false,message:"invalid password"});
            } else{
                await UserService.updatedevice(user._id, deviceid);
                let tokenData = {number:user.number,name:user.name,gender:user.gender,
                    img:user.img,cnic:user.cnic,address:user.address,age:user.age,
                    cat:user.cat,deviceid: deviceid};
                const token = await UserService.generateToken({user},"learnandearn","1h")
                res.status(200).json({status:true,token:token,message:"login in sucessfully"});
            }
        }
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller login"});
    }
}

exports.findservant = async(req,res,next)=>{
    try{
        const {cat,servantcat} = req.body;
        const numberdata = await UserService.findservant(cat,servantcat);
        res.status(200).json({data:numberdata});
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller mood"});
    }
}

exports.findone = async(req,res,next)=>{
    try{
        const {number} = req.body;
        const user = await UserService.checkuser(number);
        res.status(200).json({data:user});
    } catch (e){
        console.log(e)
        res.json({data:{}});
    }
}

exports.allusers = async(req,res,next)=>{
    try{
        const rest = await UserService.allusers();
        res.status(200).json({status:true,user:rest});
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
}


exports.deleteuser = async(req,res,next)=>{
    try{
        const {id,status} = req.body;
        await UserService.deleteuser(id,status);
        res.status(200).json({status:true,sucess:"Operation sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"Operation Unsucessfully"});
    }
}


exports.updateof = async(req,res,next)=>{
    try{
        const {number,of} = req.body;
        await UserService.updateof(number,of);
        res.status(200).json({status:true});
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
}

exports.planupdate = async(req,res,next)=>{
    try{
        const {number,plans,totalcounts} = req.body;
        await UserService.planupdate(number,plans,totalcounts);
        res.status(200).json({status:true});
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
}

exports.counts = async(req,res,next)=>{
    try{
        const {number,counts} = req.body;
        await UserService.counts(number,counts);
        res.status(200).json({status:true});
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
}