class PublishService

	def self.send_to_kindle(book)
		BookMailer.send_to_kindle(book).deliver_now
	end
end