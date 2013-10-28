class Attendence < ActiveRecord::Base

  has_many :users
  has_many :vehicles
  has_many :pick_up_points

  include Workflow
  workflow_column :status
  workflow do
    state :pending do
      event :submit, :transitions_to => :approved
    end
    state :approved
  end

end
