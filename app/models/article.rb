class Article < ApplicationRecord

	mount_uploader :image, ImageUploader

	#Callbacks
	
	after_create :greeting_message
	#before_create :greeting_message	
	#before_save :greeting_message
	#after_save :greeting_message

	scope :published, -> { where(status: Article::STATUS[:published]) }

	STATUS = {
		published: "published"	
	}

	def greeting_message
		puts 'Hey! I will run after you create the object'
	end
end
