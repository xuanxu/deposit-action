require "faraday"

issue_id = ENV["ISSUE_ID"]
journal_url = "#{ENV['JOURNAL_URL']}/papers/api_deposit",
journal_secret = ENV['JOURNAL_SECRET']

parameters = { id: issue_id
               #metadata: Base64.encode64(deposit_payload.to_json),
               #doi: formatted_doi,
               #archive_doi: archive_doi,
               #citation_string: citation_string,
               #title: plain_title,
               secret: journal_secret
              }

deposit_call = Faraday.post(url, parameters.to_json, {})
if deposit_call.status.between?(200, 299)
  system("echo 'Journal responded. Deposit looks good'")
else
  raise "!! ERROR: Something went wrong with this deposit when calling #{journal_url}"
end
