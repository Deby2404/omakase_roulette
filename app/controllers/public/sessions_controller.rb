# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    public_customers_my_page_path
  end


  def after_sign_out_path_for(resource)
    root_path
  end

  # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_customer
    @customer = Customer.find_by(name: params[:customer][:name]) #ログイン時に入力された名前に対応するユーザーが存在するか探している
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false) #入力されたパスワードが正しいことを確認している、＠userのactive_for_authentication?メソッドがfalseであるかどうか。
        redirect_to root_path
      else
        flash[:notice] = '項目を入力してください'
      end
    end
  end

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
