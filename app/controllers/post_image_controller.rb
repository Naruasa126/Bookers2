class PostImageController < ApplicationController
  def new
    @post_image = PostImage.new
    @user = List.new
  end

  

  def destroy
  end
  
     private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption, :title, :body)
  end

end
