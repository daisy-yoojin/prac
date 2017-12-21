class UserController < ApplicationController
  def new
  end

  def create
    @email = params[:email]
    @pwd = params[:password]

    User.create(email: @email, pwd: @pwd)
    redirect_to '/'

  end

  def login
  end

  def login_process
    @email = params[:email]
    @pwd = params[:password]

    #아이디와 패스워드가 일치하면 로그인
    user = User.find_by(email: @email)
  
    #user가 있는지부터 먼저 검사
    if User.exists?(email: @email)

      # session // cookie  로그인 방법
      if user.pwd == @pwd
       session[:user_id] = user.id
       redirect_to '/'
      end
    end

    #일치하지 않으면 로그인 불가능
  end

  def logout
  end
end
