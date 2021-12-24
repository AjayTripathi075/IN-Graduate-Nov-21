const express = require('express');  
const app = express();  
const port = 3000;
const bodyParser = require('body-parser');  
// Create application/x-www-form-urlencoded parser  
var urlencodedParser = bodyParser.urlencoded({ extended: false })  

app.use(express.static('public'));  

app.get('/', function (req, res) {  
   res.sendFile( __dirname + "/" + "index.html" );  
})  
app.post('/process_post', urlencodedParser, function (req, res) {  
   // Prepare output in JSON format  
   response = {  
       first_name:req.body.first_name,  
       last_name:req.body.last_name  
   };  
   console.log(response);  
   res.end(JSON.stringify(response));  
});  

app.listen(port,()=>{
  console.log(`http://localhost:${port} Express server started `);
}) ;