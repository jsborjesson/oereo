module ApplicationHelper
  def bootstrap_flash_class(flash_type)
    map = {
      notice: 'info',
      success: 'success',
      error: 'danger',
      alert: 'warning'
    }
    unless map[flash_type].nil?
      "alert alert-#{map[flash_type]}"
    end
  end
end
