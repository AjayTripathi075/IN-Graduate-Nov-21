module.exports=(app)=>{
  const express = require('express');
  const ROUTE = express.Router();
  const HeroController=require('./hero-controller');
  ROUTE.get('/heros',HeroController.findAll);
  ROUTE.get('/heros/:id',HeroController.findByPk);
  ROUTE.post('/heros/add',HeroController.create);
  ROUTE.put('/heros/update/:id',HeroController.update);
  ROUTE.delete('/heros/delete/:id',HeroController.delete);

  app.use('/app',ROUTE);
}