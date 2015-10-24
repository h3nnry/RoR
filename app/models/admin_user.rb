class AdminUser < ActiveRecord::Base

  #To configure different table name
  #self.table_name = "admin_users"

  #short way
  attr_accessor :first_name

  #long way
  # def last_nam
  #   @last_name
  # end
  # def last_name=(value)
  #   @last_name = value
  # end

  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits
end
