require_relative '../../db/config'

class Legislator < ActiveRecord::Base

  # validates :phone, :length => { :minimum => 10 }

  scope :inactive, -> { where(in_office: '0') }
  scope :in_office, -> { where(in_office: '1') }
  scope :women, -> { where(gender: 'F') }
  scope :men, -> { where(gender: 'M') }
  scope :senators, -> { where(title: 'Sen') }
  scope :representatives, -> { where(title: 'Rep') }


  def name_and_party
    "#{first_name} #{last_name} (#{party})"
  end

  def self.reps_per_state(state)
    self.where("state = ? AND title = ?", state, 'Rep')
  end

  def self.senators_per_state(state)
    self.where("state = ? AND title = ?", state, 'Sen')
  end

  def self.senators_per_party(party)
    self.where("party = ? AND title = ?", party, 'Sen')
  end

  def self.reps_per_party
    self.where("party = ? AND title = ?", party, 'Rep')
  end

  def in_office?
    in_office > 0
  end

end
