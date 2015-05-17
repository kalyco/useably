
if Rails.env.development?

  photo = Photo.find_or_create_by!(
    user_id: 1,
    name: "penguin",
    description: "it's a penguin",
    likes: 3,
    image_url: "http://i.imgur.com/LOiRAIF.jpg",
    source_name:"telegraph",
    source: "http://www.telegraph.co.uk/news/worldnews/europe/poland/10714473/Doomed-penguin-offered-second-chance-by-3D-printer.html"
  )
end
