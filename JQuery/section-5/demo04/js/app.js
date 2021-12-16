$(document).ready(function()
{
    $("#Add").click(function()
    {
      $("p:first").addClass("color");
    });
    
    $("#Remove").click(function()
    {
      $("p:first").removeClass("color");
    });
    
    $("#Toggle").click(function()
    {
      $("p:first").toggleClass("color");
    });
    $("#Increase").click(function()
    {
      $("p:first").css("font-size","+=1px");
    });
});