# Description:
#   Allows Hubot to do mathematics.
#
# Commands:
#   hubot math me <expression> - Calculate the given expression.
#   hubot convert me <expression> to <units> - Convert expression to given units.
module.exports = (robot) ->
  robot.hear /cobalt/i, (msg) ->
    msg.send "*coblat"

  robot.hear /dataon/i, (msg) ->
    msg.send "Apply directly to forehead!"
    msg.send "Apply directly to forehead!"

  robot.respond /:hi5:/, (msg) ->
    user = msg.message.user.name
    msg.send "@#{user}: :hi5:"

  robot.hear /s?crusan/i, (msg) ->
    msg.send "DON'T SPEAK ABOUT THAT TRAITOR!"
