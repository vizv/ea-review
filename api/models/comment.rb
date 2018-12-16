class Comment < Sequel::Model(:comments)
  many_to_one :post
  many_to_one :author, class: :User

  def to_h
    {
      id: id,
      content: content,
      author: author.to_h
    }
  end
end
