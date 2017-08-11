 class Api::V1::UsersController < ApiController

   before_action :authenticate_user!

   def update
     if current_user.update(user_params)
       render :json => { :message => "OK" }
     else
       render :json => { :message => "Failed", :errors => current_user.errors }, :status => 400
     end
   end

   protected

   def user_params
     params.permit(:email, :password, :avatar)
   end
   
end
