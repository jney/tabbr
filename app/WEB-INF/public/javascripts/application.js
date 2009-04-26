$(function(){
  $("#tabs").tabs().find(".ui-tabs-nav").sortable({axis:'x'});
  
  $(".menu").click(function(){$(this).children(".menu-content").toggle().toggleClass("ui-corner-bottom");})
});