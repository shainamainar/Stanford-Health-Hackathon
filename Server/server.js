const express = require('express');
const app = express();
const mongoose = require('./db/mongoose');
const userRoutes = require('./routes/user-routes');
const bodyParser = require('body-parser');
const private = require('./routes/private');

app.use(bodyParser.json());

app.use('/user', userRoutes);
app.use('/private', private);

const PORT = 3000;
app.listen(3000, () => {
  console.log(`Server started on port ${PORT}`);
});
