class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all.order("id DESC")
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    #新しいTweetの保存に成功した場合
    if @post.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
   end

 def show
   @post = Post.find(params[:id])
   @comment = Comment.new
   @comments = @post.comments
 end

 private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
 def post_params
  params.require(:post).permit(:body)
 end
end
