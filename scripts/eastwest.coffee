# Description:
#   Dumps out a random player name from the Key and Peele sketch about college
#   football
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot east me - select a random player from the east
#   hubot west me - select a random player from the west
#   hubot eastwest me - select a random player
#   hubot eastwest video - print out the youtube link for version 1
#   hubot eastwest video 2 - print out the youtube link for version 2
#   hubot eastwest video 3 - print out the youtube link for version 3
#
# Author:
#   mattikus

VIDEO_URLS = [
  "http://www.youtube.com/watch?v=gODZzSOelss",
  "http://www.youtube.com/watch?v=rT1nGjGM2p8",
  "https://www.youtube.com/watch?v=mDp-ABzpRX8"
]

SITE = "http://collegebowl.avatarpro.biz/"

module.exports = (robot) ->
  robot.respond /(eastwest|east|west)(?: me)?(?: )?(video|url)?(?: )?([1-3])?/i, (msg) ->
    if msg.match[2]
      msg.send VIDEO_URLS[(msg.match[3] ? 1)-1]
    else
      conference = msg.match[1].toLowerCase()
      endpoint = switch conference
        when "eastwest" then 'player'
        when "east", "west" then "#{conference}/player"

      msg.http("#{SITE}/#{endpoint}").get() (err, res, body) ->
        try
          player = JSON.parse(body)[0]
        catch error
          msg.send "I DUN FUCKED UP: #{error}"

        msg.send "#{player.image}\n>>>*#{player.name}*\n#{player.college}"
