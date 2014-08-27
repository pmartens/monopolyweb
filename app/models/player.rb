class Player < ActiveRecord::Base
  validates :name, :presence => true, :allow_blank => false, :length => {:maximum => 30, :message => 'Playername to long!'}
end
