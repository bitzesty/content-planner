(function() {
  CommentsReplyInit = function() {
    $(document).on("click", ".reply_comment_link", function () {
      $(".reply_comment_form").addClass("hidden");
      $(this).parents(".comment").find(".reply_comment_form").removeClass("hidden");

      return false;
    });
  };

  $(document).ready(CommentsReplyInit);
  $(document).on("page:load", CommentsReplyInit);

}).call(this);
