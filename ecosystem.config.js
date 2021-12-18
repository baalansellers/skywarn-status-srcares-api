module.exports = {
  apps: [
    {
      name: "skywarn-status-srcares-api",
      script: "./build/index.js",
      env: {
        NODE_ENV: "development",
      },
      env_production: {
        NODE_ENV: "production",
      },
    },
  ],
};
