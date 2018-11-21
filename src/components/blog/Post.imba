
var showdown = require 'showdown'
var converter = showdown.Converter.new


export tag PostSummary

  def getSummary
    converter.makeHtml data:summary

  def render
    <self.card>
      <.card-body>
        <.card-title>
          <a route-to=data:slug>
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
    <self.card>
      <.card-body>
        if @data
          <.card-title>
            <h1> @data:title
          <.card-subtitle> @data:pub_date
          <div html=getBody>
        else
          <h1> 'Loading...'

