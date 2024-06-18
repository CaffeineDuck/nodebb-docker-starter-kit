db.createUser({
  user: "${MONGO__USERNAME}",
  pwd: "${MONGO__PASSWORD}",
  roles: [
    { role: "readWrite", db: "${MONGO__DATABASE}" },
    { role: "clusterMonitor", db: "admin" },
  ],
});
