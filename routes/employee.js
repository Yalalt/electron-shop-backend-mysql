import express from "express";
import { getEmployees } from "../services/prod-service";

const Router = express.Router();

let product = [{
    "id": 1,
    "name": "iphone 14 Pro"
}];


Router.get("/products", (req, res) => {
    console.log("All product awah huselt");
    res.status(200).send("All request result");
});
Router.get("/employee", async (req, res) => {
    console.log("All product awah huselt");
    const { query } = req;
    const result = await getEmployees(query.emp_no);
    res.status(200).send(result);
});

Router.post("/product", (req, res) => {
    console.log("All product NEMEH POST huselt irlee");
    console.log("Req BODY ==>", req.body);
    product.push(req.body);
    console.log(product);
    res.status(200).send({status: "Welcome product huselt irlee, ADD Product", data: product});
});

Router.get("/", (req, res) => {
    res.send("GET request hariug butsaalaa. OK");
});


export default Router;