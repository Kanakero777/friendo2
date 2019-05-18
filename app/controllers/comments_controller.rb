class CommentsController < ApplicationController
  def create
  @comment = Comment.new(comment_params)
  @comment.user_id = current_user.id

  #新しいTweetの保存に成功した場合
  if @comment.save
    redirect_back(fallback_location: root_path)
  else
    redirect_back(fallback_location: root_path)
  end
  
 end


 private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
 def comment_params
  params.require(:comment).permit(:body).merge(post_id: params[:post_id] )
 end
end
