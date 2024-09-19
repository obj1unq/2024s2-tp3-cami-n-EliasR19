object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
    method bulto() { return 1}
    method cambio(){
        null
    }
}

object bumblebee{
    var forma = null

    method forma(_forma){
        forma = _forma
    }

    method peso(){  return 800 }

    method nivelPeligrosidad() { return forma.nivelPeligrosidadForma()}
    method bulto() { return 2}

    method cambio(){
        forma = robot
    }
}

object auto{
    method nivelPeligrosidadForma() { return 15}
}
object robot{
    method nivelPeligrosidadForma() { return 30}
}

//
object ladrillos{
    var  ladrillos = 0

    method cargar(cantidad){
        ladrillos = ladrillos + cantidad
    }

    method peso() { return ladrillos*2}
    method nivelPeligrosidad() { return 2 }
    method bulto() {
        const bulto = if(ladrillos <= 100 ) 1 else if (ladrillos <= 300) 2 else 3
        return bulto
    }

    method cambio(){
        ladrillos = ladrillos + 12
    }
}

object arenaGranel{
    var property peso = 0

    method nivelPeligrosidad() { return 2} 
    method bulto() { return 1}
    method cambio() {
        peso = peso + 20
    }
}

object bateria{
    var tieneMisiles = false

    method tieneMisiles(_tieneMisiles){
        tieneMisiles = _tieneMisiles
    }

    method peso() {
        return if(tieneMisiles) 300 else 200
    }

    method nivelPeligrosidad() { return if(tieneMisiles) 100 else 0}
    method bulto(){ return if(tieneMisiles) 2 else 1}

    method cambio(){
        tieneMisiles = true
    }
}

object contenedor{
    const cosasDentro = []

    method guardar(cosa){
        cosasDentro.add(cosa)
    }

    method peso() { return 100 + cosasDentro.sum( { cosa => cosa.peso()})}
    method nivelPeligrosidad()  { 
        return if(!cosasDentro.isEmpty()) self.objetoMasPeligroso().nivelPeligrosidad() else 0

    }

    method objetoMasPeligroso(){
        return cosasDentro.max( { cosa => cosa.nivelPeligrosidad()})
    }

    method bulto(){ return 1 + cosasDentro.sum( { cosa => cosa.bulto()})}

    method cambio(){
        cosasDentro.forEach({ cosa => cosa.cambio()})
    }
}

object residuosRadiactivos{
        var property peso = 0
        method nivelPeligrosidad() { return 200}
        method bulto() { return 1}

        method cambio(){
            peso = peso + 15
        }
    }

object embalaje{
    var  objetoEnvuelto = null

    method embalar(cosa){
        objetoEnvuelto = cosa
    }

    method peso() { return objetoEnvuelto.peso()}
    method nivelPeligrosidad() { return objetoEnvuelto.nivelPeligrosidad() / 2}
    method bulto() { return 2}

    method cambio(){
        null
    }

}




