const express = require('express');
const server = express();
const port = 3000;
const cors = require('cors');
const CORS_OPTIONS ={ origin:"http://localhost:4200"};
server.use(express.json());
server.use(express.urlencoded({extended:true}));
server.use(cors(CORS_OPTIONS));
//App Url "http://localhost:4200/app"
require('./app/app-route')(server);
//Main Url "http://localhost:3000/app"
server.get('/',(req,res)=>{
     res.send({message:"wel come to express + postgres + sql using Car database"});
})
server.listen(port,()=>{
  console.log(`http://localhost:${port} started`);
})

