import express from "express";
import {
    createUser, getUser, getWishlistUserList
  } from "../services/prod-service.js";

  const router = express.Router();

  let usersTable = [];
  
  router.get('/', async (req, res) => {
    const result = await getUser();
    res.send({status: "Successfull send user data", data: result});
  });

  router.get('/uwl', async (req, res) => {
    const result = await getUser();
    res.send({status: "Successfull RIGHT JOIN send with wish list user data", data: result});
  });



  router.post("/", async (req, res) => {
    console.log("User ADD 0_0 /");
    const regis = req.body;
    usersTable.push(regis);
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
    res.status(200).send(usersTable);
  });
  
  export default router;
  