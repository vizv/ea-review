import User from './user.type'

export default interface PostInfo {
  id: number,
  title: string,
  author: User,
  comments_count: number
}
