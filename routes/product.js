import express from "express";
import {
  createCategory,
  createProduct,
  createSpecification,
  createUser,
  createWishList,
  getProducts,
} from "../services/prod-service.js";

const Router = express.Router();

let productsTable = [];
let category = [];
let usersTable = [];
let specificationTable = [];
let wishlistTbl = [];

Router.get("/products/?", async (req, res) => {
  console.log("All product awah huselt");
  const { query } = req;
  const result = await getProducts(query.prod_no);
  res.status(200).send(result);
});

Router.post("/category", async (req, res) => {
  console.log("Add category huselt irlee");
  category.push(req.body);
  await createCategory(req.body.id, req.body.name);
  res.status(200).send(category);
});

Router.post("/wishlist", async (req, res) => {
  console.log("Add wishlist huselt irlee");
  wishlistTbl.push(req.body);
  await createWishList(req.body.id, req.body.userId, req.body.prodId);
  res.status(200).send(wishlistTbl);
});

Router.post("/user", async (req, res) => {
  console.log("User ADD 0_0 /");
  usersTable.push(req.body);
  const regis = req.body;
  // id, name, role, password, email, contact, address1, address2, userImage, registerDate
  await createUser(
    regis.id,
    regis.name,
    regis.role,
    regis.password,
    regis.email,
    regis.contact,
    regis.address1,
    regis.address2,
    regis.user_image
  );
  console.log(req.body);
  res.status(200).send(usersTable);
});

Router.post("/product", async (req, res) => {
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

Router.post("/specification", async (req, res)=> {
    console.log("Create Specification huselt");
    const spec = req.body;
    specificationTable.push(spec);
    await createSpecification(
        spec.specId,
        spec.prodId,
        spec.property,
        spec.value
    );

    res.status(200).send(specificationTable);
});

Router.get("/", (req, res) => {
  res.send("GET request hariug butsaalaa. OK");
});

export default Router;
