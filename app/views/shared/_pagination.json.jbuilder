json.set! :pagination do
  json.set! :currentPage,  model.current_page
  json.set! :totalPages,    model.total_pages
  json.set! :itemCount,    model.total_count
end