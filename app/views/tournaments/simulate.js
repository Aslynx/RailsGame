$(document).ready(function() {
    console.log("Simulated")

    $('#btn-simulate').hide();
    $('#btn-simulate').after("Tournament simulated")

    $('#matches-table').html("<%= j render(partial: 'mtable') %>");

    //location.reload();
})