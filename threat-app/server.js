const express = require("express");
const path = require("path");

const app = express();
const port = process.env.PORT || 80;

app.use(express.static(path.join(__dirname, "build")));

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.listen(port, "0.0.0.0", () => {
  console.log(`Health check server running on port ${port}`);
});