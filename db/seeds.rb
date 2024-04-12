# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Post.destroy_all
Comment.destroy_all
puts "Creating posts"
puts "Creating user"

user1 = User.new(nickname: "Paul", password: "azerty", email: "Paul@gmail.com")
user1.save!

user2 = User.new(nickname: "Marie", password: "azerty", email: "Marie@gmail.com")
user2.save!

user3 = User.new(nickname: "Jean", password: "azerty", email: "Jean@gmail.com")
user3.save!

ARTICLE_TITLES = [
  "Nouvelle étude révèle une hausse des températures record dans le monde",
  "Cuisiner avec des ingrédients de saison : des plats simples et délicieux",
  "Résultats surprenants de l'enquête sur les habitudes de sommeil",
  "Crise économique : les experts s'attendent à une reprise lente",
  "Découverte d'une nouvelle espèce de mammifère dans la forêt amazonienne",
  "Les inondations dévastatrices affectent des milliers de personnes",
  "Le secteur de la technologie en plein essor malgré la pandémie",
  "La révolution des voitures électriques : ce que l'avenir nous réserve",
  "Les manifestations pour la justice sociale continuent à travers le monde",
  "Les bienfaits insoupçonnés de la méditation sur la santé mentale",
  "Comment préparer votre enfant à réussir dans un monde en constante évolution",
  "Intelligence artificielle : comment elle transforme nos vies au quotidien",

]

12.times do
  Post.create!(
    title: ARTICLE_TITLES.sample,
    content: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,
    totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem
    sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi
    tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
    Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis
    suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil
    molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?At vero eos et accusamus et iusto odio dignissimos ducimus
    qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,
    similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.
    Et harum quidem rerum facilis est et expedita distinctio.
    Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est,
    omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae
    non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.
    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,
    totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem
    sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi
    tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
    url: Faker::Internet.url,
    user_id: User.pluck(:id).sample
  )
end

Post.find_each do |post|
  Comment.create!(
    content: "Cet article est génial !",
    user_id: User.pluck(:id).sample,
    post_id: post.id
  )
end
puts "Done!"
