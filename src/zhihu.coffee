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
# request = require('request')
# async = require('async')

# class Zhihu
    # construct: () ->

    # getNew: (callback) ->
        # async.waterfall [
            # (cb) ->
                # options = {
                    # url: 'http://news-at.zhihu.com/api/4/news/latest ',
                    # method: 'GET'
                # }

                # request options, (err, res, body) ->
                    # log body
                    # cb err, body
        # ], (err, ret) ->
            # callback(err, ret);

module.exports = (robot) ->
  robot.respond /zhihu/, (msg) ->
    robot.http("http://news-at.zhihu.com/api/4/news/latest")
            .get() (err, res, body) ->
                if err
                    msg.send "Encountered an error :( #{err}"
                    return
                log body
                msg.reply body

  robot.hear /orly/, ->
    msg.send "yarly"
