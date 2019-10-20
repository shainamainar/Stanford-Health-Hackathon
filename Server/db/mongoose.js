const mongoose = require('mongoose');
const { databasePassword, databaseUsername } = require('../config');

mongoose.Promise = global.Promise;

mongoose
  .connect(
    `mongodb+srv://${databaseUsername}:${databasePassword}@mongoauth-p7hnd.mongodb.net/test?retryWrites=true&w=majority`,
    { useNewUrlParser: true, useCreateIndex: true, useUnifiedTopology: true }
  )
  .then(() => {
    console.log('Database connected...');
  })
  .catch(err => {
    console.log(err);
  });

module.exports = mongoose;
