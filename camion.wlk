import cosas.*
import almacen.*

object camion {
	const property cosas = #{}
    const tara = 1000
    const pesoMaximo = 2500
		
	method cargar(unaCosa) {
        unaCosa.cambio()
		cosas.add(unaCosa)
	}

    method descargar(unaCosa){
        cosas.remove(unaCosa)   
    }

    method todoPesoPar(){
        return cosas.all({cosa=> cosa.peso().even()})
    }

    method hayAlgunoQuePese(peso){
        return cosas.any({cosa => cosa.peso() == peso})
    }

    method elDeNivel(nivel){
        //return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
        // y si no hay ninguno
        return cosas.findOrDefault({cosa => cosa.nivelPeligrosidad() == nivel}, null)
    }

    method pesoTotal(){
        return tara + cosas.sum({ cosa => cosa.peso()})
    }

    method excedidoDePeso(){
        return self.pesoTotal() > pesoMaximo
    }

    method objetosQueSuperanPeligrosidad(nivel){
        return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
    }

    method objetoMasPeligrosoQue(cosa){
        return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())       
    }

//
    method puedenCircularEnRuta(nivelMaximoPeligrosidad){
        return !self.excedidoDePeso() && self.excedidoDeNivel(nivelMaximoPeligrosidad)
    }

    method excedidoDeNivel(nivel){
        return self.objetosQueSuperanPeligrosidad(nivel).size() >= 1
        // probar con .isEmpty()
    }
//

    method tieneAlgoQuePesaEntre(min, max){
        return cosas.any({ cosa => self.estaCosaEntre(cosa, min, max)})
    }

    method estaCosaEntre(cosa, min, max){
        return cosa.peso() >= min && cosa.peso() <= max
    }
//
    method cosaMasPesada(){
        return cosas.max( { cosa => cosa.peso()})
    }

    method pesos(){
        return cosas.map( { cosa => cosa.peso()})
    }

    method totalBultos(){
        return cosas.sum( { cosa => cosa.bulto()})
    }

}
