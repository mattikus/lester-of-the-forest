# Description:
#   Generates some awesome ideas for your next big startup
# Commands:
#   hubot startup, hubot startup idea - give me a startup idea

module.exports = (robot) ->
  robot.respond /start(up|up idea)/i, (msg) ->
    robot.http("http://itsthisforthat.com/api.php?text").get() (err, res, body) ->
      msg.send(body)
