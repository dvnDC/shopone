# create_table "relationships", force: :cascade do |t|
#   t.integer "follower_id"
#   t.integer "followed_id"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["followed_id"], name: "index_relationships_on_followed_id"
#   t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
#   t.index ["follower_id"], name: "index_relationships_on_follower_id"
#   end

class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
