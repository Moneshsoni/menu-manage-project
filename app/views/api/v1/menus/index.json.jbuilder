json.menus @menus do |menu|
  json.partial! 'api/v1/menus/menu', menu: menu
end