class Drawing < ActiveRecord::Base
  belongs_to :user, foreign_key: "user_id"
  belongs_to :pdescription, class_name: "Description", foreign_key: "des_id"
  has_many :cdescriptions, class_name: "Description"


  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
