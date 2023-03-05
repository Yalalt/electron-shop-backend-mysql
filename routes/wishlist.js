import express from "express";
import {
  createWishList  
} from "../services/prod-service.js";

const router = express.Router();

let wishlistTbl = [];

router.get("/", (req, res) => {
  res.send("GET request hariug butsaalaa. OK");
});


router.post("/", async (req, res) => {
  console.log("Add wishlist huselt irlee");
  wishlistTbl.push(req.body);
  await createWishList(req.body.id, req.body.userId, req.body.prodId);
  res.status(200).send(wishlistTbl);
});

export default router;
