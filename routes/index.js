const router = require("express").Router();

// import all routes
const authRoutes = require("./auth");

// root level routes
router.use("/", authRoutes);

module.exports = router;