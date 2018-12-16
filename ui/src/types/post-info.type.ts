import User from './user.type'

export default interface PostInfo {
  id: number,
  title: string,
  author: User,
  // eslint-disable-next-line camelcase
  comments_count: number
}
