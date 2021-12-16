$(document).ready(function(){
 $("#grow").click(function()
 {
   $("#box").animate({width:"500px"},1000);
 });
 $("#move").click(function()
 {
   $("#box").animate({left:"100px"},1000);
 });
 $("#increSize").click(function()
 {
   $("#box").animate({fontSize:"40px"},1000);
 });
 $("#doanything").click(function()
 {
   $("#box").animate({width : "500px",left : "100px",fontSize : "40px"},1000);
 });
});

