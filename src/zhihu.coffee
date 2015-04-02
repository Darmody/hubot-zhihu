# Description
#   hubot知乎日报获取
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Darmody[@<org>]

module.exports = (robot) ->
  robot.respond /zhihu/, (msg) ->
    robot.http("http://news-at.zhihu.com/api/4/news/latest")
            .get() (err, res, body) ->
                if err
                    msg.send "Encountered an error :( #{err}"
                    return

                body = JSON.parse(body);
                content = ''
                content += '#知乎日报\n'

                for story in body.stories
                    content += '##' + story.title + '\n'
                    content += story.images[0] + '\n'
                msg.reply content

  robot.hear /orly/, ->
    msg.send "yarly"
