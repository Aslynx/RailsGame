/* Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
*/

$(document).ready(function() {
    $('#user-form').on('submit', function() {
        // Retrait des messages d'erreur
        $('.col-lg-10').removeClass('has-error');
        $('.form-error').remove();
        $('.form-info').remove();

        var username = $('#user-username');
        var street = $('#user-street');
        var city = $('#user-city');
        var state = $('#user-state');
        var country = $('#user-country');
        var error = 0;

        if(username.val() == "") {
            error++;
            username.parent().addClass('has-error');
            username.parent().append('<span class="text-danger form-error">Champ vide.</span>');
        } else if(username.val().match(/^[aA-zZ0-9]+([-._][a-z0-9]+)*$/i) == null) {
            error++;
            username.parent().addClass('has-error');
            username.parent().append('<span class="text-danger form-error">Pseudo invalide.</span>');
        }

        if(street.val() == "") {
            error++;
            street.parent().addClass('has-error');
            street.parent().append('<span class="text-danger form-error">Champ vide.</span>');
        } else if(street.val().match(/^[aA-zZ0-9]+([\s-][aA-zZ0-9]+)*$/i) == null) {
            error++;
            street.parent().addClass('has-error');
            street.parent().append('<span class="text-danger form-error">Rue invalide.</span>');
        }

        if(city.val() == "") {
            error++;
            city.parent().addClass('has-error');
            city.parent().append('<span class="text-danger form-error">Champ vide.</span>');
        } else if(city.val().match(/^[aA-zZ]+([-][aA-zZ]+)*$/i) == null) {
            error++;
            city.parent().addClass('has-error');
            city.parent().append('<span class="text-danger form-error">Ville invalide.</span>');
        }

        if(state.val() == "") {
            error++;
            state.parent().addClass('has-error');
            state.parent().append('<span class="text-danger form-error">Champ vide.</span>');
        } else if(state.val().match(/^[aA-zZ]+([-][aA-zZ]+)*$/i) == null) {
            error++;
            state.parent().addClass('has-error');
            state.parent().append('<span class="text-danger form-error">Etat invalide.</span>');
        }

        if(country.val() == "") {
            error++;
            country.parent().addClass('has-error');
            country.parent().append('<span class="text-danger form-error">Champ vide.</span>');
        } else if(country.val().match(/^[aA-zZ]+([-][aA-zZ]+)*$/i) == null) {
            error++;
            country.parent().addClass('has-error');
            country.parent().append('<span class="text-danger form-error">Pays invalide.</span>');
        }

        if(error == 0) {
            return true;
        }

        console.log("Did it work ?");
        console.log(username.val(), street.val(), city.val(), state.val(), country.val());
        return false;
    })
})
