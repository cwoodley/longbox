namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Series.create!(title: "Test",
                 pull: "false")
    99.times do |n|
      title  = Faker::Company.name
      pull = "false"
      Series.create!(title: title,
                   pull: pull)
    end
  end
end