<template lang="pug">
v-container
  template(v-if="post")
    article.post
      .header
        h1.headline {{post.title}}
        address.author By #[a(rel="author").name {{post.author.name}}]
      .content
        p(
          v-for="(paragraph, index) in paragraphsOf(post.content)"
          :key="index"
        ) {{paragraph}}
    .comments
      .comment(
        v-for="comment in post.comments"
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

@Component
class PostsShow extends Vue {
  post: Post | null = null

  async created () {
    // FIXME: handle error
    const data = await fetch(`/api/v1/post/${this.$route.params.post_id}`)
    this.post = await data.json() as Post
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
