class SessionsController < ApplicationController
  def new
  end

  def create
    ## userのメールアドレスをdbから探す
    @user = User.find_by(email: params[:session][:email].downcase)

    ## paramsから受け取ったpassが一致しているかauthenticateで確認する
    if @user && @user.authenticate(params[:session][:password])
      ## passが正しい場合session[:user_id]にuserIDを入れる
      ## flashでコメントを表示後に@userにリダイレクト
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.name}"
      redirect_to @user
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    ## ログアウト処理時にsession[:user_id] をnilでセッションの情報を破棄する
    session[:user_id] = nil
    ## アプリケーションのルート"/"にリダイレクトする
    redirect_to root_path
  end
  
end
