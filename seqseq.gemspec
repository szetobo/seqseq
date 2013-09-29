$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seqseq/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "seqseq"
  s.version     = SeqSeq::VERSION
  s.authors     = ['Szetobo']
  s.email       = ['szetobo@gmail.com']
  s.homepage    = 'https://github.com/szetobo/seqseq'
  s.summary     = %q{A sequence number generator}
  s.description = %q{A sequence number generator}

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.0.0"

  s.add_development_dependency "pg"
end
