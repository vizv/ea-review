import User from './user.type'

export default interface Comment {
  id: number,
  content: string,
  author: User
}
