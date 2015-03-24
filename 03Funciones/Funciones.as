//Funciones en AS3

//función vacia
function imprimirMensaje():void{
	trace("Hola esta es una función en AS3 :)");
}

imprimirMensaje();

//función con parámetros
function sumar(num1:int,num2:int):int{
	var resultado:int = num1 + num2;
	return resultado;
}

var suma:int = sumar(19,20);
trace("Función sumar:",suma);

//función calculadora
function calculadora(num1:Number,num2:Number,op:String):Number{
	var resultado:Number;
	switch(op){
		case "suma":
			resultado = num1 + num2;
			break;
		case "resta":
			resultado = num1 - num2;
			break;
		case "multiplicacion":
			resultado = num1 * num2;
			break;
		case "division":
			resultado = num1 / num2;
			break;
		case "modulo":
			resultado = num1 % num2;
			break;
		default:
			break;
	}
	return resultado;
}

var miSuma:Number = calculadora(2, 5, "suma");
trace("miSuma =", miSuma);
var miResta:Number = calculadora(10, 20, "resta");
trace("miResta =", miResta);
var miMultiplicacion:Number = calculadora(13, 7, "multiplicacion");
trace("miMultiplicacion =", miMultiplicacion);
var miDivision:Number = calculadora(101, 4, "division");
trace("miDivision =", miDivision);
var miModulo:Number = calculadora(25, 2, "modulo");
trace("miModulo =", miModulo);
var miRaizCuadrada:Number = calculadora(1, 19, "raizCuadrada");
trace("miRaizCuadrada =", miRaizCuadrada);