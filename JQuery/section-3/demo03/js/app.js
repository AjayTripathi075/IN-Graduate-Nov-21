$(document).ready(function()
{
  $("div").hover(highlighttext);
  function highlighttext()
  {
    $(this).css("background-color", "yellow");
  };

});