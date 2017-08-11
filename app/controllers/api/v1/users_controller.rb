 class Api::V1::UsersController < ApiController

   before_action :authenticate_user!

   def update
     if current_user.update(user_params)
       render :json => { :message => "OK" }
     else
       render :json => { :message => "Failed", :errors => current_user.errors }, :status => 400
     end
   end

    def show
   render :json => {
     :email => current_user.email,
     :avatar => current_user.avatar,
     :updated_at => current_user.updated_at,
     :created_at => current_user.created_at
   }
 end

   protected

   def user_params
     params.permit(:email, :password, :avatar)
   end

end
