require_relative 'models/legislator'

def legislators_per_state(state)
  puts "Senators:"
  Legislator.senators_per_state(state).each do |sen|
    puts "  #{sen.name_and_party}"
  end
  puts "Representatives:"
  Legislator.reps_per_state(state).each do |rep|
    puts "  #{rep.name_and_party}"
  end
end

def gender_bias_in_congress
end

puts "Male Senators: #{(Legislator.men.senators.in_office.count)} (#{(Legislator.men.senators.in_office.count.to_f / Legislator.senators.in_office.count * 100).to_i}%)"
puts "Male Representatives: #{(Legislator.men.representatives.in_office.count)} (#{(Legislator.men.representatives.in_office.count.to_f / Legislator.representatives.in_office.count * 100).to_i}%)"
puts "Female Senators: #{(Legislator.women.senators.in_office.count)} (#{(Legislator.women.senators.in_office.count.to_f / Legislator.senators.in_office.count * 100).to_i}%)"
puts "Female Representatives: #{(Legislator.women.representatives.in_office.count)} (#{(Legislator.women.representatives.in_office.count.to_f / Legislator.representatives.in_office.count * 100).to_i}%)"

# puts Legislator.group(:state).representatives.order(count)

Legislator.representatives.in_office.select("state,count(*) AS rep_count").
            group(:state).order("rep_count DESC").each do |row|
              puts "#{row.state}: 2 senators, #{row.rep_count} representatives"
            end


puts "Senators: #{Legislator.senators.count}"
puts "Reps: #{Legislator.representatives.count}"

puts "Senators in office: #{Legislator.senators.in_office.count}"
puts "Reps in office: #{Legislator.representatives.in_office.count}"

puts "Sum of inactive: #{Legislator.count - Legislator.in_office.count}"

puts "removing #{Legislator.inactive.count} people"

# Legislator.inactive.each do |fogey|
#   fogey.destroy
# end

