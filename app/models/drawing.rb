class Drawing < ActiveRecord::Base
  acts_as_votable

  belongs_to :user, foreign_key: "user_id"
  belongs_to :pdescription, class_name: "Description", foreign_key: "des_id"
  has_many :cdescriptions, class_name: "Description"


  has_attached_file :image, :styles => {medium: "400x400#", small: "200x200#"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  def score
    self.get_upvotes.size
  end
end

