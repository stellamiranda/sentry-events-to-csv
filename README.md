# Sentry Events to CSV

This is Script that makes a call to Sentry API and get events information for given issue(s)

### Requirements

- `httpparty`

```gem install httparty ```

- Ruby 2.6.5

### Configuration

Will require a initial configuration file that contains the API token on the first line of the file, followed by the issues that events are needed, one by line, see `config_file` for an example

### Output

A file `sentry_data.csv` will be generated on same directory, see `sentry_data.csv` as example.