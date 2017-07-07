module Blog
  class PostsController < BlogController
    def index
      @posts = storage.list_for(params[:page])
    end

    def show
      @post = storage.find(params[:id])
    end

    private

    def storage
      Post.published
    end
  end
end
