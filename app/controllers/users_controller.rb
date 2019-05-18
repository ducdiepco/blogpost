# frozen_string_literal: true

class UsersController < ApplicationController
  self.permitted_attrs = [:id]

  def show
    @user = query_object.find_by_id

    respond_to do |format|
      format.html
      format.json {
        render json: @user, serializer: UserSerializer
      }
    end
  end

  private

  def query_object(scope = nil)
    UsersQuery.new(initial_scope: scope, params: model_params)
  end
end
