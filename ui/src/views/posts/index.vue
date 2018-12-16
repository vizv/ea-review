<template lang="pug">
v-container
  template(v-if="data")
    v-alert(v-if="data.error" color="error" :value="true")
      | Error: {{data.error}}, click #[a(@click="loadData()") HERE] to reload.
    v-list.posts(v-else two-line)
      template(v-for="(post, index) in data.posts")
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

import PostList from '@/types/post-list.type'
import RequestError from '@/types/request-error.type'

@Component
class PostsIndex extends Vue {
  data: PostList | RequestError | null = null

  async loadData () {
    this.data = null

    try {
      const request = await fetch(`/api/v1/posts`)

      const data = await request.json()
      if (data.hasOwnProperty('error')) throw data as RequestError

      this.data = data as PostList
    } catch (ex) {
      if (!(<RequestError>ex).error) {
        ex = ({error: 'failed to request posts list'} as RequestError)
      }
      this.data = ex
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
