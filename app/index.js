const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hola! Soy la versión Blue-Green funcionando");
});

app.listen(3000, () => console.log("App running on port 3000"));