# frozen_string_literal: true

class PostsController < ApplicationController
  self.permitted_attrs = [:sort, :id]

  def index
    @posts = query_object(Post.published).all
  end

  def show
    @post = query_object.find_by_id_with_user
  end

  def comments
    @post = query_object.find_by_id_with_comments
  end

  private

  def query_object(scope = nil)
    PostsQuery.new(initial_scope: scope, params: model_params)
  end
end
