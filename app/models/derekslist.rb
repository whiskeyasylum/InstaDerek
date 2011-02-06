class Derekslist < ActiveRecord::Base

	def photo
		photos = Instagram::by_user(self.user_id.to_i)
		return nil if photos.blank?
		actual_photo = nil
		photos.each do |photo|
			actual_photo = photo if photo.id == self.photo_id.to_i
		end
		return actual_photo
	end
end
