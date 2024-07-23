require "json"

filepath = "db/jobs.json"
serialized_jobs = File.read(filepath)
jobs = JSON.parse(serialized_jobs)

ActiveRecord::Base.transaction do
  jobs.each do |params|
    job = Job.create(
      user_id: 1,
      title: params["title"],
      description: params["description"],
      company_name: params["company_name"],
      location: params["location"],
      price: params["price"],
      start_date: params["start_date"],
      end_date: params["end_date"]
    )
    puts "#{job.title} created"
  end
end
