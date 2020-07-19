module ApplicationHelper

  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def city_state_from_zip company
  	city_state = ZipCodes.identify(company.zip_code)
  	city_state[:city] + ', ' +  city_state[:state_name]
  end
  
end
