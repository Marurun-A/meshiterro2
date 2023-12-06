class PostImagesController < ApplicationController
  def new
    @post_image = Postlmage.new
  end

  def create
    @post_image = Postlmage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = Postlmage.all 
  end

  def show
    @post_image = Postlmage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    post_image = Postlmage.find(params[:id])
    post_image.destroy
    redirect_to '/index'
  end
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
