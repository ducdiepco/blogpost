class UsersQuery
  attr_reader :initial_scope, :params

  def initialize(initial_scope: nil, params: params)
    @initial_scope = initial_scope || User
    @params = params
  end

  def find_by_id
    initial_scope.find(params[:id])
  end
end

