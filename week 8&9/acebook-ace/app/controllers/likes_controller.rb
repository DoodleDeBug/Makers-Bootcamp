class LikesController < ApplicationController
  skip_before_action :require_logout
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post_image.likes.create(user_id: Current.user.id)
    end
    redirect_to post_images_path(@post_image)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = 'Cannot unlike'
    else
      find_like
      @like.destroy
    end
    redirect_to post_images_path(@post_image)
  end

  def find_like
    @like = @post_image.likes.find(params[:id])
  end

  private

  def already_liked?
    Like.where(user_id: Current.user.id, post_image_id: params[:post_image_id])
      .exists?
  end

  def find_post
    @post_image = PostImage.find(params[:post_image_id])
  end
end
