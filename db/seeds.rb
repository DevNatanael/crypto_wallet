# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

coins = [
  { description: "Bitcoin", acronym: "BTC", url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1.png" },
  { description: "Ethereum", acronym: "ETH", url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png" },
  { description: "Cardano", acronym: "ADA", url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/2010.png" },
  { description: "Solana", acronym: "SOL", url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/5426.png" },
  { description: "XRP", acronym: "XRP", url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/52.png" },
  { description: "Dogecoin", acronym: "DOGE", url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/74.png" },
  { description: "Tether", acronym: "USDT", url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/825.png" },
  { description: "Litecoin", acronym: "LTC", url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/2.png" },
  { description: "Bitcoin Cash", acronym: "BCH", url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1831.png" }
]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end
