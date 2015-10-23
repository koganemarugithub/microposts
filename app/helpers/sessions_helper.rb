module SessionsHelper
    def current_user
        ## 機能：ログイン中の場合は@ログインしているユーザー(現在の@current_user情報)を、ログインしていない場合はnilを返す
        ## 左側の@current_userに値が入っている場合（ログイン中）は、右側のUser.find_byで始まる処理は実行されない
        ## 解説：||=は左の値がfalseかnilの場合に右の値の代入を行う。変数を初期化する際によく用いられる。
        ## User.find_by(id: session[:user_id])は、session[:user_id]の値に一致する@current_userを返す
        ## User.find_byで該当しない時はnilを返す
        
 
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        ## 機能：current_userが存在する場合はtrueを、nilの場合はfalseを返す
        ## 解説：!!は、右側に続く値が存在する場合はtrueを、nilの場合はfalseを返す
        ## 否定演算子!を二回つかったものと考える
        ## current_userが存在する場合、!current_userがfalseになり、もう一度!をつけるとfalseが反転してtrueになる
        ## current_userがnilの場合、!current_userがtrueになり、もう一度!をつけるとtrueが反転してfalseになる
        !!current_user
    end
    
    def store_location
        ## 機能：リクエストがGETの場合は、session[:forwarding_url]にリクエストのURLを代入
        ## ログインが必要なページにアクセスしようとした際に、ページのURLを一旦保存しておき、
        ## ログイン画面に遷移してログイン後に再び保存したURLにアクセスする場合にこのメソッドを使用
        session[:forwarding_url] = request.url if request.get?
    end
    
end