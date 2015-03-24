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
import flash.display.MovieClip;

//variables
var txtPrecarga:TextField = new TextField();
var formatoTexto:TextFormat = new TextFormat();
var marco:Shape = new Shape();
var barra:Shape = new Shape();

var fondoBtn:Fondo = new Fondo();
var gatitoBtn:Gatito = new Gatito();
var ojosBtn:Ojos = new Ojos();
var rompecabezasBtn:Rompecabezas = new Rompecabezas();
//Este MC se necesita para cargar el contenido dinamico en su nivel
var mcVacio:MovieClip = new MovieClip();
var nivel:int;

//funciones
function cargarContenido(archivoACargar:String):void{
	
	var loaderACargar:Loader = new Loader();
	var urlACargar:URLRequest= new URLRequest(archivoACargar);
	
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
		loaderACargar.scaleX = 0.5;
		loaderACargar.scaleY = 0.5;
		loaderACargar.x=(stage.stageWidth-loaderACargar.width)/2;
		loaderACargar.y=(stage.stageHeight-loaderACargar.height)/2;
		trace("Carga Disponible");
	}
	
	//Función que se ejecuta cuando se completa la carga
	function alCompletar(evento:Event):void {
		removeChild(txtPrecarga);
		removeChild(barra);
		removeChild(marco);
		
		addChildAt(loaderACargar,nivel);
		trace("Carga Completa :)");
	}
	
	loaderACargar.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,enProgreso);
	loaderACargar.contentLoaderInfo.addEventListener(Event.INIT,alEstarDisponible);
	loaderACargar.contentLoaderInfo.addEventListener(Event.COMPLETE,alCompletar);
	
	loaderACargar.load(urlACargar);
	addChild(txtPrecarga);
	addChild(barra);
	addChild(marco);

}

function intercambiarContenido(evento:MouseEvent):void{
	removeChildAt(nivel);
	if(evento.target==fondoBtn){
		cargarContenido("archivos/waste.jpg");
	}else if(evento.target==gatitoBtn){
		cargarContenido("archivos/gatito.jpg");
	}else if(evento.target==ojosBtn){
		cargarContenido("archivos/ojos.swf");
	}else if(evento.target==rompecabezasBtn){
		cargarContenido("archivos/rompecabezas.swf");
	}
}

//eventos
fondoBtn.addEventListener(MouseEvent.CLICK,intercambiarContenido);
gatitoBtn.addEventListener(MouseEvent.CLICK,intercambiarContenido);
ojosBtn.addEventListener(MouseEvent.CLICK,intercambiarContenido);
rompecabezasBtn.addEventListener(MouseEvent.CLICK,intercambiarContenido);

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


//asignacion múltiple
fondoBtn.scaleX = gatitoBtn.scaleX = ojosBtn.scaleX = rompecabezasBtn.scaleX = fondoBtn.scaleY = gatitoBtn.scaleY = ojosBtn.scaleY = rompecabezasBtn.scaleY = .5;

//asignacion de valores relativos que se autoajustan
fondoBtn.x = 0;
gatitoBtn.x = fondoBtn.x + fondoBtn.width + 20;
ojosBtn.x = gatitoBtn.x + gatitoBtn.width + 20;
rompecabezasBtn.x = ojosBtn.x + ojosBtn.width + 20;

addChild(fondoBtn);
addChild(gatitoBtn);
addChild(ojosBtn);
addChild(rompecabezasBtn);
//Como mcVacio es el último objeto a agregar en el escenario, el contenido externo dinámico a cargar lo reemplazara en su nivel.
addChild(mcVacio);

nivel = numChildren-1;