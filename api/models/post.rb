class Post < Sequel::Model(:posts)
  one_to_many :comments, eager: [:author]
  many_to_one :author, class: User

  def to_h
    {
      id: id,
      title: title,
      content: content,
      author: author.to_h,
      comments: comments.map(&:to_h)
    }
  end

  def to_info_h
    {
      id: id,
      title: title,
      author: author.to_h,
      comments_count: comments.count
    }
  end
end
