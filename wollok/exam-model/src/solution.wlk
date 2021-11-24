//import calculadoraDeCuadras.*

class ListaDeComprasException inherits Exception {
	const property cliente
}ddddd

class Producto {
	var property nombre = "";
	var property cantidad = 0;
	var property precioPorUnidad = 0;
	
	method precio() = precioPorUnidad * cantidad;
	
	method agregarCantidad(cantidadAAgregar) = cantidad + cantidadAAgregar;
}

class Pedido {
	var property local = "";
	const productos = #{};
	
	/** 1 */
	method precioBruto() = productos.sum({producto => producto.precio()});
	
	/** 2.i */	
	method costroRealEnvio(cliente) {
		//const calculadoraDeCuadras = new CalculadoraDeCuadras();
		//return (calcludoraDeCuadras.calcular(cliente, local) * 15).min(300);		
	}
	
	method crearProducto(nombre) {
		return new Producto(nombre=nombre, cantidad=0);
	}
	
	method crearProducto(nombreProducto, cantidad) {
		return new Producto(nombre=nombre, cantidad=cantidad);
	}	
	
	method crearProducto(nombreProducto, cantidad, precioPorUnidad) {
		return new Producto(nombre=nombre, cantidad=cantidad, precioPorUnidad=precioPorUnidad);
	}		
	
	/** 3.i */
	method agregarAPedido(nombreProducto, cantidad) {
		const producto = productos.findOrElse({producto => producto.nombre() == nombreProducto}, self.crearProducto(nombreProducto));
		producto.agregarCantidad(cantidad);		
		productos.add(producto);
	}
	
	method validarPedido() {
		
	}
}

class Membresia {
	method aplicarDescuento(costoRealEnvio, _) = costoRealEnvio;
}

object comun inherits Membresia {}

object silver inherits Membresia {
	override method aplicarDescuento(costoRealEnvio, _) = costoRealEnvio * 0.5; 
}

object gold inherits Membresia {
	override method aplicarDescuento(costoRealEnvio, compras) {
		const cantidadDeCompras = compras.len();
		if (cantidadDeCompras.div(5) == 0 && cantidadDeCompras !=0) {
	 		return 0;
	 	}
	 	return costoRealEnvio * 0.1;
	 }
}

class Compra {
	const  pedido
	const valorDelEnvio;
	const fecha;	
}

class Cliente {
	const property pedidos = #{};
	const property compras = #{};
	var property membresia = comun; 
	
	/** 2.ii */	
	method valorEnvio(pedido) {
		return membresia.aplicarDescuento(pedido.costoRealEnvio(self), compras);  
	} 
	
	/** 3.ii */
	method efectuarCompra(pedido) {
		pedido.validarPedido()
		compras.add(pedido.hacerCompra())
	}
	
	/** 4 */	
	method compraMasCara() {
		if (compras.size() > 1) {
			var compraMasCara = compras.asList().first();
			
			compras.forEach({ compra =>
				if(compra.precioFinal() > compraMasCara.precioFinal()) {
					compraMasCara = compra;
				}
			})
			
			return compraMasCara;
		}
		
		throw new ListaDeComprasException(cliente=self, message="El cliente aún no realizo ninguna compra!");
	}
}
