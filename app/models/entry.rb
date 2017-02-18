class Entry < ApplicationRecord
  belongs_to :user

  has_attached_file :image,
    styles: {
      medium: '400x400',
      large: '600x600'
    },
    storage: :s3,
    s3_credentials: "#{Rails.root}/config/s3.yml",
    path: 'users/:style/:id.:extension',
    url: ':s3_domain_url'
  validates_attachment_content_type :avater,
    content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'],
    size: { less_than: 4.megabytes }

  def image_url(style)
    if image.present?
      image.s3_object(style).url_for(:read, secure: true)
    else
      'https://s3-ap-northeast-1.amazonaws.com/beeapp-production/no-img.png'
    end
  end
end
