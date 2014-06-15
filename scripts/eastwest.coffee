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
#   eastwest video - print out the youtube link for version 1
#   eastwest video 2 - print out the youtube link for version 2
#
# Author:
#   mkemp

URL1 = "http://www.youtube.com/watch?v=gODZzSOelss"
URL2 = "http://www.youtube.com/watch?v=rT1nGjGM2p8"

site = "http://collegebowl.avatarpro.biz/"

module.exports = (robot) ->
  robot.respond /(eastwest|east|west)(?: me)?(?: )?(video|url)?(?: )?(1|2)?/i, (msg) ->
    if msg.match[2]
        switch msg.match[3]
            when '1'
                msg.send URL1
            when '2'
                msg.send URL2
            else
                msg.send URL1
    else
      url = site
      switch msg.match[1].toLowerCase()
        when "eastwest" then url += '/player'
        when "east" then url += '/east/player'
        when "west" then url += '/west/player'
      
      msg.http(url).get() (err, res, body) ->
        try
          player = JSON.parse(body)[0]
          #msg.send "#{player.image}\n>*#{player.name}*\n>#{player.college}"
          msg.send player.image
          fields = []
          fields.push
            title: "Name"
            value: player.name
            short: true
          fields.push
            title: "School"
            value: player.college
            short: true
          payload =
            message: msg.message
            unfurl_links: true
            content:
              fallback: "#{player.name}"
              pretext: ""
              text: ""
              color: "#FF0000"
              fields: fields

          robot.emit 'slack-attachment', payload
              
        catch error
          msg.send "I DUN FUCKED UP: #{error}"
