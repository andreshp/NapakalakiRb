######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

begin
    require 'bones'
rescue LoadError
    abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'

#task 'gem:release' => 'test:run'
#
namespace :test do
    desc "Pass a test"
    task :run do
        sh "ruby ./test/testNapakalaki.rb"
    end
end

desc "Build the documentation. Option: OPEN=false (not open a broswer)"
task :document do |t|
    open_doc = ENV["OPEN"] || "true"
    sh "yard doc ./lib"
    if open_doc == "true" then sh "xdg-open ./doc/index.html" end
end

Bones {
    name     'napakalaki'
    authors  'Andrés Herrera Poyatos, Juan Luis Suárez Díaz'
    email    'andreshp9@gmail.com'
    url      'https://github.com/andreshp/NapakalakiRb'
}

