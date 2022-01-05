const express = require('express');
const { USERS } = require('./users');
const cors = require('cors');
const server = express();
const port = 3000;
const users=USERS;
const CORS_OPTIONS=
{
  origin :"http://localhost:4200",
  optionsSuccessStatus: 200 
}

server.use(express.json());
server.use(express.urlencoded({extended:true}));
server.use(cors(CORS_OPTIONS));

server.get('/',(req,res)=>
{
 res.send("Welcome to Express")
})
server.get('/userapi/',(req,res)=>{
  res.setHeader("Content-Type","application/json")
  res.send(users);
});

server.post('/userapi/add',(req,res)=>{
  res.setHeader("Content-Type","application/json")
  console.log(req.body);
  const user=req.body;
  users.push(user);
  res.send(JSON.stringify(user)+" added in user list");

});

server.listen(port,()=>{
  console.log("http://localhost:3000/userapi started ");
});