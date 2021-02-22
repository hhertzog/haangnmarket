json.extract! notification, :id, :recipient_id, :poster_id, :post_id, :matched_keyword, :read, :created_at, :updated_at
json.url notification_url(notification, format: :json)
