class Blog < ApplicationRecord
    #タイトル
    validates :title, presence: true
    validates :title, length: { in: 1..140 }

    #内容
    validates :content, presence: true
    validates :content, length: { in: 1..140 }
    
end
