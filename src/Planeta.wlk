import Habitante.*

class Planeta {
	const habitantes = []
	
	method agregarHabitante(habitante) {
		habitantes.add(habitante)
	}
	
	method entrarEnGuerra(){
		habitantes.forEach( {habitante => habitante.preparado(true)} )
		return self.calcularPoderPlaneta()
	}
	
	method calcularPoderPlaneta() = habitantes.sum( {habitante => habitante.poder()} )
	
	method poderDeTresMasPoderosos() = habitantes.map( {habitante => habitante.poder()} ).take(3).sum()
	
	method poseeUnaOrden() = self.poderDeTresMasPoderosos() > self.calcularPoderPlaneta()/2
}