$(document).ready(function()
{
  $("#btn1").click(function()
  {
    $("#h1").append("<h5>Append h1 tag</h5>")
  });
  $("#btn2").click(function()
  {
    $("#h1").prepend("<h5>Append h1 tag</h5>")
  });
  $("#btn3").click(function()
  {
    $("#h1").remove("<h5>Append h1 tag</h5>")
  });
  
})