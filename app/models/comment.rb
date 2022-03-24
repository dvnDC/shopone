# create_table "comments", force: :cascade do |t|
#   t.text "content"
#   t.bigint "user_id", null: false
#   t.bigint "item_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["item_id"], name: "index_comments_on_item_id"
#   t.index ["user_id"], name: "index_comments_on_user_id"
# end

class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :item

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :content, presence: true, length: { maximum: 511 }
end
