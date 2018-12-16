module EAReviewApp
  class UserModel < Sequel::Model(:users)
    one_to_many :posts
    one_to_many :comments
  
    def to_h
      {
        id: id,
        name: name
      }
    end
  end
end
