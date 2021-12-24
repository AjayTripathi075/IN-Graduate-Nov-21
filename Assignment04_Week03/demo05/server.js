const express = require('express');  
const cookieParser = require('cookie-parser');  
const app = express();  
const port = 3000;
app.use(cookieParser());   

app.get('/cookieset',function(req, res){  
res.cookie('cookie_name', 'cookie_value');  
res.cookie('company', 'javatpoint');  
res.cookie('name', 'sonoo');  
  
res.status(200).send('Cookie is set');  
});  
app.get('/cookieget', function(req, res) {  
  res.status(200).send(req.cookies);  
});  
app.get('/', function (req, res) {  
  res.status(200).send('Welcome to JavaTpoint!');  
});  
app.listen(port,()=>{
  console.log(`http://localhost:${port} Express server started `);
})