class List < ActiveRecord::Base
  belongs_to :user
  attr_accessor :voper


end
