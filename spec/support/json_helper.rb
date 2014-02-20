module JsonHelper
  def response_json
    @json ||= JSON.parse(response.body)
  end

  def content_type_json
    @env ||= {}
    @env['Content-Type'] = 'application/json'
  end
end
