$(document).ready(function() {
    console.log("Hello")
    $('#notifications').dropdown('toggle');
    $("[data-behavior='unread-count']").text(0);
})