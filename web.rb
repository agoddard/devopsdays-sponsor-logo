#!/usr/bin/env ruby
require './lib/sponsor.rb'
require 'sinatra'

get '/' do
  if params[:url]
    content_type 'image/png'
    render_logo(fetch_remote_logo(params[:url])).to_blob
  else
    erb :index, :locals => { :url => params[:url] }
  end
end

post '/' do
  content_type 'image/png'
  render_logo(fetch_local_logo(params[:file][:tempfile].path)).to_blob
end