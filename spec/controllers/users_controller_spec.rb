require 'spec_helper'

describe UsersController do

  describe :index do
  end

  describe :show do
  end

  describe :new do

    it "assigns new instance of User to @user." do
      get :new
      assigns(:user).should be_a_new User
    end

    it "renders 'new.html.erb." do
      get :new
      expect(response).to render_template(:new)
    end

    it "returns 200 as http status." do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

  end

  describe :edit do
  end

  describe :create do

    it "assigns aninstance of User with given parameters." do
      user_params = {
        email:              'test@test.com',
        email_confirmation: 'test@test.com',
        password:              'password',
        password_confirmation: 'password'
      }
      post :create, { user: user_params }
      assigns(:user).should be_instance_of User
      assigns(:user).email.should                 == 'test@test.com'
      assigns(:user).email_confirmation.should    == 'test@test.com'
      assigns(:user).password.should              == 'password'
      assigns(:user).password_confirmation.should == 'password'
    end

    context "when invalid parameters posted," do
      it "renders :new." do
        user_params = {
          email:              'test@test.com',
          email_confirmation: '',
          password:              'password',
          password_confirmation: ''
        }
        post :create, { user: user_params }
        expect(response).to render_template(:new)
      end
    end

    context "when valid parameters posted," do
      it "creates a record of User." do
        lambda {
          user_params = {
            email:              'test@test.com',
            email_confirmation: 'test@test.com',
            password:              'password',
            password_confirmation: 'password'
          }
          post :create, { user: user_params }
        }.should change(User, :count).by(1)
      end

      it "redirects to user_softwares_url with the id of user created." do
        user_params = {
          email:              'test@test.com',
          email_confirmation: 'test@test.com',
          password:              'password',
          password_confirmation: 'password'
        }
        post :create, { user: user_params }
        expect(response).to redirect_to(user_softwares_url(assigns(:user)))
      end

      it "fills the sesssion[:user_id] with the id of user created." do
        user_params = {
          email:              'test@test.com',
          email_confirmation: 'test@test.com',
          password:              'password',
          password_confirmation: 'password'
        }
        post :create, { user: user_params }
        expect(session[:user_id]).to eq(assigns(:user).id)
      end
    end

  end

  describe :update do
  end

  describe :destroy do
  end

end