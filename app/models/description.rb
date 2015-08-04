class Description < ActiveRecord::Base
  belongs_to :user, foreign_key: "user_id"
  belongs_to :pdrawing, class_name: "Drawing", foreign_key: "draw_id"
  has_many :cdrawings,  class_name: "Drawing"
end
