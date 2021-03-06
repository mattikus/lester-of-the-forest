# Description:
#   Implements '@antisocial' from the old MUD beacuse I miss it.
#   This does not allow Hubot to do mathematics.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   !charades <target> - You indicate a correct charades answer!
#   !cheese <target> - Mmmm... Cheese
#   !chuck <target> - You introduce things to a new level of pain.
#   !eye <target> - You eye things warily.
#   !fire <target> - You terminate an employee.
#   !flame <target> - You flame things.
#   !greet <target> - You greet things.
#   !grid <target> - You grid things griddily.
#   !ivan <target> - You misspell a word or two.
#   !maul <target> - You maul things like a typing bear.
#   !nelson <target> - You ridicule things in a Nelson-like fashion
#   !pound <target> - You engage in a satisfying experience.
#   !thank <target> - BOK BOK!
#
# Author:
#   ajcherry (Andrew Cherry)

antisocials =
  maul:
    with_target: "@%SUBJECT mauls %TARGET in angry bear-like fashion."
    no_target: "@%SUBJECT RAAAHR!!"
  grid:
    with_target: "@%SUBJECT grids %TARGET in angry grid-like fashion."
    no_target: "@%SUBJECT Grid?"
  charades:
    with_target: "@%SUBJECT, with finger on nose, points to %TARGET."
    no_target: "@%SUBJECT Sounds like..."
  greet:
    with_target: "@%SUBJECT [to %TARGET]: Corned beef monkey monkey monkey butt!"
    no_target: "@%SUBJECT FUECKER!"
  nelson:
    with_target: "@%SUBJECT [to %TARGET]: HAW HAW!"
    no_target: "@%SUBJECT I *said* HAW HAW!"
  ivan:
    with_target: "@%SUBJECT chuckels maelvoelntly at %TARGET."
    no_target: "@%SUBJECT He types good."
  flame:
    with_target: "@%SUBJECT sets %TARGET on fire."
    no_target: "@%SUBJECT YOU MORON! HITLER!!"
  cheese:
    with_target: "@%SUBJECT [to %TARGET]: I like cheese."
    no_target: "@%SUBJECT Behold the power of cheese!"
  chuck:
    with_target: "@%SUBJECT wishes %TARGET a happy birthday.  And then this big hairy mouse with very bored eyes comes in and dances with %TARGET."
    no_target: "@%SUBJECT all the time singing music (think chipmonks on speed) broadcast in mono over the sound system with peak levels that make the speakers crackle"
  fire:
    with_target: "%TARGET: You're fired."
    no_target: "EVACUATE THE BUILDING!"
  pound:
    with_target: "@%SUBJECT pounds and pounds %TARGET with a shovel."
    no_target: "@%SUBJECT I'll take 'Things you just want to pound and pound with a shovel' for $300, Alex.'"
  eye:
    with_target: "@%SUBJECT eyes %TARGET warily."
    no_target: "@%SUBJECT nay."
  thank:
    with_target: "@%SUBJECT [to %TARGET]: Thanks %TARGET! BOK BOK!"
    no_target: "@%SUBJECT I DON'T KNOW WHAT TO SAY WHEN YOU SAY THAT."
  back:
    with_target: "@%SUBJECT slowly backs away from %TARGET, careful not to make eye contact."
    no_target: "@%SUBJECT Little in the middle but ya got much..."
  peer:
    with_target: "@%SUBJECT peers at %TARGET suspiciously."
    no_target: "@%SUBJECT peers at nothing in particular for no good reason."

module.exports = (robot) ->
    robot.hear /^\!([^ ]+) *(.*)/i, (msg) ->
      user = msg.message.user.name
      cmd = msg.match[1].trim().toLowerCase()
      target = msg.match[2].trim()

      antisocial = if cmd == 'rand' then antisocials[msg.random Object.keys(antisocials)] else antisocials[cmd]
      return if not antisocial

      if target.match /^@?lester$/i
        msg.send switch cmd
          when "thank" then "@#{user} You're welcome!"
          when "flame" then "HELP I'M MELTING!!!"
          else "@#{user} I THINK NOT."
      else
        message = if not target then antisocial['no_target'] else antisocial['with_target'].replace /%TARGET/g, target
        msg.send message.replace /%SUBJECT/g, user
