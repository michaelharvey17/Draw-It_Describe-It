class Description < ActiveRecord::Base
  belongs_to :user, foreign_key: "user_id"
  belongs_to :drawing, foreign_key: "draw_id"
  has_many :drawings
end
