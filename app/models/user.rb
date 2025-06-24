class User < ApplicationRecord
  before_create :generate_token

  has_secure_password

  # Validações
  validates :name, presence: { message: "Nome é obrigatório" }
  validates :email, presence: { message: "Email é obrigatório" },
                    uniqueness: { message: "Este email já está em uso" },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email inválido" }
  validates :birthday, presence: { message: "Data de nascimento é obrigatória" }
  validates :password, length: { minimum: 6, message: "A senha deve ter pelo menos 6 caracteres" },
                       if: :password_required?
  validates :password_confirmation, presence: { message: "Confirmação de senha é obrigatória" },
                                   if: :password_required?

  private

  def generate_token
    self.token = SecureRandom.hex(10)
  end

  def password_required?
    new_record? || password.present?
  end
end
