const routes = [
  {
    path: '*',
    redirect: '/post/1'
  },
  {
    path: '/post/:post_id',
    name: 'posts-show',
    component: () => import(/* webpackChunkName: "posts-show" */ '@/views/posts/show.vue')
  }
]

export default routes
