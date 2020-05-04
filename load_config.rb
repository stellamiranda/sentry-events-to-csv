module LoadConfig

# Token is expected on first line
# Issues will be on next lines, one by line

  def load_configuration(file_name)
    config_info = []

    File.open(file_name).each do |line|
      config_info << line.chomp
    end
    
    token = config_info.first
    issues = config_info.drop(1)
    return token, issues
  end

end