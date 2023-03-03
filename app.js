import bodyParser from "body-parser";
import cors from "cors";
import express from "express";
import product_routes from "./routes/product.js";

const app = express();
const PORT = 3008;

app.use(bodyParser.json());
app.use(cors());


app.use(product_routes);
app.listen(PORT, ()=> {
    console.log("Server running 3008 Port");
})