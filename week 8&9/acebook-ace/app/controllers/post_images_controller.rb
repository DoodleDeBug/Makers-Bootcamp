class PostImagesController < ApplicationController
  skip_before_action :require_logout
  before_action :set_post_image, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    if Current.user == nil
      redirect_to root_url, alert: 'Must login to access content'
    else
      @post_images = PostImage.all.order(created_at: :desc)
    end
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post_image = PostImage.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    # @post_image = PostImage.new(post_image_params)
    @post_image =
      PostImage.create(post_image_params.merge(user_id: session[:user_id]))

    if @post_image.save
      redirect_to @post_image, notice: 'Post was successfully created.'
    else
      redirect_to new_post_image_url,
                  alert: 'Post cannot be created check fields.'
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post_image.update(post_image_params)
      redirect_to @post_image, notice: 'Post was successfully updated.'
    else
      redirect_to edit_post_image_url,
                  alert: 'Post was not successfully updated.'
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post_image.destroy
    redirect_to post_images_url, alert: 'Post was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post_image
    @post_image = PostImage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_image_params
    params.require(:post_image).permit(:title, :content, :image)
  end
end
