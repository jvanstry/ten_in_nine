$(function() {
  $('.project-container').click(function(){
    var projectID = $(this).data("id");
    var host = window.location.origin;
    var projectURL = host + "/projects/" + projectID
    window.location.href = projectURL;
  })
});