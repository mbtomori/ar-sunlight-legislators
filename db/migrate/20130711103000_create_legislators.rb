require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |table|
      table.string :title
      table.string :first_name
      table.string :middle_name
      table.string :last_name
      table.string :name_suffix
      table.string :nickname
      table.string :party
      table.string :state
      table.string :district
      table.binary :in_office
      table.string :gender
      table.string :phone
      table.string :fax
      table.string :website
      table.string :webform
      table.string :congress_office
      table.string :bioguide_id
      table.integer :votesmart_id
      table.string :fec_id
      table.integer :govtrack_id
      table.string :crp_id
      table.string :twitter_id
      table.string :congresspedia_url
      table.string :youtube_url
      table.string :facebook_id
      table.string :official_rss
      table.string :senate_class
      table.string :birthdate
    end
  end
end
