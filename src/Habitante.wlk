import Equipamiento.*
import SableDeLuz.*
import Suceso.*

class Habitante {

	const inteligencia = 0
	const valentia = 0
	var preparado
	
	method poder() {
		return valentia + inteligencia
	}
	
	method preparado(estadoDePreparacion) {
		preparado = estadoDePreparacion
	}
}

class Soldado inherits Habitante {
	const equipamiento = []
	
	override method poder() {
		return super() + self.equipoUtil().sum( {equipo => equipo.potencia()} )
	}
	
	method agregarEquipamiento(equipo) {
		equipamiento.add(equipo)
	}
	
	method sacarEquipamiento(equipo) {
		equipamiento.remove(equipo)
	}
	
	method equipoUtil() = equipamiento.filter( {equipo => equipo.esUtil()} )
}

class Maestro inherits Soldado {
	const cantidadMidiclorianos
	const sableDeLuz
	var ladoEnLaFuerza
	
	method ladoEnLaFuerza() = ladoEnLaFuerza
	
	override method poder() {
		return valentia + inteligencia + cantidadMidiclorianos/1000 + ladoEnLaFuerza.potencia(sableDeLuz)
	}
	
	method repararTodoElEquipo() {
		equipamiento.forEach( {equipo => equipo.reparar()} )
	}
	
	method vivirSuceso(suceso) {
		if(ladoEnLaFuerza.vivirSuceso(suceso.cargaEmocional()) == "Luminoso")
			self.cambiarLadoOscuro()
		else if(ladoEnLaFuerza.vivirSuceso(suceso.cargaEmocional()) == "Oscuro")
			self.cambiarLadoLuminoso()
		self.repararTodoElEquipo()
	}
	
	method cambiarLadoLuminoso() {
		ladoEnLaFuerza = new Jedi(yearsJuntoALaLuz = 0, nivelPazInterior = 1000)
	}
	
	method cambiarLadoOscuro() {
		ladoEnLaFuerza = new Sith(yearsSiendoSith = 0, nivelOdio = 1000)
	}
}

class Jedi {
	var yearsJuntoALaLuz
	var nivelPazInterior 
	const lado = "Luminoso"
	
	method lado() = lado
	
	method potencia(sableDeLuz) = sableDeLuz.potencia(true, yearsJuntoALaLuz)
	
	method pasoDelTiempo() {
		yearsJuntoALaLuz += 1
	}
	
	method vivirSuceso(cargaEmocional) {
		self.pasoDelTiempo()
		nivelPazInterior += cargaEmocional
		if(nivelPazInterior <= 0)
			return lado
		return ""
	}
}

class Sith {
	var yearsSiendoSith
	var nivelOdio
	const lado = "Oscuro"
	
	method lado() = lado
	
	method potencia(sableDeLuz) = sableDeLuz.potencia(false, yearsSiendoSith)
	
	method pasoDelTiempo() {
		yearsSiendoSith += 1
	}
	
	method vivirSuceso(cargaEmocional) {
		self.pasoDelTiempo()
		if(nivelOdio < cargaEmocional)
			return lado
		else
			nivelOdio *= 1.1
		return ""
	}
}


