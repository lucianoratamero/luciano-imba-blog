
var showdown = require 'showdown'
var converter = showdown.Converter.new

import { Container, Row, Column } from '../bootstrap/Components.imba'


export tag PostSummary

  prop params

  def getSummary
    converter.makeHtml data:summary

  def getRoute
    @params:path + data:slug

  def render
    <self.card>
      <.card-body>
        <.card-title>
          <a route-to=getRoute>
            <h1> data:title
        <.card-subtitle> data:pub_date
        <div html=getSummary>


export tag Post

  prop data

  def mount
    await window.fetch( \
      window:location:protocol \
      + '//ratamero-blog-api.herokuapp.com/post/' \
      + @params:slug + '/').then do |res|
        @data = await res.json.then do |res| res
        Imba.commit

  def getBody
    converter.makeHtml @data:body

  def render
    <self>
      <Container>
        <Row>
          <Column.col-md-8.offset-md-2>
            <h3> JSON.stringify @params
            <.card>
              <.card-body>
                if @data
                  <.card-title>
                    <h1> @data:title
                  <.card-subtitle> @data:pub_date
                  <div html=getBody>
                else
                  <h1> 'Loading...'

