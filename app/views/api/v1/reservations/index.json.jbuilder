json.data do
  json.array! @reservations, :partial => "item", :as => :reservation
end
