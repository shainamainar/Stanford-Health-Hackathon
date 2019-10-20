const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../db/models/user-model');
const secret = require('../config');

//********* REGISTER ROUTE *************\\

router.post('/register', (req, res) => {
  const { email, password, name } = req.body;

  let newUser = new User({
    email,
    password,
    name
  });

  newUser
    .save()
    .then(user => {
      if (!user) {
        return res.status(400).send();
      }

      return res.status(201).send({ user });
    })
    .catch(err => {
      if (err) {
        return res.status(400).send({ error: err });
      }
      return res.status(400).send();
    });
});

//********* LOGIN ROUTE *************\\

router.post('/login', (req, res) => {
  const { name, password } = req.body;
  User.findOne({ name })
    .then(user => {
      if (!user) {
        return res.status(400).send();
      }

      bcrypt
        .compare(password, user.password)
        .then(match => {
          if (!match) {
            return res.status(401).send();
          }

          let token = jwt.sign({ _id: user._id }, secret);

          return res
            .status(201)
            .header('x-auth', token)
            .send();
        })
        .catch(err => {
          return res.status(401).send({ error: err });
        });
    })
    .catch(err => {
      if (err) {
        return res.status(400).send({ err });
      }
      return res.status(400).send();
    });
});

module.exports = router;
