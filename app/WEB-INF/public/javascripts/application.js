$(function(){
  $("#tabs").tabs().find(".ui-tabs-nav").sortable({axis:'x'});
  
  $(".menu").click(function(){$(this).children(".menu-content").toggle().toggleClass("ui-corner-bottom");});
  
  function majText(text){
    $("#counter").html = 140 - text.value.length;
  }
});