const routes = [
  {
    path: '*',
    redirect: '/posts'
  },
  {
    path: '/posts',
    name: 'posts-index',
    component: () => import(/* webpackChunkName: "posts-index" */ '@/views/posts/index.vue')
  },
  {
    path: '/post/:post_id',
    name: 'posts-show',
    component: () => import(/* webpackChunkName: "posts-show" */ '@/views/posts/show.vue')
  }
]

export default routes
