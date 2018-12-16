import PostInfo from './post-info.type'
import PageInfo from './page-info.type'

export default interface PostList {
  posts: Array<PostInfo>,
  page: PageInfo
}
