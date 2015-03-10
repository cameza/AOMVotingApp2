class Member < ActiveRecord::Base
	has_one :nominees
	
	validates :mail, :presence => true
	validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "doesn't look like an email address" 
	validates :mail, :uniqueness => { :message => " Warning! - You can only nominate/vote once" }
end
