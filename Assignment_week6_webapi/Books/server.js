const express = require('express');
const server = express();
const port = 3000;
const cors = require('cors');
const CORS_OPTION = {origin:"https://localhost:4200"};
server.use(express.json());
server.use(express.urlencoded({extended:true}));
server.use(cors(CORS_OPTION));
const db = require('./db/models');
db.sequelize.sync();

require('./app/app-route')(server);

server.get('/',(req,res)=>{
  res.send({message:"welcome to express + postgresql + nodejs"});
})

server.listen(port,()=>{
  console.log(`http://localhost:${port} started`);
})