# Description:
#   Listens for deploys webhooks from github and commits seppuku
#
# Dependencies:
#   none
#
# Commands:
#   None
#
# Author:
#   mattikus
#
module.exports = (robot) ->
  robot.messageRoom '#lester-development', "I LIVE!!!"

  robot.on "github-repo-event", (repo_event) =>
      githubPayload = repo_event.payload
      robot.logger.debug repo_event.payload
      if repo_event.payload.ref.search /master/
        robot.messageRoom '#lester-development', "Redeploying myself, brb."
        robot.logger.info "Killing myself to redeploy"
        setTimeout ->
          process.exit 1
        , 2000

