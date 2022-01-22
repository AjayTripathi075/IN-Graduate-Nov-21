module.exports=(app)=>{
  const express = require('express');
  const ROUTE = express.Router();
  const AccountController=require('./account-controller');
  ROUTE.get('/accounts',AccountController.findAll);
  ROUTE.get('/accounts/:id',AccountController.findByPk);
  ROUTE.post('/accounts/add',AccountController.create);
  ROUTE.put('/accounts/update/:id',AccountController.update);
  ROUTE.delete('/accounts/delete/:id',AccountController.delete);

  app.use('/app',ROUTE);
}