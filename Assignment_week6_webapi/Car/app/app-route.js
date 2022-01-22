module.exports=(app)=>{
  const express = require('express');
  const ROUTE = express.Router();
  const CarController=require('./car-controller');
  ROUTE.get('/cars',CarController.findAll);
  ROUTE.get('/cars/:id',CarController.findByPk);
  ROUTE.post('/cars/add',CarController.create);
  ROUTE.put('/cars/update/:id',CarController.update);
  ROUTE.delete('/cars/delete/:id',CarController.delete);

  app.use('/app',ROUTE);
}