require 'time'
require "ansi/selector"
require 'rbconfig'
is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)

def tocar_alarme
  while true
    puts "CTRL + C PARA ENCERRAR!"
    print "\a"
    sleep 2
  end
end


puts "==================="
puts "|Alarme do Tenorio|"
puts "|   são #{Time.now.strftime("%I:%M%p")}   |"
puts "==================="

puts "\n\n"
puts "Selecione a função desejada"
if is_windows
  puts "1- Alarme"
  puts "2- Timer"
  op = gets.chomp
  op == "1" ? option = "Alarme" : nil
  op == "2" ? option = "Timer" : nil
else
  option = Ansi::Selector.select(["Alarme", "Timer"])
end

if option == "Alarme"
  puts "Defina o horario do alarme. (hh:mm)"
  time = gets.chomp
  seconds_to_wait = Time.parse(time) - Time.now
  minutos = seconds_to_wait / 60
  puts "O Alarme tocará em #{minutos.to_i} minutos, as #{time}. Até mais!"
  seconds_to_wait = Time.parse(time) - Time.now
  sleep seconds_to_wait
  tocar_alarme
elsif option == "Timer"
  puts "Defina o Tempo do timer em horas."
  timer = gets.chomp.to_i * 60
  puts "Defina o Tempo do timer em minutos."
  timer = timer + gets.chomp.to_i
  puts "Defina o Tempo do timer em segundos."
  timer = (timer * 60) + gets.chomp.to_i
  alarme = Time.now + timer
  puts "O Alarme tocará as #{alarme.strftime("%I:%M%p")}. Até mais!"
  sleep timer
  tocar_alarme
end
