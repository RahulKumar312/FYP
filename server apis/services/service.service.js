const servicemodel = require('../model/service.modal');

class photoService{
   static async registerservice(number,title,des,duration,price,frequency,servantcat){
        try{
            const serverorder = new servicemodel({number,title,des,duration,price,frequency,servantcat});
            return await serverorder.save();
        } catch(e){
            console.log(e)
        }
   }

   static async getservice(){
    try{
        return await servicemodel.find();
    } catch(e){
        console.log(e)
    }
   }

   static async getoneservice(id){
    try{
        return await servicemodel.findById(id);
    } catch(e){
        console.log(e)
    }
   }

   static async getservices(number){
    try{
        return await servicemodel.find({number});
    } catch(e){
        console.log(e)
    }
   }

   static async updatedservice(number,title,des,duration,price,frequency,servantcat){
    try {
        await servicemodel.findByIdAndUpdate(number,
             { $set: {title:title,des:des,frequency:frequency,servantcat:servantcat,
                price:price,duration:duration}});
    } catch(e) {
        console.log(e)
        res.json({status:false,sucess:"server error service chcekuser"});
    }
   }

   static async deleteservice(id){
    try{
        return await servicemodel.findByIdAndDelete(id);
    } catch(e){
        console.log(e)
    }
   }

}

module.exports = photoService;