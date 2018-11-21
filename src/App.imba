
import 'whatwg-fetch'
import 'bootstrap/scss/bootstrap.scss'
import './assets/scss/overrides.scss'

import 'imba-router'

import Blog from './components/blog/Blog.imba'
import { Post } from './components/blog/Post.imba'


tag App

  def render
    <self>
      <Post route='/:slug'>
      <Blog route='/'>


Imba.mount <App>
