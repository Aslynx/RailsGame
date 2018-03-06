$(document).ready(function() {
    console.log("Voted")

    //$('#average-result').parent().remove();//"<%= j render(partial: 'ratings/form') %>");
    $('#average-result').parent().html("<%= j render(partial: 'games/rating')%>");
    
    //$(this).parent().html("<%= j render(partial: 'games/rating')%>");
    console.log($(this).parent())
    //location.reload();
})