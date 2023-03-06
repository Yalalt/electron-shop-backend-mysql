import express from "express";
import {
  createWishList, getWishList  
} from "../services/prod-service.js";

const router = express.Router();

let wishlistTbl = [];

router.get("/", async (req, res) => {
  const result = await getWishList();
  res.send({status: "GET request hariug butsaalaa. OK", data: result});
});


router.post("/", async (req, res) => {
  console.log("Add wishlist huselt irlee");
  wishlistTbl.push(req.body);
  await createWishList(req.body.id, req.body.userId, req.body.prodId);
  res.status(200).send(wishlistTbl);
});

export default router;
