class Nominee < ActiveRecord::Base
	belongs_to :member

	validates :mail, :name, :cv, :statement, :nominator_mail, presence: true
	validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "doesn't look like an email address" 
	validates :mail, :uniqueness => { :message => " Warning! - That email belongs to a fellow that was already nominated" }
	validates :nominator_mail, :uniqueness => { :message => " Warning! - You already submitted a nomination" }
	validates_format_of :nominator_mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "doesn't look like an email address" 
	validate :nominator_mail_is_valid

# Custom validators

	def nominator_mail_is_valid
		@member = Member.all
		@count = 0
	    @member.each do |f|
	      if f.mail == nominator_mail
	      	@count = 1
	      end
	    end
	    if @count == 0
	    	errors.add(:nominator_mail, "This email address does not exist in our records. Please contact the administrator")
	    end
	end
end
