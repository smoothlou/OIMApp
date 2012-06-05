class Story < ActiveRecord::Base
  attr_accessible :contact_id, :convo, :date
  belongs_to :contact
end
