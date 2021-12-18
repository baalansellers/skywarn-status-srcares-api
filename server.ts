import express from "express";
import cors from "cors";
import axios from "axios";
import cheerio from "cheerio";

const PORT = 80;
const CORS_ORIGIN = "http://localhost:3000";

const app = express();
const corsOptions: cors.CorsOptions = {
  origin: CORS_ORIGIN,
  optionsSuccessStatus: 200,
};

app.use(cors(corsOptions));

app.get("/status", async (req, res) => {
  const resp = await axios.get("https://srcares.org/activation-level-status/");
  const $ = await cheerio.load(resp.data);

  const imageURL = $("div.entry-content figure img").attr("data-orig-file");

  console.log(imageURL);

  res.status(200).send({ imageURI: imageURL });
});

app.listen(PORT, () => {
  console.log(
    `Server started at ${CORS_ORIGIN}:${PORT}. Press Ctrl+C to quit.`
  );
});
