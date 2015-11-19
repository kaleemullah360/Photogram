class PostsController < ApplicationController
  def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 4).order(id: :desc)
  end
  
  def new  
      @post = Post.new
  end

  def create
      @post = Post.create(post_params) 
      redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    #render json: params and return

    caption = params[:post][:caption]
    image = params[:post][:image]

    @post = Post.find(params[:id])
    if caption != nil
      @post.caption = caption
    end
    if image != nil
      @post.image = image
    end

    @post.save

    redirect_to(post_path(@post))
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to posts_path
  end
private
  def post_params
      params.require(:post).permit(:image, :caption)
  end 
end
