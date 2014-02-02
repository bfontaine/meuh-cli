require './lib/meuh'

Gem::Specification.new do |s|
    s.name          = 'meuh'
    s.version       = Meuh.version
    s.date          = Time.now

    s.summary       = 'scrapper for radiomeuh.com\'s current playlist'
    s.description   = 'Get the currently played track on Radiomeuh.com,'
    s.description  += ' which is the radio used at Anticafé.'
    s.license       = 'MIT'

    s.author        = 'Baptiste Fontaine'
    s.email         = 'batifon@yahoo.fr'
    s.homepage      = 'https://github.com/bfontaine/meuh-cli'

    s.files         = ['lib/meuh.rb', 'lib/meuh/formatting.rb']
    s.test_files    = Dir.glob('tests/*tests.rb')
    s.require_path  = 'lib'
    s.executables  << 'meuh'

    s.add_runtime_dependency 'nokogiri', '~>1.6.1'
    s.add_runtime_dependency 'trollop',  '~>2.0'
    s.add_runtime_dependency 'colored',  '~>1.2'

    s.add_development_dependency 'simplecov'
    s.add_development_dependency 'rake'
    s.add_development_dependency 'test-unit'
    s.add_development_dependency 'fakeweb'
    s.add_development_dependency 'coveralls'
end
