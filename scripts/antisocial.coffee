# Description:
#   Implements '@antisocial' from the old MUD beacuse I miss it.
#   This does not allow Hubot to do mathematics.
#

module.exports = (robot) ->

    antisocials =
        maul:
            with_target: "@%SUBJECT mauls %TARGET in angry bear-like fashion."
            no_target: "@%SUBJECT: RAAAHR!!"
        grid:
            with_target: "@%SUBJECT grids %TARGET in angry grid-like fashion."
            no_target: "@%SUBJECT: Grid?"
        charades:
            with_target: "@%SUBJECT, with finger on nose, points to %TARGET."
            no_target: "@%SUBJECT: Sounds like..."
        greet:
            with_target: "@%SUBJECT [to %TARGET]: Corned beef monkey monkey monkey butt!"                  
            no_target: "@%SUBJECT FUECKER!"
        nelson:
            with_target: "@%SUBJECT [to %TARGET]: HAW HAW!"
            no_target: "@%SUBJECT: I *said* HAW HAW!"
        ivan:
            with_target: "@%SUBJECT chuckels maelvoelntly at %TARGET."
            no_target: "@%SUBJECT: He types good."
        flame:
            with_target: "@%SUBJECT sets %TARGET on fire."
            no_target: "@%SUBJECT: YOU MORON! HITLER!!"
        cheese:
            with_target: "@%SUBJECT [to %TARGET]: I like cheese."
            no_target: "@%SUBJECT: Behold the power of cheese!"
        chuck:
            with_target: "@%SUBJECT wishes %TARGET a happy birthday.  And then this big hairy mouse with very bored eyes comes in and dances with %TARGET."
            no_target: "@%SUBJECT: all the time singing music (think chipmonks on speed) broadcast in mono over the sound system with peak levels that make the speakers crackle"
        fire:
            with_target: "%TARGET: You're fired."
            no_target: "EVACUATE THE BUILDING!"

    robot.hear /^([^ ]+) *(.*)/i, (msg) ->
        user = msg.message.user.name
        cmd = msg.match[1].trim()
        target = msg.match[2].trim()

        if cmd == 'rand'
            all_antisocials = Object.keys(antisocials)
            antisocial = antisocials[all_antisocials[Math.floor(all_antisocials.length * Math.random())]]
        else
            antisocial = antisocials[cmd]

        if antisocial
           if target
               if target == 'lester' or target == '@lester'
                   message = "@#{user}: I THINK NOT."
               else
                   message = antisocial['with_target']
                   message = message.replace /%TARGET/g, target
           else
               message = antisocial['no_target']

           message = message.replace /%SUBJECT/g, user

           msg.send message
