class Authors::PostsController < Authors::BaseController
  before_action :set_post, only: %i(show edit update destroy publish unpublish)

  def index
    @posts = current_author.posts.most_recent
  end

  def show; end

  def new
    @post = current_author.posts.new
  end

  def edit; end

  def publish
    @post.publish
    redirect_to authors_posts_url
  end

  def unpublish
    @post.unpublish
    redirect_to authors_posts_url
  end

  def create
    @post = current_author.posts.new(post_params)
    if @post.save
      redirect_to authors_post_path(@post), notice: 'Пост успешно создан.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to authors_post_path(@post), notice: 'Пост успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to authors_posts_url, notice: 'Пост успешно удален.'
  end

  private
    def set_post
      @post = current_author.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :description, :banner_image_url)
    end
end
