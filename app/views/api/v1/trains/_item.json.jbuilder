json.number train.number

 if train.train_logo.present?
   json.logo_url asset_url( train.train_logo.url )
   json.logo_file_size train.train_logo.size
   json.logo_content_type train.train_logo.content_type
 else
   json.logo_url nil
   json.logo_file_size nil
   json.logo_content_type nil
 end

json.available_seats train.available_seats
json.created_at train.created_at
