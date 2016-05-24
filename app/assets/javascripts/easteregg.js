/**
 * Created by pvienne on 24/05/16.
 */
$(function(){
    $(".trash").hover(function(e){
        var $target = $(e.target);
        if(window.location.href.indexOf("localhost")>=0&&$target.data('trash')!=2) {
            $target.data('trash',2);
            var old_url = $target.attr('src');
            $target.attr('src', Math.random() > 0.5 ? $target.data('trash-1') : $target.data('trash-2'));
            setTimeout(function () {
                $target.attr('src', old_url);
                $target.data('trash',1);
            }, 3000);
        }
    });
    $('#trash-guigui').hover(function(){
        if(window.location.href.indexOf("localhost")) {
            $('#guillaume').modal('show');
        }
    })
});