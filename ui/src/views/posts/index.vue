<template lang="pug">
v-container
  template(v-if="data")
    //- FIXME: refactor alert message to a component
    v-alert(v-if="data.error" color="error" :value="true")
      | Error: {{data.error}}, click #[a(@click="loadData()") HERE] to reload.
    template(v-else)
      v-list.posts(two-line)
        template(v-for="(post, index) in data.posts")
          v-divider(v-if="index > 0")
          v-list-tile.post(:to="`/post/${post.id}`")
            v-list-tile-content
              v-list-tile-title {{post.title}}
              v-list-tile-sub-title.author
                address.author By #[a(rel="author").name {{post.author.name}}]
              v-list-tile-sub-title {{post.comments_count}} comment
                | {{ post.comments_count == 1 ? '' : 's'}}
      //- FIXME: refactor pagination a component
      v-layout(justify-center)
        v-pagination(
          v-if="data.page.last > 1"
          v-model="data.page.curr"
          :length="data.page.last"
          prev-icon="<"
          next-icon=">"
          @input="switchPage($event)"
        )
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'

import PostList from '@/types/post-list.type'
import RequestError from '@/types/request-error.type'

@Component
class PostsIndex extends Vue {
  data: PostList | RequestError | null = null

  async loadData (page: any = this.$route.query.page || 1) {
    page = Number(page)
    this.data = null

    try {
      const request = await fetch(`/api/v1/posts?page=${page}`)

      const data = await request.json()
      if (data.hasOwnProperty('error')) {
        this.data = data as RequestError
        return
      }

      this.data = data as PostList
    } catch {
      this.data = ({ error: 'failed to request posts list' } as RequestError)
    }
  }

  async created () {
    this.loadData()
  }

  switchPage (page: any) {
    this.$router.push({ query: page > 1 ? { page } : {} })
  }

  beforeRouteUpdate (to: any, from: any, next: Function) {
    this.loadData(to.query.page || 1)
    next()
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
