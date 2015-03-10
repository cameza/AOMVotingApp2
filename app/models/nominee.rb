class Nominee < ActiveRecord::Base
	belongs_to :member

	validates :mail, :name, :cv, :statement, presence: true
	validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "doesn't look like an email address" 
	validates :mail, :uniqueness => { :message => " Warning! - That email belongs to a fellow that was already nominated" }
end
