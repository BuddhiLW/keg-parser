(declare-project
  :name "keg-parser"
  :description "Parser for the Knowledge Exchange Graph."
  :author "Pedro Gomes Branquinho"
  :license "MIT"
  :url "https://github.com/BuddhiLW/keg-parser"
  :repo "git+https://github.com/BuddhiLW/keg-parser"
  :dependencies ["spork"])

(declare-source
  :source @["parser" "parser.janet"])

(declare-executable
 :name "keg-parser"
 :entry "parser.janet"
 :install true)
