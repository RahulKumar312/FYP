const router = require('express').Router();
const userController = require('../controller/user.controller');

router.post("/register",userController.register);
router.post("/login",userController.login);
router.post("/findservant",userController.findservant);
router.post("/findone",userController.findone);
router.post("/allusers",userController.allusers);
router.post("/deleteuser",userController.deleteuser);
router.post("/updateof",userController.updateof);
router.post("/planupdate",userController.planupdate);
router.post("/counts",userController.counts);

module.exports = router;
