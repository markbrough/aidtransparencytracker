class Question < ActiveRecord::Base
	has_and_belongs_to_many :activities
	has_and_belongs_to_many :data_organisations
	has_and_belongs_to_many :data_countries
end
