import bodyParser from "body-parser";
import cors from "cors";
import express from "express";
import dotenv from "dotenv";

import product_routes from "./routes/product.js";
import user_routes from "./routes/users.js";
import categories_routes from "./routes/categories.js";
import specification_routes from "./routes/specification.js";
import wishlist_routes from "./routes/wishlist.js";

dotenv.config({ path: "./config/config.env" });
const app = express();
app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use("/product", product_routes);
app.use("/user", user_routes);
app.use("/category", categories_routes);
app.use("/specification", specification_routes);
app.use("/wishlist", wishlist_routes);

app.listen(process.env.PORT, () => {
  console.log(`Server running on ${process.env.PORT} Port`);
});
