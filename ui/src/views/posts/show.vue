<template lang="pug">
v-container
  template(v-if="data")
    v-alert(v-if="data.error" color="error" :value="true")
      | Error: {{data.error}}, click #[a(@click="loadData()") HERE] to reload.
    template(v-else)
      article.post
        .header
          h1.headline {{data.title}}
          address.author By #[a(rel="author").name {{data.author.name}}]
        .content
          p(
            v-for="(paragraph, index) in paragraphsOf(data.content)"
            :key="index"
          ) {{paragraph}}
      .comments
        .comment(
          v-for="comment in data.comments"
          :key="comment.id"
        )
          address.author
            | Comment from #[a(rel="author").name {{comment.author.name}}]:
          .content
            p(
              v-for="(paragraph, index) in paragraphsOf(comment.content)"
              :key="index"
            ) {{paragraph}}
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'

import Post from '@/types/post.type'
import RequestError from '@/types/request-error.type'

@Component
class PostsShow extends Vue {
  data: Post | RequestError | null = null

  async loadData () {
    this.data = null

    try {
      const request = await fetch(`/api/v1/post/${this.$route.params.post_id}`)

      const data = await request.json()
      if (data.hasOwnProperty('error')) throw data as RequestError

      this.data = data as Post
    } catch (ex) {
      if (!(<RequestError>ex).error) {
        ex = ({error: 'failed to request this post'} as RequestError)
      }
      this.data = ex
    }
  }

  async created () {
    this.loadData()
  }

  paragraphsOf (content: string) {
    return content.split('\n')
  }
}

export default PostsShow
</script>

<style lang="stylus" scoped>
.post
  .content
    margin-top 2rem
.comments
  margin-top 3rem
  padding 0 1rem
  .comment
    margin-bottom 2rem
    .content
      margin-top 0.5em
      margin-left 1.4rem
      border-left 6px solid #DDD
      padding-left 0.6rem
      p
        margin-bottom 1.0em

.author
  color #555
  .name
    font-weight bold
</style>
