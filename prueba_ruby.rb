def read_alum(file_name)
file = File.open(file_name, 'r')
alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
file.close
alum
end

def aprobados(nota=5.0)
  if nota >= 5.0
     aprobado = true
  else
    aprobado = false
  end
end

arreglo_de_notas = read_alum('notas.csv')
# [
# ["David", "9", "2", "5", "1", "1"],
# ["Macarena", "10", "2", "A", "8", "1"],
# ["Ignacio", "10", "10", "9", "9", "A"],
# ["Rocio", "10", "10", "10", "10", "10"]
# ]

def menu
  puts '1) Promedio de notas'
  puts '2) Inasistencia alumnos'
  puts '3) Alumnos aprobados'
  puts '4) Salir'
end

menu
puts 'Ingrese una opción: '
opcion = gets.chomp.to_i

while opcion != 4 #Termina el programa

  if opcion == 1 #Imprimir en pantalla el nombre de cada alumno y el promedio de sus notas.
    arreglo_de_notas.each do |nombre|
      alumno = nombre[0]
      calificaciones = nombre.map do |nota|
        nota.to_i
      end
      promedio = calificaciones.sum.to_f/(nombre.count-1)
      puts "\nEl promedio de #{alumno} es: #{promedio}"
    end

  elsif opcion == 2 #Imprimir en pantalla el nombre de cada alumno y la cantidad de inasistencias.
    arreglo_de_notas.each do |nombre|
      contador = 0
      alumno = nombre[0]
      nombre.each do |inasistencia|
        if inasistencia == 'A'
          contador +=1
        end
      end
   puts "\nLa inasistencia de #{alumno} en el curso es: #{contador}"
  end

  elsif opcion == 3 #Imprimir en pantalla los nombres de los alumnos aprobados.
    arreglo_de_notas.each do |nombre|
      alumno = nombre[0]
    end

  else
    puts 'Ingrese una opción válida'
  end

  menu
  puts 'Ingrese una opción: '
  opcion = gets.chomp.to_i

end

puts 'Chao :)'
