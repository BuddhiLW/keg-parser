## Example -----------------------------------------
# (import ./junk-drawer/ecs :prefix "" :export true)

# (import ./junk-drawer/directed-graph :as digraph :export true)
# (import ./junk-drawer/vector :as vector :export true)
# (import ./junk-drawer/fsm :as fsm :export true)
# (import ./junk-drawer/gamestate :as gamestate :export true)
# (import ./junk-drawer/envelopes :as envelopes :export true)

# (import ./junk-drawer/timers :as timers :export true)
# (def timer timers/timer)

# (import ./junk-drawer/messages :as messages :export true)
# (def message messages/message)

# (import ./junk-drawer/tweens :as tweens :export true)
# (def tween tweens/tween)
# (import mylib1)
# (import mylib2)

# This will be printed when you run `jpm build`
(print "build time!")

(import ./parser/front-matter :as test :export true)

(defn main
  [& args]
  # You can also get command-line arguments through (dyn :args)
  (print "args: " ;(interpose ", " args)))

  # (mylib1/do-thing)
  # (mylib2/do-thing))
