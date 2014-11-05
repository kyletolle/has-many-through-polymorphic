namespace :data do
  desc "Create sample Countries in the database"
  task create_sample_data: :environment do
    ["United States of America", "Canada", "Mexico"].
      each do |country_name|
        Country.create name: country_name
      end
  end
end

