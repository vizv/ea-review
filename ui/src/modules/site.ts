import { Module, VuexModule, Mutation, Action } from 'vuex-module-decorators'

// TODO: states for site settings should be persistence

@Module({ namespaced: true })
export default class Site extends VuexModule {
}
