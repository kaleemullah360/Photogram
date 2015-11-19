class Api::ImagesController < ApplicationController

  def index
    @posts =  Post.all.order(id: :desc)
    paginated_records = @posts.paginate(:page => params[:page], :per_page => params[:per_page])
    @posts = with_pagination_info( paginated_records )
    render :json => @posts.to_json({:methods => [:image_url, :thumb_url]})
  end 
 
  def show
    id = params[:id]
    @post =  Post.find(id)
    render :json => @post.to_json({:methods => [:image_url, :thumb_url]})
  end 

  def new
  end
  
  def create
  end
  
  def  edit
  end

  def update
  end 

  def destroy
  end

end
