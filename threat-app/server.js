const http = require("http");
const fs = require("fs");
const path = require("path");

const port = process.env.PORT || 3000;
const buildDir = path.join(__dirname, "build");

const mimeTypes = {
  ".html": "text/html",
  ".js": "application/javascript",
  ".css": "text/css",
  ".json": "application/json",
  ".png": "image/png",
  ".svg": "image/svg+xml",
  ".ico": "image/x-icon",
  ".txt": "text/plain",
};

const server = http.createServer((req, res) => {
  // health check route
  if (req.url === "/health") {
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(JSON.stringify({ status: "ok" }));
    return;
  }

  // serve static files from the build folder
  let filePath = path.join(buildDir, req.url === "/" ? "index.html" : req.url);
  const ext = path.extname(filePath);

  fs.readFile(filePath, (err, content) => {
    if (err) {
      // fallback to index.html for React client-side routing
      fs.readFile(path.join(buildDir, "index.html"), (err2, indexContent) => {
        if (err2) {
          res.writeHead(500);
          res.end("Server error");
          return;
        }
        res.writeHead(200, { "Content-Type": "text/html" });
        res.end(indexContent);
      });
      return;
    }
    res.writeHead(200, { "Content-Type": mimeTypes[ext] || "application/octet-stream" });
    res.end(content);
  });
});

server.listen(port, "0.0.0.0", () => {
  console.log(`Server running on port ${port}`);
});