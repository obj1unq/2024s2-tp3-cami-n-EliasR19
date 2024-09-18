object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblee{
    var forma = null

    method forma(_forma){
        forma = _forma
    }

    method peso(){  return 800 }

    method nivelPeligrosidad() { return forma.nivelPeligrosidadForma()}
}

object auto{
    method nivelPeligrosidadForma() { return 15}
}
object robot{
    method nivelPeligrosidadForma() { return 30}
}

//
object ladrillos{
    var property ladrillos = 0

    method peso() { return ladrillos*2}
    method nivelPeligrosidad() { return 2 } 
}

object arenaGranel{
    var property peso = 0

    method nivelPeligrsosidad() { return 2} 
}

object bateria{
    var tieneMisiles = false

    method misiles(_tieneMisiles){
        tieneMisiles = _tieneMisiles
    }

    method peso() {
        return if(tieneMisiles) 300 else 200
    }

    method nivelPeligrosidad() { return if(tieneMisiles) 100 else 0}
}

object contenedor{
    const cosasDentro = []

    method guardad(cosa){
        cosasDentro.add(cosa)
    }

    method peso() { return 100 + cosasDentro.sum( { cosa => cosa.peso()})}
    method nivelPeligrosidad()  { 
        return if(!cosasDentro.isEmpty()) self.objetoMasPeligroso().nivelPeligrosidad() else 0

    }

    method objetoMasPeligroso(){
        return cosasDentro.max( { cosa => cosa.nivelPeligrosidad()})
    }
}

object residuosRadiactivos{
        var property peso = 0
        method nivelPeligrosidad() { return 200}
    }

object embalaje{
    var  objetoEnvuelto = null

    method objetoEnvuelto(_objetoEnvuelto){
        objetoEnvuelto = _objetoEnvuelto
    }

    method peso() { return objetoEnvuelto.peso()}
    method nivelPeligrosidad() { return objetoEnvuelto.nivelPeligrosidad() / 2}

}



