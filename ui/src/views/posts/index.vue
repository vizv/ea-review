<template lang="pug">
v-container
  v-list.posts(two-line)
    template(v-for="(post, index) in posts")
      v-divider(v-if="index > 0")
      v-list-tile.post(:to="`/post/${post.id}`")
        v-list-tile-content
          v-list-tile-title {{post.title}}
          v-list-tile-sub-title.author
            address.author By #[a(rel="author").name {{post.author.name}}]
          v-list-tile-sub-title {{post.comments_count}} comment
            | {{ post.comments_count == 1 ? '' : 's'}}
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'

import PostInfo from '@/types/post-info.type'

@Component
class PostsIndex extends Vue {
  posts: Array<PostInfo> = []

  async created () {
    const data = [
      {
        id: 1,
        title: 'Vivamus dictum dui suscipit dui euismod commodo a sit metus',
        author: {
          id: 1,
          name: 'Sed Viverra'
        },
        comments_count: 2
      },
      {
        id: 2,
        title: 'Duis ac ipsum ullamcorper bibendum sed',
        author: {
          id: 2,
          name: 'Aenean Viverra'
        },
        comments_count: 0
      },
      {
        id: 3,
        title: 'Vivamus elementum nunc sed ultricies turpis duis',
        author: {
          id: 3,
          name: 'Aenean Nisi'
        },
        comments_count: 1
      }
    ]
    this.posts = data as Array<PostInfo>
  }
}

export default PostsIndex
</script>

<style lang="stylus" scoped>
// FIXME: refactor to mixin, or make it a shared component
.author
  color #555
  .name
    font-weight bold
</style>
