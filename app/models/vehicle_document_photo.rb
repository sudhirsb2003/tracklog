class VehicleDocumentPhoto < ActiveRecord::Base
 belongs_to :vehicle_data

  has_attached_file :photo, :styles => { :thumb => "150x150>",
                                         :small => "400x400",
                                         :medium => "800x600"
                                       },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
