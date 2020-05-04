require 'httparty'

module RequestSentryData

  def fetch_data_from_issues(token,issues, limit = "200")
    body = []
    issues.each do |issue|
      url = 'https://sentry.io/api/0/issues/'+issue+'/events/?limit='+limit
      response = HTTParty.get(url, headers: {"Authorization" => "Bearer "+token})
      response.parsed_response
      body += response.parsed_response
    end
    body
  end
end
