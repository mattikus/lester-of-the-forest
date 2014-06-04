text = "You meet a man on the Oregon Trail.\nHe tells you his name is Terry.\nYou laugh and tell him that's a girl's name.\nTerry shoots you, and you die of dissin' Terry"
module.exports = (robot) ->
  robot.respond /oregon(?: me)?/i, (msg) ->
      msg.send text
