class SessionsController < ApplicationController
  def login
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      user.update(token: SecureRandom.hex(10))
      session[:user_id] = user.id
      redirect_to root_path, notice: "Usuário logado com sucesso"
    else
      flash.now[:alert] = "Email ou senha inválidos"
      render "login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Usuário deslogado com sucesso"
  end
end
