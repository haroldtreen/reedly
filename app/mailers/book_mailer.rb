class BookMailer < ApplicationMailer

	def send_to_kindle(book)
    attachments[File.basename(book.mobi_path)] = File.read(book.mobi_path)
    @book = book
    mail(:to => book.user.email, :subject => "Reedly Ebook!")
	end
end
