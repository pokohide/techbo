class Entry < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy

  acts_as_taggable_on :tags

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

  scope :search_by, lambda { |q| where('title Like ? or body Like ?', "%#{q}%", "%#{q}%").order(created_at: :desc) unless q.blank? }
  scope :desc, -> { order(created_at: :desc) }

  has_attached_file :image,
                    styles: {
                      medium: '400x400>',
                      large: '600x600>'
                    },
                    storage: :s3,
                    s3_credentials: "#{Rails.root}/config/s3.yml",
                    path: 'users/:style/:id.:extension',
                    url: ':s3_domain_url'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def image_url(style=nil, expires_in=90.minutes)
    if image.present?
      image.url(style)
    else
      asset_path 'noimage.png'
    end
  end

  def liked_by?(user_id)
    likes.find_by(user_id: user_id)
  end
end
