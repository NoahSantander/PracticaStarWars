class Equipamiento {
	var desgastado = false
	const potencia = 0
	
	method desgaste() = desgastado
	
	method potencia() = potencia
	
	method reparar(){
		desgastado = false
	}
	
	method esUtil() = potencia > 10 && !desgastado
}
