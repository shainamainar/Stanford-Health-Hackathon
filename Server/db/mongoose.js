const mongoose = require('mongoose');
const { databasePassword, databaseUsername } = require('../config');

mongoose.Promise = global.Promise;

mongoose
  .connect(
    `mongodb+srv://admin:suhacks2019@melli2s-qgwta.gcp.mongodb.net/test?retryWrites=true&w=majority`,
    { useNewUrlParser: true, useCreateIndex: true, useUnifiedTopology: true }
  )
  .then(() => {
    console.log('Database connected...');
  })
  .catch(err => {
    console.log(err);
  });

module.exports = mongoose;
