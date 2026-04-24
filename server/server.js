const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

mongoose.connect("mongodb://127.0.0.1:27017/supplychain");

app.post("/product", async (req, res) => {
    res.send("Product saved");
});

app.listen(5000, () => {
    console.log("Server running");
});