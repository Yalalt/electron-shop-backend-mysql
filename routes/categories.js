import express from "express";
import { createCategory, getCategory } from "../services/prod-service.js";

const router = express.Router();

let category = [];

router.get("/", async (req, res) => {
  const result = await getCategory();
  res.send({ status: "GET request hariug butsaalaa. OK", data: result });
});

router.post("/", async (req, res) => {
  console.log("Add category huselt irlee");
  category.push(req.body);
  await createCategory(req.body.id, req.body.name);
  res.status(200).send(category);
});

export default router;
