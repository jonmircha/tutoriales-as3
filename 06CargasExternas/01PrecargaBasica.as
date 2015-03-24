//librerias
import flash.display.Loader;
import flash.net.URLRequest;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.display.Shape;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.events.IOErrorEvent;

//variables
var loaderImagen:Loader = new Loader();
var urlImagen:URLRequest= new URLRequest("archivos/waste.jpg");
var txtPrecarga:TextField = new TextField();
var formatoTexto:TextFormat = new TextFormat();
var marco:Shape = new Shape();
var barra:Shape = new Shape();

//funciones

//Función que se ejecuta cuando comienza la operación de carga
function alComenzar(evento:Event):void {
    txtPrecarga.text = "Iniciando la Carga...";
	trace("Iniciando la Carga...");
}

//Función que se ejecuta en todo momento mientras dura la carga
function enProgreso(evento:ProgressEvent):void {
	var bytesCargados:Number = evento.bytesLoaded;
	var bytesTotales:Number = evento.bytesTotal;
	var porcentaje:Number = (bytesCargados/bytesTotales)*100;
	txtPrecarga.text = Math.round(porcentaje)+"% Cargado";
	//Por regla de 3, menos 5 por el ancho del trazo de la barra
	barra.width = ((porcentaje * marco.width) / 100)-5;
	trace(Math.round(porcentaje)+"% Cargado");
}

//Función que se ejecuta cuando las propiedades del objeto cargado están disponibles, cuando esto ocurre podemos modificar el objeto y sus propiedades(tamaño, posición, escala, opacidad, etc)
function alEstarDisponible(evento:Event):void {
    txtPrecarga.text = "";
	loaderImagen.scaleX = loaderImagen.scaleY = .5;
	loaderImagen.x=(stage.stageWidth-loaderImagen.width)/2;
	loaderImagen.y=(stage.stageHeight-loaderImagen.height)/2;
	trace("Carga Disponible");
}

//Función que se ejecuta cuando se completa la carga
function alCompletar(evento:Event):void {
	removeChild(txtPrecarga);
	removeChild(barra);
	removeChild(marco);
	addChild(loaderImagen);
	trace("Carga Completa :)");
}

//Función que se ejecuta cuando hay un error de entrada/salida, por ejemplo, al intentar cargar un archivo inexistente
function siHayError(evento:IOErrorEvent):void {
	txtPrecarga.text = "¡¡¡Error al cargar el contenido :(!!!";
	trace("¡¡¡Error al cargar el contenido :(!!!");
}

//eventos
loaderImagen.contentLoaderInfo.addEventListener(Event.OPEN,alComenzar);
loaderImagen.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,enProgreso);
loaderImagen.contentLoaderInfo.addEventListener(Event.INIT,alEstarDisponible);
loaderImagen.contentLoaderInfo.addEventListener(Event.COMPLETE,alCompletar);
loaderImagen.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,siHayError);

//estados iniciales

loaderImagen.load(urlImagen);

//formato para el texto
formatoTexto.color = 0xFF6600;
formatoTexto.size = 30;
formatoTexto.align = "center";
formatoTexto.font = "Century Gothic";

//caja de texto
txtPrecarga.width = 500;
txtPrecarga.x = (stage.stageWidth-txtPrecarga.width)/2;
txtPrecarga.y = (stage.stageHeight-txtPrecarga.height)/2;
//con esta instrucción asocio un formato de texto a una caja de texto
txtPrecarga.defaultTextFormat = formatoTexto;

//barra
barra.graphics.beginFill(0xFF6600);
barra.graphics.drawRoundRect(0,0,500,20,20,20);
barra.graphics.endFill();

//marco de la barra
marco.graphics.lineStyle(5,0x212121);
marco.graphics.drawRoundRect(0,0,500,20,20,20);

barra.x = marco.x = (stage.stageWidth - marco.width) / 2;
//El +10 es para que la barra y el marco no se encimen con el texto de la precarga
barra.y = marco.y = ((stage.stageHeight - marco.height) / 2) + 10;

addChild(txtPrecarga);
addChild(barra);
addChild(marco);