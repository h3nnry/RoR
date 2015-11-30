class Section < ActiveRecord::Base
  has_many :section_edits
  has_many :pages
  has_many :editors, :through => :section_edits, class_name: "AdminUser"
  belongs_to :page

  CONTENT_TYPES = ['text', 'HTML']

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
                         :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content

  scope :visible, lambda { where(:visible => true)}
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda { includes(:page).order("sections.position ASC")}
  scope :search, lambda {|query|
                 where(["name LIKE ?", "%#{query}%"])
               }

end
