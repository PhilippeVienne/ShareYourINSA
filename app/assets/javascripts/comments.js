/**
 * Created by pvienne on 24/05/2016.
 */
$(function(){
    $('.create-comment-form').submit(function(e){

        var $form = $(e.target);
        var $comments = $form.parent().find('.comments');
        var post_id = $form.data('post-id');
        var content = $form.find('input').val();

        $.post('/posts/'+post_id+'/comments', {comment:{content: content}}, function(result){
            var $clone = $comments.find('.comment.model.hide').clone();
            $clone.removeClass('hide');
            $clone.find('.first_name').text(result.user.first_name);
            $clone.find('.last_name').text(result.user.last_name);
            $clone.find('.content').text(result.content);
            $clone.find('img').attr('src',result.user.avatar);
            $clone.appendTo($comments);
            $form.find('input').val('');
        });

        e.preventDefault();
        return false;
    });
});