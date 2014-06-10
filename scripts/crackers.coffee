module.exports = (robot) ->

  robot.respond /do(?:es)? (.*) like crackers(?:\?)?/i, (msg) ->
    msg.send "YES"

  robot.respond /who likes crackers(?:\?)?/i, (msg) ->
    msg.send "EVERYONE"
