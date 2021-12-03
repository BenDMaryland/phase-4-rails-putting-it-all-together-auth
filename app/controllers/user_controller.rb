class UserController < ApplicationController


    def create
        user = user.create(user_parmas)
        if user.valid?
            render json: user, status: :created

        else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end

    end





    
    private 

    def user_params
        params.permit(:username, :image_url, ,:password, :bio)

    end

    def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
      end

end

end
