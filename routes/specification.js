import express from "express";
import {
  createSpecification
} from "../services/prod-service.js";

const router = express.Router();

let specificationTable = [];

router.get("/", (req, res) => {
  res.send("GET request hariug butsaalaa. OK");
});

router.post("/", async (req, res)=> {
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

export default router;
