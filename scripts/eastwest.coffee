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
#   east me - select a random player from the east
#   west me - select a random player from the west
#   eastwest me - select a random player
#   eastwest video - print out the youtube link
#
# Author:
#   mkemp

URL = "http://www.youtube.com/watch?v=gODZzSOelss"

#site = "http://collegebowl.avatarpro.biz/"
site = "http://sleepy-cliffs-8616.herokuapp.com/"

module.exports = (robot) ->
  robot.respond /(eastwest|east|west)(?: me)?(?: )?(video|url)?/i, (msg) ->
    if msg.match[2]
      msg.send URL
    else
      url = site
      switch msg.match[1].toLowerCase()
        when "eastwest" then url += '/player'
        when "east" then url += '/east/player'
        when "west" then url += '/west/player'
      
      msg.http(url).get() (err, res, body) ->
        try
          player = JSON.parse(body)[0]
          msg.send "#{player.image}\n#{player.name}\n#{player.college}"
        catch error
          msg.send "I DUN FUCKED UP"
