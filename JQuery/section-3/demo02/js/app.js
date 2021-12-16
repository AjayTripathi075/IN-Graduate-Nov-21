$(document).ready(function(){
 
  $("#fin").on("click",fadeInf);
  function fadeInf()
  {
    $("#box").fadeIn();
  };
  $("#fout").on("click",fadeOutf);
  function fadeOutf()
  {
    $("#box").fadeOut();
  };
  $("#ft").on("click",fadeToTogglef);
  function fadeToTogglef()
  {
    $("#box").fadeToggle(2000);
  };

});