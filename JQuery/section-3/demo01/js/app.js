$(document).ready(function(){
 
  $("#hide").on("click",ClicktoHide);
  function ClicktoHide()
  {
    $("#box").hide();
  };
  $("#show").on("click",Clicktoshow);
  function Clicktoshow()
  {
    $("#box").show();
  };
  $("#hs").on("click",Clicktotoggle);
  function Clicktotoggle()
  {
    $("#box").toggle();
  };

});