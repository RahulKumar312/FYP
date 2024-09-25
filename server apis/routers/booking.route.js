const booking = require('../model/booking.modal');
const app = require('express').Router();

app.post('/registerbooking', async (req, res, next) => {
    try {
      const { uid, sid, sverid, date, notes, status,lat,lon } = req.body;
      const newChat = new booking({ uid, sid, sverid, date, notes, status,lat,lon });
      await newChat.save();
      res.status(200).json({ status: true });
    } catch (error) {
      console.error(error);
      res.status(500).json({ status: false });
    }
});

app.post('/allbookingbyuid', async (req, res, next) => {
    try {
        const {uid} = req.body;
      const user = await booking.find({uid});
      res.status(200).json({ status:true ,data:user});
    } catch (error) {
      console.log(error);
      res.status(500).json({ status:false,data:[] });
    }
});

app.post('/allbookingbysid', async (req, res, next) => {
  try {
    const { sid } = req.body;
    const user = await booking.find({sid});
    res.status(200).json({ status: true, data: user });
  } catch (error) {
    console.log(error);
    res.status(500).json({ status: false, data: [] });
  }
});

app.post('/allbooking', async (req, res, next) => {
  try {
    const user = await booking.find();
    res.status(200).json({ status: true, data: user });
  } catch (error) {
    console.log(error);
    res.status(500).json({ status: false, data: [] });
  }
});


app.post('/bookingupdatestatus', async (req, res, next) => {
    try {
      const { id,status } = req.body;
      await booking.findByIdAndUpdate(id, { $set: { status: status } });
      res.status(200).json({ status: true });
    } catch (error) {
      console.log(error);
      res.status(500).json({ status: false});
    }
  });

module.exports = app;