class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new(content: params[:content],user_id: @current_user.id)
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "Yeah！！ブログを作成したYO！！"
    else
      render :new
    end
  end

  def show
    @blog = Blog.find_by(id: params[:id])
    @user = User.find_by(id: @blog.user_id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "Hey！！ブログを編集したYO！！"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"Uh-oh.ブログを削除したYO！！"
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache, :remove_image)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
