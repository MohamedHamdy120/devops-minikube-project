const express = require('express');
const app = express();

// Use PORT from environment (for cloud/Kubernetes) or default to 3000 locally
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.json({
    message: 'Hello from DevOps Minikube project',
  });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
