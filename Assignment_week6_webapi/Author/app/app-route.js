module.exports=(app)=>{
  const express = require('express');
  const ROUTE = express.Router();
  const AuthorController=require('./author-controller');
  ROUTE.get('/authors',AuthorController.findAll);
  ROUTE.get('/authors/:id',AuthorController.findByPk);
  ROUTE.post('/authors/add',AuthorController.create);
  ROUTE.put('/authors/update/:id',AuthorController.update);
  ROUTE.delete('/authors/delete/:id',AuthorController.delete);

  app.use('/app',ROUTE);
}