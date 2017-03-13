# Description:
#   Hilarious baseball names superimposed on random
#   2016 International League players, because why not.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   baseball me - do the thing
#
# Author:
#   acherry, based on code from mkemp

image_base = "http://www.mcs.anl.gov/~acherry/bb-images/"

names = ["Sleve McDichael", "Onson Sweemey", "Darryl Archideld",
         "Anatoli Smorin", "Rey McSriff", "Glenallen Mixon", 
	 "Mario McRlwain", "Raul Chamgerlain", "Kevin Nogilny",
         "Tony Smehrik", "Bobson Dugnutt", "Willie Dustice",
         "Jeromy Gride", "Scott Dourque", "Shown Furcotte", 
         "Dean Wesrey", "Mike Truk", "Dwigt Rortugal",
         "Tim Sandaele", "Karl Dandleton", "Mike Sernandez",
         "Todd Bonzalez", "Wilson Chul Lee" ]

module.exports = (robot) ->
  robot.respond /(baseball)(?: me)/i, (msg) ->
      image_number = Math.floor(860 * Math.random())
      image_url = image_base + image_number + ".jpg"
      name = names[Math.floor(names.length * Math.random())]
      msg.send "#{image_url}\n>>>*#{name}*\n"      
