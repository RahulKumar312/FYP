const admin = require('../model/admin.modal');
const app = require('express').Router();

app.post('/alladmin', async (req, res, next) => {
    try {
      const user = await admin.find();
      res.status(200).json({ status:true ,data:user});
    } catch (error) {
      console.log(error);
      res.status(500).json({ status:false,data:[] });
    }
});

app.post('/admincom', async (req, res, next) => {
  try {
    const { id, g,c,s,b } = req.body;
    await admin.findByIdAndUpdate(id,{$set:{g:g,c:c,s:s,b:b}});
    res.status(200).json({ status:true});
  } catch (error) {
    console.log(error);
    res.status(500).json({ status:false});
  }
});

app.post('/adminplan', async (req, res, next) => {
  try {
    const { id,basic,pre,plat,basicd,pred,platd } = req.body;
    await admin.findByIdAndUpdate(id,{$set:{basic:basic,pre:pre,plat:plat,
      basicd:basicd,pred:pred,platd:platd}});
    res.status(200).json({ status:true});
  } catch (error) {
    console.log(error);
    res.status(500).json({ status:false});
  }
});

module.exports = app;