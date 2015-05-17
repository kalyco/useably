
if Rails.env.development?
  photo = Photo.find_or_create_by!(
    name: "penguin",
    description: "it's a penguin",

