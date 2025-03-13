# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here

qualified_candidates(@candidates).tap do |filtered_candidates|
  ordered_by_qualifications(filtered_candidates).each do |candidate|
    puts "Candidate ID: #{candidate[:id]}, Experience: #{candidate[:years_of_experience]}, Github Points: #{candidate[:github_points]}"
  end
end
