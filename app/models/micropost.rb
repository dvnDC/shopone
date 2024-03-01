# create_table "microposts", force: :cascade do |t|
#   t.text "content"
#   t.integer "user_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
#   t.index ["user_id"], name: "index_microposts_on_user_id"
# end

class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 501 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" },
            size: { less_than: 15.megabytes, message: "should be less then 15MB" }

  # Returns a resized image for display.
  def display_image
    image.variant(resize_to_limit: [250, 250])
  end
end
