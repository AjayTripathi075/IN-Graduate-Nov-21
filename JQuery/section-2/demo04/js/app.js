
$(document).ready(function(){
  $("p").on("click", mouseClick());
  $("p").on("mouseleave", mouseleave());
  function mouseClick(){
    alert("The paragraph was clicked.");
  };
  function mouseleave(){
    alert("bye.");
  };
});
