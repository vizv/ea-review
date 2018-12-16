<template lang="pug">
v-container
  template(v-if="posts")
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
  posts: Array<PostInfo> | null = null

  async created () {
    // FIXME: handle error
    const data = await fetch(`/api/v1/posts`)
    this.posts = await data.json() as Array<PostInfo>
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
