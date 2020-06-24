import express from "express";
import httpProxyMiddleware from "http-proxy-middleware";

const { createProxyMiddleware } = httpProxyMiddleware;
const REMOTE_SERVER_DOMAIN = process.env.REMOTE_SERVER_DOMAIN;

const pwaProxy = createProxyMiddleware({
  target: `http://localhost:3003`,
  ws: true,
});
const magentoProxy = createProxyMiddleware({
  target: `http://${REMOTE_SERVER_DOMAIN}`,
  logLevel: "debug",
});

const app = express();
app.use("/graphql", magentoProxy);
app.use("/static", magentoProxy);
app.use("/media", magentoProxy);
app.use("/admin", magentoProxy);
app.use("/", pwaProxy);

const hostname = process.env.LOCAL_DOMAIN || "0.0.0.0";
const port = process.env.LOCAL_PORT || 8044;
app
  .listen(port, hostname, function () {
    console.log(`Server is listening on http://${hostname}:${port}`);
  })
  .on("error", (err) => {
    console.error("Error when starting reverse-proxy", err);
  });
