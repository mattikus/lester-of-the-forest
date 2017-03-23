# Description:
#   Hilarious inside joke only mr bacon will understand
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot does <person> like crackers?
#   hubot who likes crackers?
#   hubot oregon me
#
# Author:
#   mattikus

module.exports = (robot) ->

  robot.respond /do(?:es)? (.*) like crackers(?:\?)?/i, (msg) ->
    msg.send "YES"

  robot.respond /who likes crackers(?:\?)?/i, (msg) ->
    msg.send "EVERYONE"

  robot.respond /oregon(?: me)?/i, (msg) ->
      msg.send """\
>>>You meet a man on the Oregon Trail.
He tells you his name is Terry.
You laugh and tell him that's a girl's name.
Terry shoots you, and you die of dissin' Terry
"""
