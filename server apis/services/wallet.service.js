const walletrmodel = require('../model/wallet.modal');

class walletService{
   static async registerwallet(number,notpay,paid,topup,cbill){
        try{
            const cretewallet = new walletrmodel({number,notpay,paid,topup,cbill});
            return await cretewallet.save();
        } catch(e){
            console.log(e)
            res.json({status:false,sucess:"server error service register"});
        }
   }

   static async getwallet(number){
    try{
        return await walletrmodel.findOne({number});
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

   static async updatewallet(number,notpay,paid,topup,cbill){
    try{
        return await walletrmodel.findOneAndUpdate({number:number},
            {$set:{notpay:notpay,paid:paid,topup:topup,cbill:cbill}});
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

   static async updatewallettopup(number){
    try{
        const a = await walletrmodel.findOne({number});
        const b = (parseInt(a.topup)+100).toString();
        await walletrmodel.findOneAndUpdate({number:number},{$set:{topup:b}});
    } catch(e){
        console.log(e)
            res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

}

module.exports = walletService;