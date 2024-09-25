import cosas.*
import camion.*

object almacen{
    const property stock = []
    var property bultosMaximos = 3


    method almacenar(cosas){
        stock.addAll(cosas)
    }

    method tieneLugarPara(vehiculo){
        return vehiculo.totalBultos() <= self.bultosRestantes()
    }

    method totalBultosAlmacen(){
        return stock.sum( { cosa => cosa.bulto() } )
    }
    method bultosRestantes(){
        return bultosMaximos - self.totalBultosAlmacen()
    }

}

//Test de pull and push

