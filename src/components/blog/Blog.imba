
import { Post, PostSummary } from './Post.imba'
import { Container, Row, Column } from '../bootstrap/Components.imba'


export tag Blog

  prop blogPosts

  def mount
    await window.fetch(window:location:protocol + '//ratamero-blog-api.herokuapp.com/posts/').then do |res|
      @blogPosts = await res.json.then do |res| res:posts
      Imba.commit

  def render
    <self>
      <Container>
        <Row>
          <Column.col-md-8.offset-md-2>
            if @blogPosts
              for post in @blogPosts
                <PostSummary[post]>
            else
              <h1> 'Loading...'


