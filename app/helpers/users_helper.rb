module UsersHelper
  def get_user_name(id)
    @curr = User.find(id)
    if @curr.name.nil?
      @name = @curr.email
    else
      @name = @curr.name
    end
    return @name
  end
end
