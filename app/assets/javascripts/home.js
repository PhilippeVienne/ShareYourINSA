
$(function(){

    if(!document.getElementById('show-room')){ // Only for the main page
        return;
    }
    
    const $svg = $('#svg-main');
    const $modal = $("#show-room-modal");
    const $modalBody = $modal.find('.modal-body');

    $modal.on('hidden.bs.modal',function(){
        $modalBody.html('');
    });

    function getId(url) {
        var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
        var match = url.match(regExp);

        if (match && match[2].length == 11) {
            return match[2];
        } else {
            return 'error';
        }
    }

    $.get('/data', function(result){
        var i;
        for (i = 1; i <= 5; i++) {
            var $place = $svg.find('#image-'+i);
            const person = result[i-1];
            if(person) {
                $place.attr('xlink:href', person.profile.avatar);
                $place.click(function () {
                    var id = getId(person.video);
                    $modalBody.html(
                        '<iframe width="560" height="315" src="//www.youtube.com/embed/' +
                        id + '?autoplay=1&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen style="margin:0 auto;"></iframe>');
                    $modal.modal('show');
                    $modal.find('.name').html(person.profile.first_name+' '+person.profile.last_name);
                });
            }
        }
    })

});