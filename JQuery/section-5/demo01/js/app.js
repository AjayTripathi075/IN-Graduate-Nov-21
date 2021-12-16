$(document).ready(function()
{
  $("#append").click(function()
  {
    $("p:first").append(" Hello");
  });
  $("#prepend").click(function()
  {
    $("p:first").prepend(" Hello");
  });
});