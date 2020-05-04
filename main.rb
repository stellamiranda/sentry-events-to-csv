require './load_config'
require './request_sentry_data'
require './extract_data_from_response'

include LoadConfig
include RequestSentryData
include ExtractDataFromResponse

# Load Configuration
token, issues = load_configuration('config_file')

# Make API call to Sentry and fetch Data
data = fetch_data_from_issues(token, issues)

# Format response into CSV
to_csv(data)

puts "CSV sentry_data.csv generated!"