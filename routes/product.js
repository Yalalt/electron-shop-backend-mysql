import express from "express";
import {
  createProduct,
  getProducts
} from "../services/prod-service.js";

const router = express.Router();

let productsTable = [];

router.get("/", (req, res) => {
  res.send("GET request hariug butsaalaa. OK");
});

router.get("/?", async (req, res) => {
  console.log("All product awah huselt");
  const { query } = req;
  const result = await getProducts(query.prod_no);
  res.status(200).send(result);
});

router.post("/", async (req, res) => {
  console.log("Request ADD Product");
  productsTable.push(req.body);
  const prod = req.body;
  // id, name, brandId, categoryId, desc, sale, price, stock, image
  await createProduct(
    prod.id,
    prod.name,
    prod.brandId,
    prod.categoryId,
    prod.desc,
    prod.sale,
    prod.price,
    prod.stock,
    prod.image
  );
  res.status(200).send(productsTable);
});

export default router;
