# Description:
#   Returns a random image from the jeopardybot.tumblr.com blog
#
# Dependencies:
#   None
#
# Configuration:
#   Environment variable TUMBLR_API_KEY
#
# Commands:
#   hubot jeopardy me - returns random jeopardy
#
# Author:
#   mattikus

TUMBLR_API_KEY = process.env.HUBOT_TUMBLR_API_KEY
uri = "https://api.tumblr.com/v2/blog/jeopardybot.tumblr.com"

randInRange = (low, high) ->
  Math.floor(Math.random() * (high - low + 1) + low)

module.exports = (robot) ->
  robot.respond /jeopardy(?: me)?/, (msg) ->
    total_posts = 0
    msg.http("#{uri}/info?api_key=#{TUMBLR_API_KEY}")
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        try
          data = JSON.parse body
        catch error
          msg.send "I DUN FUCKED UP: #{error}"
          return
        total_posts = data.response.blog.total_posts
        offset = randInRange 0, total_posts
        msg.http("#{uri}/posts/photo?api_key=#{TUMBLR_API_KEY}&limit=1&offset=#{offset}")
          .header('Accept', 'application/json')
          .get() (err, res, body) ->
            try
              data = JSON.parse body
              msg.send data.response.posts[0].photos[0].original_size.url
            catch error
              msg.send "I DUN FUCKED UP: #{error}"
              return

