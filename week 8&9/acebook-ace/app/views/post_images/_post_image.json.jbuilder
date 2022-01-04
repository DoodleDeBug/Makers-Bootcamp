json.extract! post_image, :id, :title, :content, :created_at, :updated_at
json.url post_image_url(post_image, format: :json)
