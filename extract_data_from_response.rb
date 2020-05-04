module ExtractDataFromResponse

  HEADERS = ["Event ID", "Event message", "Account uuid", "Client uuid", "Level", "User uuid", "URL", "Date created", "OS", "Browser", "IP address"]

  def get_os(tags)
    return "N/A" if tags.detect {|tag| tag["key"] == "os" } == nil
    return tags.detect {|tag| tag["key"] == "os" }["value"]
  end

  def get_account_uuid(tags)
    tags.detect {|tag| tag["key"] == "accountId" }["value"]
  end

  def get_client_uuid(tags)
    tags.detect {|tag| tag["key"] == "clientId" }["value"]
  end

  def get_level(tags)
    tags.detect {|tag| tag["key"] == "level" }["value"]
  end

  def get_url(tags)
    return "N/A" if tags.detect {|tag| tag["key"] == "url" } == nil
    return tags.detect {|tag| tag["key"] == "url" }["value"]
  end

  def get_browser(tags)
    return "N/A" if tags.detect {|tag| tag["key"] == "browser" } == nil
    return tags.detect {|tag| tag["key"] == "browser" }["value"]
  end

  def get_message(event)
    return event.fetch("title") if event.fetch("message").empty?
    event.fetch("message")
  end

  def to_csv(data)
    CSV.open("sentry_data.csv", "wb") do |csv|
      csv << HEADERS
      data.each do |event|
        tags = event.fetch("tags")
        csv << [event.fetch("eventID"),
                get_message(event),
                get_account_uuid(tags),
                get_client_uuid(tags),
                get_level(tags),
                event["user"]["id"],
                get_url(tags),
                event.fetch("dateCreated"),
                get_os(tags),
                get_browser(tags),
                event["user"]["ip_address"]
              ]
      end
    end
  end
end