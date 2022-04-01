class CricketersController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    before_action :set_cricketer, only: [:show, :edit, :update]
    before_action :require_same_cricketer, only: [:edit, :update]
    def Index
    end

    def show
    end

    def new
        @cricketer = Cricketer.new
    end

    def create
        @cricketer = Cricketer.new(cricketer_params)
        if @cricketer.save
            flash[:notice] = "You have successfully signed up"
            redirect_to @cricketer
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @cricketer.update(cricketer_params)
            flash[:notice] = "You have successfully updated your profile."
            redirect_to @cricketer
        else
            render 'edit'
        end
    end

    private
    def set_cricketer
        @cricketer = Cricketer.find(params[:id])
    end

    def cricketer_params
        params.require(:cricketer).permit(:name, :email, :password, :password_confirmation)
    end

    def require_same_cricketer
        if current_user != @cricketer
            flash[:notice] = "You can only edit your profile"
            redirect_to cricketer_path(current_user)
        end
    end
end