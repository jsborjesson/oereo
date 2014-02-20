module ParsingHelper
  def json
    @json ||= JSON.parse(response.body)
  end
end
