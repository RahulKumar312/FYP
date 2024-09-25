const router = require('express').Router();
const serviceController = require('../controller/service.controller');

router.post("/registerservice",serviceController.registerservice);
router.post("/getservice",serviceController.getservice);
router.post("/getservices",serviceController.getservices);
router.post("/updatedservice",serviceController.updatedservice);
router.post("/deleteservice",serviceController.deleteservice);
router.post("/getoneservice",serviceController.getoneservice);

module.exports = router;