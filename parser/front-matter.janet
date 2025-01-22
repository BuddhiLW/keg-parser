(defn peg-find
  [str]
  ~(some (sequence (capture ($)) ,str (opt 1))))

(defn finder
  "Creates a PEG pattern that finds all locations of `str` in the given text."
  [str]
  (peg/compile peg-find))

# Define PEG parser for front matter
(def front-matter-grammar
  (peg/compile
   ~{:yaml (sequence "---\n" (thru "---\n"))
     :title (sequence (some "\n") ,(peg-find "#") (capture (thru "\n")))
     :body (some (+ :w :s))
     :main (sequence :yaml :title :body)})) # :body
# (capture ($)) "# "

(defn parse-frontmatter [text]
  (peg/match front-matter-grammar text))

# (def email-peg
#   (peg/compile '{:main (some (sequence (some (set "a-z0-9.@")) (opt ", ")))}))

# (pp (peg/match email-peg "alice@example.com, bob@domain.org"))
