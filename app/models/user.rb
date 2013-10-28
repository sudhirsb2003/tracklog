class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, on: :create


  validates_presence_of :address, :blood_group, :contact_no, :emergency_contact_no, :profile_title

  belongs_to :vehicle

  TITLE = %w(driver employee)

  has_attached_file :photo, :styles => { :icon => "50x50",
                                         :thumb => "150x150>",
                                         :small => "400x400",
                                         :medium => "800x600"
                                       },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  def display_name
    self.name.blank? ? self.username : self.name
  end

  def distance_units
    attributes["distance_units"].try(:to_sym) || Tracklog::Config.distance_units
  end
end
