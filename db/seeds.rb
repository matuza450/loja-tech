Product.create!([
    { name: "Teclado Mecânico", description: "Teclado mecânico RGB com switches azuis.", price: 299.99, stock: 10 },
    { name: "Mouse Gamer", description: "Mouse gamer com alta precisão e iluminação RGB.", price: 149.99, stock: 25 },
    { name: "Monitor 27''", description: "Monitor 27 polegadas 4K UHD.", price: 1299.99, stock: 5 }
])


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
