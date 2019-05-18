class PostsQuery
  attr_reader :initial_scope, :params

  def initialize(initial_scope: nil, params: params)
    @initial_scope = initial_scope || Post
    @params = params
  end

  def all
    posts = initial_scope.includes(:user)
    if params[:sort].present?
      posts = posts.order("created_at #{params[:sort]}")
    end
    posts
  end

  def find_by_id_with_user
    initial_scope.includes(:user).find(params[:id])
  end

  def find_by_id_with_comments
    initial_scope.includes(comments: :user).find(params[:id])
  end
end
