const service = require('../services/service.service');
const users = require('../services/user.service');

exports.registerservice = async(req,res,next)=>{
    try{
        const {number,title,des,duration,price,frequency,servantcat} = req.body;
        await service.registerservice(number,title,des,duration,price,frequency,servantcat);
        res.json({status:true,sucess:"service registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller register"});
    }
}

exports.getservices = async(req,res,next)=>{
    try{
        const {number} = req.body;
        const numberdata = await service.getservices(number);
        const userdata = await users.checkuser(numberdata.number)
        const combinedData = [];
            // Loop over each item in numberdata
            for (const item of numberdata) {
                if (item.number !== undefined) {
                    const userdata = await users.checkuser(item.number);

                    // Combine the current number item with its corresponding userdata
                    combinedData.push({ number: item, user: userdata });
                }
            }
        res.status(200).json({message:combinedData});
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller mood"});
    }
}

exports.getservice = async(req,res,next)=>{
    try{
        const {} = req.body;
        const numberdata = await service.getservice();
        const userdata = await users.checkuser(numberdata.number)
        const combinedData = [];
            // Loop over each item in numberdata
            for (const item of numberdata) {
                if (item.number !== undefined) {
                    const userdata = await users.checkuser(item.number);

                    // Combine the current number item with its corresponding userdata
                    combinedData.push({ number: item, user: userdata });
                }
            }
        res.status(200).json({message:combinedData});
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller mood"});
    }
}

exports.updatedservice = async(req,res,next)=>{
    try{
        const {number,title,des,duration,price,frequency,servantcat} = req.body;
        const numberdata = await service.updatedservice(number,title,des,duration,price,frequency,servantcat);
        res.json({status:true,sucess:"service update Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller mood"});
    }
}


exports.deleteservice = async(req,res,next)=>{
    try{
        const {id} = req.body;
        await service.deleteservice(id);
        res.json({status:true,sucess:"service delete Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,sucess:"server error controller mood"});
    }
}

exports.getoneservice = async(req,res,next)=>{
    try{
        const {id} = req.body;
        const s = await service.getoneservice(id);
        res.json({data:s});
    } catch (e){
        console.log(e)
        res.json({data:{}});
    }
}