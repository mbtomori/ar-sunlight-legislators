require 'csv'
require_relative '../app/models/legislator'

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      # puts "ROW: #{row}"
      row.each do |field, value|
        # puts "FIELD: #{field}, #{value}"
        if field == 'phone' || field == 'fax'
          value.gsub(/[^0-9]/,"")
        end
        # raise NotImplementedError, "TODO: figure out what to do with this row and do it!"
      end
      Legislator.new(Hash[row.to_a]).save!
    end
  end
end

SunlightLegislatorsImporter.import('/Users/apprentice/dropbox/DBC-SF/Island Foxes/Maria Piper/Week 1.3 Databases/Politicians/db/data/legislators.csv')

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
