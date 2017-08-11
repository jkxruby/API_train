json.data do
  json.array! @trains, :partial => "item", :as => :train
end
