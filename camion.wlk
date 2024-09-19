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

    method hayAlgunoQuePesa(peso){
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

    method objetosMasPeligrososQue(cosa){
        return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())       
    }

//
    method puedeCircularEnRuta(nivelMaximoPeligrosidad){
        return !self.excedidoDePeso() && !self.excedidoDeNivel(nivelMaximoPeligrosidad)
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

// Almacen
    method transportar(destino, camino){
        self.validarTransporte(destino, camino)
        destino.almacenar(cosas)
        cosas.clear()
    }

    method validarTransporte(destino, camino){
        if(!self.puedeTransportar(destino, camino)){
            self.error("No se puede realizar el transporte")
        }
    }

    method puedeTransportar(destino, camino){
        return !self.excedidoDePeso() && 
            destino.tieneLugarPara(self) &&
            camino.puedeCircular(self) 
    }


}


//Caminos

object ruta9{
    method nivelPeligrosidad() { return 11}

    method puedeCircular(vehiculo){
        return vehiculo.puedeCircularEnRuta(self.nivelPeligrosidad())
    }
}

object caminosVecinales{
    method nivelPeligrosidad() { }
    var pesoMaximo = 0

    method pesoMaximo(_pesoMaximo){
        pesoMaximo = _pesoMaximo
    }

    method puedeCircular(vehiculo){
        return vehiculo.pesoTotal() <= pesoMaximo
    }

}