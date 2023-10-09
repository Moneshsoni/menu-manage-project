json.array! @menus do |menu|
  json.id menu.id
  json.title menu.name
  json.body menu.price
end