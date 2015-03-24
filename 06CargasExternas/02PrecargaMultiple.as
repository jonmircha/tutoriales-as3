//librerias
import flash.display.Loader;
import flash.net.URLRequest;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.display.Shape;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.events.IOErrorEvent;
import flash.events.IEventDispatcher;

//variables
var loaderImagen:Loader = new Loader();
var loaderSWF:Loader = new Loader();
var loaderImagen2:Loader = new Loader();
var loaderSWF2:Loader = new Loader();
var urlImagen:URLRequest = new URLRequest("archivos/waste.jpg");
var urlSWF:URLRequest = new URLRequest("archivos/rompecabezas.swf");
var urlImagen2:URLRequest = new URLRequest("archivos/gatito.jpg");
var urlSWF2:URLRequest = new URLRequest("archivos/ojos.swf");
var txtPrecarga:TextField = new TextField();
var formatoTexto:TextFormat = new TextFormat();
var marco:Shape = new Shape();
var barra:Shape = new Shape();
var archivosACargar:int = 0;
var totalArchivos:int = 4;

//funciones

//Función que añade los listeners a los objetos de tipo loader
function agregarListeners(queLoader:IEventDispatcher):void {
	queLoader.addEventListener(Event.OPEN,alComenzar);
	queLoader.addEventListener(ProgressEvent.PROGRESS,enProgreso);
	queLoader.addEventListener(Event.INIT,alEstarDisponible);
	queLoader.addEventListener(Event.COMPLETE,alCompletar);
	queLoader.addEventListener(IOErrorEvent.IO_ERROR,siHayError);
}

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
	//numChildren me dice cuantos elementos hay en el escenario, su valor empieza en 0, por eso se le resta 1
	var ultimaProfundidad:uint = this.numChildren-1;
	txtPrecarga.text = Math.round(porcentaje)+"% Cargado";
	//Por regla de 3 obtengo el ancho de la barra, menos 5 por el ancho del trazo de la barra
	barra.width = ((porcentaje * marco.width) / 100)-5;
	//Para que los elementos de la Precarga(txtPrecarga,marco y barra) se vean por encima de los contenidos externos mientras se cargan setChildIndex coloca la profundidad deseada al elemento indicado
	this.setChildIndex(txtPrecarga,ultimaProfundidad);
	this.setChildIndex(marco,ultimaProfundidad-1);
	this.setChildIndex(barra,ultimaProfundidad-2);
	
	trace(Math.round(porcentaje)+"% Cargado");
}

//Función que se ejecuta cuando las propiedades del objeto cargado están disponibles, cuando esto ocurre podemos modificar el objeto y sus propiedades(tamaño, posición, escala, opacidad, etc)
function alEstarDisponible(evento:Event):void {
    txtPrecarga.text = "";
	loaderImagen.scaleX = loaderImagen.scaleY = loaderImagen.alpha = 0.5;
	loaderImagen.x = (stage.stageWidth-loaderImagen.width)/2;
	loaderImagen.y = (stage.stageHeight-loaderImagen.height)/2;
	loaderSWF.scaleX = loaderSWF.scaleY = 0.5;
	loaderSWF.x = (stage.stageWidth-loaderSWF.width)/2;
	loaderSWF.y = (stage.stageHeight-loaderSWF.height)/2;
	loaderImagen2.scaleX = loaderImagen2.scaleY = 0.5;
	loaderImagen2.x = 50;
	loaderImagen2.y = 350;
	loaderSWF2.scaleX = loaderSWF2.scaleY = 0.5;
	loaderSWF2.x = loaderSWF2.y = 500;
	trace("Carga Disponible");
}

//Función que se ejecuta cuando se completa la carga
function alCompletar(evento:Event):void {
	addChild(loaderImagen);
	addChild(loaderSWF);
	addChild(loaderImagen2);
	addChild(loaderSWF2);
	trace("Archivos Cargados:",archivosACargar);
	//Cada vez que se complete la carga de un archivo externo se le aumentara 1 al valor de archivosACargar
	archivosACargar += 1;
	trace("Carga Completa :)");
}

//Función que se ejecuta cuando hay un error de entrada/salida, por ejemplo, al intentar cargar un archivo inexistente
function siHayError(evento:IOErrorEvent):void {
	txtPrecarga.text = "¡¡¡Error al cargar el contenido :(!!!";
	trace("¡¡¡Error al cargar el contenido :(!!!");

}

//Función que se ejecuta en todo momento para evaluar si ya se terminaron de cargar todos los archivos externos, cuando se han terminado de cargar remueve los objetos de la precarga
function seTerminaronArchivos(evento:Event):void{
	if(archivosACargar == totalArchivos){
		removeChild(txtPrecarga);
		removeChild(barra);
		removeChild(marco);
		root.removeEventListener(Event.ENTER_FRAME,seTerminaronArchivos);
		trace("Archivos Cargados:",archivosACargar);
	}
}

//eventos
root.addEventListener(Event.ENTER_FRAME,seTerminaronArchivos);

//estados iniciales

//formato para el texto
formatoTexto.color = 0xFF6600;
formatoTexto.size = 30;
formatoTexto.align = "center";
formatoTexto.font = "Century Gothic";

//caja de texto
txtPrecarga.width = 500;
txtPrecarga.x = (stage.stageWidth-txtPrecarga.width)/2;
txtPrecarga.y = (stage.stageHeight-txtPrecarga.height)/2;
txtPrecarga.defaultTextFormat = formatoTexto;

//barra
barra.graphics.beginFill(0xFF6600);
barra.graphics.drawRoundRect(0,0,500,20,20,20);
barra.graphics.endFill();

//marco de la barra
marco.graphics.lineStyle(5,0x212121);
marco.graphics.drawRoundRect(0,0,500,20,20,20);

barra.x = marco.x = (stage.stageWidth - marco.width) / 2;
//El +10 es para que no se encime con el texto de la precarga
barra.y = marco.y = ((stage.stageHeight - marco.height) / 2) + 10;

addChild(txtPrecarga);
addChild(barra);
addChild(marco);

loaderImagen.load(urlImagen);
agregarListeners(loaderImagen.contentLoaderInfo);

loaderSWF.load(urlSWF);
agregarListeners(loaderSWF.contentLoaderInfo);

loaderImagen2.load(urlImagen2);
agregarListeners(loaderImagen2.contentLoaderInfo);

loaderSWF2.load(urlSWF2);
agregarListeners(loaderSWF2.contentLoaderInfo);