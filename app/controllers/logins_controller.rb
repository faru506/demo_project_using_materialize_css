class LoginsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    def new

    end

    def create
        cricketer = Cricketer.find_by(email: params[:logins][:email].downcase)
        if cricketer && cricketer.authenticate(params[:logins][:password])
            session[:cricketer_id] = cricketer.id
            flash[:notice] = "You have successfully logged in"
            redirect_to cricketer
        else
            flash.now[:notice] = "Something was wrong with your login information"
            render 'new'
        end
    end

    def destroy
        session[:cricketer_id] = nil
        flash[:notice] = "You have successfully logged out"
        redirect_to root_path
    end

end