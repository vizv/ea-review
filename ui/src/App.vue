<template lang="pug">
router-view
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'

@Component
class App extends Vue {}

export default App
</script>

<style lang="stylus">
html
  font-size 16px
  line-height 1.5em
p
  margin-bottom 1.8em
  text-align justify
  &:last-child
    margin-bottom 0
</style>
