const express = require("express");
const app = express();

const PORT = process.env.PORT || 3000;
const COLOR = process.env.COLOR || "blue";

app.get("/", (req, res) => {
  res.send(`<h1>App Running (${COLOR})</h1>`);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT} (${COLOR})`);
});