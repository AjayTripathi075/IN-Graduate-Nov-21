const express = require('express');  
const app = express(); 
const port = 3000;

app.get('/', function (req, res) {  
  console.log("Got a GET request for the homepage");  
  res.send('Welcome to JavaTpoint!');  
})  
app.post('/', function (req, res) {  
  console.log("Got a POST request for the homepage");  
  res.send('I am Impossible! ');  
})  
app.delete('/del_student', function (req, res) {  
  console.log("Got a DELETE request for /del_student");  
  res.send('I am Deleted!');  
})  
app.get('/enrolled_student', function (req, res) {  
  console.log("Got a GET request for /enrolled_student");  
  res.send('I am an enrolled student.');  
})  
// This responds a GET request for abcd, abxcd, ab123cd, and so on  
app.get('/ab*cd', function(req, res) {     
  console.log("Got a GET request for /ab*cd");  
  res.send('Pattern Matched.');  
})  

app.listen(port,()=>{
  console.log(`http://localhost:${port} Express server started `);
})