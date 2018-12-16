import User from './user.type'
import Comment from './comment.type'

export default interface Post {
  id: number,
  title: string,
  author: User,
  content: string,
  comments: Array<Comment>
}
