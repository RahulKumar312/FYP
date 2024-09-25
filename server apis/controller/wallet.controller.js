const walletService = require('../services/wallet.service');

exports.registerwallet = async(req,res,next)=>{
    try{
        const {number,notpay,paid,topup,cbill} = req.body;
        const a = await walletService.getwallet(number);
        if(a){
            res.status(200).json({status:true,message:"wallet already registered"});
        } else {
            const response = await walletService.registerwallet(number,notpay,paid,topup,cbill);
            res.json({status:true,sucess:"wallet registered Sucessfully"});
        }
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller register"});
    }
}

exports.getwallet = async(req,res,next)=>{
    try{
        const {number} = req.body;
        const rest = await walletService.getwallet(number);
        if(!rest){
            res.status(200).json({status:false,message:"no order found"});
        } else{
            res.status(200).json({status:true,rest:rest,message:"order founded"});
        }
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller login"});
    }
}

exports.updatewallet = async(req,res,next)=>{
    try{
        const {number,notpay,paid,topup,cbill} = req.body;
        const rest = await walletService.updatewallet(number,notpay,paid,topup,cbill);
        if(!rest){
            res.status(200).json({status:false,message:"no order found"});
        } else{
            res.status(200).json({status:true,rest:rest,message:"order founded"});
        }
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller login"});
    }
}


exports.updatewallettopup = async(req,res,next)=>{
    try{
        const {number} = req.body;
        const rest = await walletService.updatewallettopup(number);
        res.status(200).json({status:true,sucess:"order founded"});
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller login"});
    }
}