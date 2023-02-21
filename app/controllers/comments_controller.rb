class CommentsController < ApplicationController
   def create
    @event = Event.find(comment_params[:event_id])
    @event.comments.create(comment_name: comment_params[:comment_name])
   end

   def like
      @user = User.find(session[:user_id])
      @comment = Comment.find(params[:comment_id])
      @like = Like.create(user_id: @user.id, comment_id: @comment.id)
      @event = Event.find(params[:event_id])
      redirect_to user_event_path(@user, @event)
   end

   private

    def comment_params
        params.permit(:comment_name, :event_id)
    end
end
