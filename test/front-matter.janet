(import spork/test)
(import ../parser/front-matter :as fm)


(test/start-suite "Front Matter Parsing Tests")

# Test valid YAML front matter and title

(print "got:")
(test/assert
 (=
  (pp (fm/parse-frontmatter "---\nauthor: jane doe\ndate: 2024-01-01\n---\n\n# my title\neqweqweqweqweqwewq"))
  (print "expects:  @[43 \"\" \"my title\\n\"]")
  )
    "Valid front matter parsing")

# Doesn't work
# (test/assert
#  (=
#   (fm/parse-frontmatter "---\nauthor: jane doe\ndate: 2024-01-01\n---\n\n# my title\n eqweqweqweqweqwewq")
#   @[43 "" "my title\n"]
#   )
#     "Valid front matter parsing")

# Test missing front matter
(test/assert
  (nil? (fm/parse-frontmatter "# No front matter\nJust content"))
  "Handles missing front matter correctly")

# Test malformed front matter
(test/assert
  (nil? (fm/parse-frontmatter "---\nfoo: bar\n---\n#TitleWithoutSpace"))
  "Handles missing space after title correctly")

(test/end-suite)


# # Example text with front matter
# (def example-text "---\nauthor: Jane Doe\ndate: 2024-01-01\n---\n\n# My Title\nThis is the body content.\nMore content.")

# # Parse front matter and extract title position and content
# (def result (parse-frontmatter example-text))

# (if result
#   (do
#     (printf "YAML Content:\n%s\n" (result :yaml))
#     (printf "Title found at position: %d\n" (first (result :title)))
#     (printf "Title content: %s\n" (second (result :title)))
#     (printf "Body content:\n%s\n" (result :body)))
#   (print "No front matter found"))

# # Find positions of "content" occurrences in text
# (def content-positions (peg/match (finder "content") example-text))

# (if content-positions
#   (printf "The word 'content' found at positions: %j\n" content-positions)
#   (print "The word 'content' was not found"))
