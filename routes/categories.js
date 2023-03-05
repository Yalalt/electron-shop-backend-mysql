import express from "express";
import {
  createCategory
} from "../services/prod-service.js";

const router = express.Router();

let category = [];

router.get("/", (req, res) => {
  res.send("GET request hariug butsaalaa. OK");
});

router.post("/", async (req, res) => {
  console.log("Add category huselt irlee");
  category.push(req.body);
  await createCategory(req.body.id, req.body.name);
  res.status(200).send(category);
});

export default router;
