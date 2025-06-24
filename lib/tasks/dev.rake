namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco de dados...", "Banco de dados apagado com sucesso!") { %x(rails db:drop) }

      show_spinner("Criando banco de dados...", "Banco de dados criado com sucesso!") { %x(rails db:create) }

      show_spinner("Executando migrations...", "Migrations executadas com sucesso!") { %x(rails db:migrate) }

      show_spinner("Executando seeds...", "Seeds executados com sucesso!") { %x(rails db:seed) }
    else
      puts "Você não está no ambiente de desenvolvimento"
    end
  end

  def show_spinner(msg_start, msg_end, &block)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success(msg_end)
  end
end
