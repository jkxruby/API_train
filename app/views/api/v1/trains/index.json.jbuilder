json.data do
  json.array! @trains do |train|
    json.number train.number
    json.train_url api_v1_train_url(train.number)
  end
end
