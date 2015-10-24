class Page < ActiveRecord::Base

  belongs_to :subject
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  scope :visible, lambda { where(:visible => true)}
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda { includes(:subject).order("pages.position ASC")}
  scope :search, lambda {|query|
                 where(["name LIKE ?", "%#{query}%"])
               }

end
