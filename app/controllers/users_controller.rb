class UsersController < ApplicationController

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        
        p_mismatch=false
        if(params[:session][:password]!=params[:session][:cpassword])
            p_mismatch=true 
        end

        
        if(!p_mismatch && @user.save)
            
            flash[:success]="User has been created"
            session[:user_id]=@user.id
            redirect_to root_path
        else
        
            if(p_mismatch && !@user.errors.any?)
                @user.errors.add(:base,"Password did not match..Try again!")
            end

            render 'new'
        end
    end

    private 

    def user_params
        params.require(:session).permit(:username,:password)
    end

end
