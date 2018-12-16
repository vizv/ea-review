module EAReviewApp
  class PostModel < Sequel::Model(:posts)
    one_to_many :comments
    many_to_one :author, class: :User
  
    def to_h
      {
        id: id,
        title: title,
        content: content,
        author: author,
        comments: comments
      }
    end
  end
end
