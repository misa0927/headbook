class CommentsController < ApplicationController
  before_action :set_comment, only:[:edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    respond_to do |format|
      if @comment.save
        format.html{ redirect_to topic_path(@topic),notice:'コメントを投稿しました。'}
      else
        format.js{ render :new }
    end
  end
end

  def edit
    @topic = @comment.topic
  end

  def update
    @comment.update(comment_params)
    redirect_to topics_path,notice:"コメントを更新しました！"
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js { render :index }
    end
  end

private
  def comment_params
    params.require(:comment).permit(:topic_id,:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
