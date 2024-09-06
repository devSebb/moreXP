require "json"
require "date"

filepath = "db/jobs.json"
serialized_jobs = File.read(filepath)
jobs = JSON.parse(serialized_jobs)

ActiveRecord::Base.transaction do
  jobs.each do |params|
    job = Job.create!(
      user_id: 1,
      title: params["title"],
      description: params["description"],
      company_name: params["company_name"],
      location: params["location"],
      price: params["price"].to_i,
      start_date: Date.parse(params["start_date"]),
      end_date: Date.parse(params["end_date"]),
      industry: params["industry"],
      tags: params["tags"]
    )
    puts "#{job.title} created with tags: #{job.tags.join(', ')}"
  end
end
