json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :start_date, :end_date, :id_department
  json.url promotion_url(promotion, format: :json)
end
