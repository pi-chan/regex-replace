class StaticPagesController < ApplicationController
  def home
  end

  def update
    require 'cgi'
    input_text = params[:input][:input_text]
    regex = params[:input][:regex]
    replace = params[:input][:replace]

    result = ""
    match = ""
    lines = input_text.gsub( /\r/, '' ).split( "\n" )
    lines.each do |l|
      r = CGI::escapeHTML replace
      re = Regexp.new( regex )
      result << CGI::escapeHTML(l).gsub( re, "<span class='replaced'>#{r}</span>" )
      result << "\n"

      match << CGI::escapeHTML(l).gsub( re, "<span class='matched'>\\0</span>" )
      match << "\n"
    end

    render json: { result: result, match: match }
  end
end
