class Api::V1::AuthController < ApiController
     before_action :authenticate_user!, :only => [:logout]

     def signup
       user = User.new( :email => params[:email], :password => params[:password] )

       if user.save
         render :json => { :user_id => user.id }
       else
         render :json => { :message => "Failed", :errors => user.errors }, :status => 400
       end
     end

     def login
       if params[:email] && params[:password]
         user = User.find_by_email( params[:email] )
       end

       if user && user.valid_password?( params[:password] )
         render :json => { :message => "Ok",
                           :auth_token => user.authentication_token,
                           :user_id => user.id }
       else
         render :json => { :message => "Email or Password is wrong" }, :status => 401
       end
     end

     def logout
       current_user.generate_authentication_token # 重新产生一组，本来的 token 就失效了
       current_user.save!
       render :json => { :message => "Ok"}
     end


end
