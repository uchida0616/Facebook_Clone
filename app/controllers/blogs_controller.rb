class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    if @blog.save
      redirect_to new_blog_path
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
