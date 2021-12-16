$(document).ready(function()
{
  $("#appendTo").click(function()
  {
    $(".box p:first").appendTo(".box p:last");
  });
  $("#prependTo").click(function()
  {
    $(".box p:last").prependTo(".box p:first");
  });
});