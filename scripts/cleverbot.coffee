# Description:
#   "Makes your Hubot even more Clever™"
#
# Dependencies:
#   "cleverbot-node": "^0.3.5"
#
# Configuration:
#   None
#
# Commands:
#   hubot c <input>
#
# Author:
#   ajacksified
#   Stephen Price <steeef@gmail.com>

CLEVERBOT_API_KEY = process.env.HUBOT_CLEVERBOT_API_KEY
cleverbot = require('cleverbot-node')

module.exports = (robot) ->
  c = new cleverbot()
  c.configure({botapi: CLEVERBOT_API_KEY});

  robot.respond /c (.*)/i, (msg) ->
    data = msg.match[1].trim()
    cleverbot.prepare(( -> c.write(data, (c) => msg.send(c.message))))
