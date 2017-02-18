class Entry < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_attached_file :image,
                    styles: {
                      medium: '400x400>',
                      large: '600x600>'
                    },
                    storage: :s3,
                    s3_credentials: "#{Rails.root}/config/s3.yml",
                    path: 'users/:style/:id.:extension',
                    s3_permissions: :public,
                    url: ':s3_domain_url'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def image_url(style=nil, expires_in=90.minutes)
    if image.present?
      image.s3_object(style).url_for(:read, expires: expires_in).to_s
    else
      'https://s3-ap-northeast-1.amazonaws.com/beeapp-production/no-img.png'
    end
  end
end
