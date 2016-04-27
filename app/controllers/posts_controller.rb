class PostsController < ApplicationController
  def new
    @channel = Channel.find(params[:channel_id])
    @post = @channel.posts.build
  end

  def create
    @channel = Channel.find(params[:channel_id])
    @post = @channel.posts.build(post_params)

    @post.save
    redirect_to [@channel, @post]
  end

  def show
    @channel = Channel.find(params[:channel_id])
    @post = @channel.posts.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render json: @post} 
    end

  end

  private
    def post_params
      params.require(:post).permit(:body)
    end
end
