class CommentsController < ApplicationController
  def new
    @channel = Channel.find(params[:channel_id])
    @post = @channel.posts.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @channel = Channel.find(params[:channel_id])
    @post = @channel.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    @comment.save
    redirect_to [@channel, @post]

  end

  def show
    @channel = Channel.find(params[:channel_id])
    @post = @channel.posts.find(params[:post_id])
  end

  def show_reply

  end

  def create_reply
    @channel = Channel.find(params[:channel_id])
    @post = @channel.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
    @reply = @posts.comments.build(comment_params.merge(parent_id: @comment.id))

    @reply.save
    redirect_to [@channel, @post]
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end


end
