class ApplicationController < ActionController::Base

  # deviseのストロングパラメーターの設定
  # deviseの機能(ユーザー登録、ログイン認証)が使われる前にconfigure_permitted_parametersメソッドが実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン(ログイン)後の遷移先:users#showに設定(user_path)
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  # サインアウト(ログアウト)後の遷移先:ルートパスのため設定不要
  # def after_sign_out_path_for(resource)
    # about_path
  # end

  # protect:以下他のコントローラーからも参照できる(private:記述したコントローラ内のみでの参照)
  protected

  # configure_permitted_parametersメソッド、devise_parameter_sanitizer.permitメソッドを使うことでsign_up時にnameのデータ操作を許可
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # ※initializers/devise.rbでログイン時にnameを使用するよう変更を実施したため、ストロングパラメーターでemailを受け取れるように設定変更
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
