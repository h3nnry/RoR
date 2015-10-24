class Section < ActiveRecord::Base
  has_many :section_edits
  has_many :pages
  has_many :editors, :through => :section_edits, class_name: "AdminUser"
  belongs_to :page

  scope :visible, lambda { where(:visible => true)}
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda { includes(:page).order("sections.position ASC")}
  scope :search, lambda {|query|
                 where(["name LIKE ?", "%#{query}%"])
               }

end
