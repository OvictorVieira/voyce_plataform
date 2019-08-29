module UserService
  class User

    attr_reader :user_repository

    def initialize(user_repository)
      @user_repository = user_repository
    end


  end
end