// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require select2
//= require bootstrap
//= require_tree .
$(function(){
    $( "select.s2hook" ).select2({
        theme: "bootstrap"
    });

    function formatUser (user) {
        return user.name;
    }

    $("#find_area").typeahead({
        onSelect: function(item) {
            window.location.href = "/u/"+item.value;
        },
        ajax: {
            url: "/find",
            timeout: 100,
            displayField: "name",
            triggerLength: 1,
            method: "get",
            loadingClass: "loading-circle",
            preDispatch: function (query) {
                return {
                    q: query
                }
            }
        }
    });
});
