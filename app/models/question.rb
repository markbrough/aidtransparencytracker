class Question < ActiveRecord::Base
	has_many :activities, :dependent => :destroy
	has_many :data_organisations, :dependent => :destroy
	has_many :data_countries, :dependent => :destroy
end
