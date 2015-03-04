
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name     'napakalaki'
  authors  'Andrés Herrera Poyatos, Juan Luis Suárez Díaz'
  email    'andreshp9@gmail.com'
  url      'https://github.com/andreshp/NapakalakiRb'
}

