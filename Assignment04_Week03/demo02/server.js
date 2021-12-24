const express = require('express');  
const app=express();  
const  port = 3000;
app.get('/', function (req, res) {  
  res.sendFile( __dirname + "/" + "index.html" );  
}) ;
app.get('/get_example3', function (req, res) {  
res.send('<p>Firstname: ' + req.query['firstname']+'</p><p>Lastname: '+req.query['lastname']+'<p><p>Password: '+req.query['password']+'</p><p>AboutYou: '+req.query['aboutyou']+'</p>');  
})  ;
app.listen(port,()=>{
  console.log(`http://localhost:${port} Express server started `);
}) 