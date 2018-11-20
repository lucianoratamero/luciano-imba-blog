
import Post from './Post.imba'


export tag Blog

  def build
    @blogPosts = null

  def mount
    await window.fetch(window:location:protocol + '//ratamero-blog-api.herokuapp.com/posts/').then do |res|
      @blogPosts = await res.json.then do |res| res:posts
      Imba.commit

  def render
    <self>
      <div>
        if @blogPosts
          for post in @blogPosts
            <Post[post]>
        else
          <h1> 'Loading...'


