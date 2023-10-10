json.menus @menus do |menu|
  json.id menu.id
  json.name menu.name
  json.price menu.price
end

json.paginations do
  json.current_page @menus.current_page
  json.total_pages @menus.total_pages
end
