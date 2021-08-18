class Article < ApplicationRecord
    # dinh nghia comments la con phu thuoc article
    # dependet: destroy xoa article thi xoa het comments lien quan
    has_many :comments, dependent: :destroy 
    # has_rich_text :body
    
    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 10}
    serialize :categories
    
    mount_uploader :picture, PictureUploader

    # include Visible
end
