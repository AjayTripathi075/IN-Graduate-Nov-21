const express = require('express');  
const app = express();  
const  port = 3000;
app.use(express.static('public'));  // hold the references
  
app.get('/', function (req, res) {  
   res.sendFile( __dirname + "/" + "index.html" );  
})  
app.get('/process_get', function (req, res) {  
response = {  
       first_name:req.query.first_name,  
       last_name:req.query.last_name  
   };  
   console.log(response);  
   res.end(JSON.stringify(response));  
})  
app.listen(port,()=>{
  console.log(`http://localhost:${port} Express server started `);
})