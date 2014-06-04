# Description:
#   Pugme is the most important thing in your life
#
# Commands:
#   hubot pug me - Receive a pug
#   hubot pug bomb N - get N pugs

module.exports = (robot) ->

  robot.respond /do(?:es)? (.*) like crackers(?:\?)?/i, (msg) ->
    msg.send "YES"

  robot.respond /who likes crackers(?:\?)?/i, (msg) ->
    msg.send "EVERYONE"
