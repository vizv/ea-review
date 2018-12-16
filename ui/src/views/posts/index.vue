<template lang="pug">
v-container
  template(v-if="posts")
    v-alert(v-if="posts.error" color="error" :value="true")
      | Error: {{posts.error}}, click #[a(@click="loadData()") HERE] to reload.
    v-list.posts(v-else two-line)
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
import RequestError from '@/types/request-error.type'

@Component
class PostsIndex extends Vue {
  posts: Array<PostInfo> | RequestError | null = null

  async loadData () {
    this.posts = null

    try {
      const request = await fetch(`/api/v1/posts`)

      const data = await request.json()
      if (data.hasOwnProperty('error')) throw data as RequestError

      this.posts = data as Array<PostInfo>
    } catch (ex) {
      if (!(<RequestError>ex).error) {
        ex = ({error: 'failed to request posts list'} as RequestError)
      }
      this.posts = ex
    }
  }

  async created () {
    this.loadData()
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
