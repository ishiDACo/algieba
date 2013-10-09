class SessionsController < ApplicationController

  skip_before_action :auth_filter, only: [:new, :create]

  # GET /
  def new
    if authenticated?
      redirect_to user_softwares_url(user_id: session[:user_id])
    end
    @form = SigninForm.new
  end

  # POST /signin
  def create
    @form = SigninForm.new(signin_params)
    if @form.valid?
      @user = @form.find_user
      if @user && @user.authenticate(@form.password)
        session[:user_id] = @user.id
        # TODO - redirect to users' top page.
      else
        flash.now[:error] = 'incorrect email or password.'
        render :new
      end
    else
      render :new
    end
  end

  def destroy
  end

  private

  def signin_params
    params.require(:signin_form).permit(:email, :password)
  end

end
