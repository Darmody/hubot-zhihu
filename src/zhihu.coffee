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
  robot.hear /(知乎|zhihu)( me)/i, (msg) ->        # 获取知乎日报列表
    msg.http("http://news-at.zhihu.com/api/4/news/latest")        # 请求知乎日报API
            .get() (err, res, body) ->
                if err      # 错误处理
                    msg.send "Encountered an error :( #{err}"
                    return

                # 内容拼接
                body = JSON.parse(body);
                content = ''

                story = msg.random body.stories
                content += '文章:*' + story.title + '*\n'
                content += '阅读原文: http://daily.zhihu.com/story/' + story.id + '\n'
                content += story.images[0] + '\n'
                msg.send content
  # robot.hear /orly/, (msg) ->
    # msg.send "yarly"
