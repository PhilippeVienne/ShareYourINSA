/**
 * Created by pvienne on 24/05/2016.
 */
$(function(){
    $('.create-comment-form').submit(function(e){

        var post_id = $(e.target).data('post-id');
        var content = $(e.target).find('input').val();

        $.post('/posts/'+post_id+'/comments', {comment:{content: content}}, function(){
            window.location.href = window.location.href;
        });

        e.preventDefault();
        return false;
    });
});