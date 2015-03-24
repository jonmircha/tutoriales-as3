package  {

	//librerias
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.events.IEventDispatcher;
	import flash.display.Stage;
	import flashx.textLayout.formats.BackgroundColor;
	
	//Propiedades del escenario
	[SWF(width=1000,height=625,backgroundColor=0xCCCCCC,frameRate=30)]
	
	//Clase Pública
	public class PrecargaMultipleConClase extends MovieClip {
		
		//Variables privadas de la clase
		private var loaderImagen:Loader = new Loader();
		private var loaderSWF:Loader = new Loader();
		private var loaderImagen2:Loader = new Loader();
		private var loaderSWF2:Loader = new Loader();
		private var urlImagen:URLRequest = new URLRequest("archivos/waste.jpg");
		private var urlSWF:URLRequest = new URLRequest("archivos/rompecabezas.swf");
		private var urlImagen2:URLRequest = new URLRequest("archivos/gatito.jpg");
		private var urlSWF2:URLRequest = new URLRequest("archivos/ojos.swf");
		private var txtPrecarga:TextField = new TextField();
		private var formatoTexto:TextFormat = new TextFormat();
		private var marco:Shape = new Shape();
		private var barra:Shape = new Shape();
		private var archivosACargar:int = 0;
		private var totalArchivos:int = 4;
		
		//Constructor de la Clase, debe tener el mismo nombre de la clase y es la unica función que es pública e inicializa a la clase
		public function PrecargaMultipleConClase():void {
			
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
		}
		
		//Función que añade los listeners a los objetos de tipo loader
		private function agregarListeners(queLoader:IEventDispatcher):void {
			queLoader.addEventListener(Event.OPEN,alComenzar);
			queLoader.addEventListener(ProgressEvent.PROGRESS,enProgreso);
			queLoader.addEventListener(Event.INIT,alEstarDisponible);
			queLoader.addEventListener(Event.COMPLETE,alCompletar);
			queLoader.addEventListener(IOErrorEvent.IO_ERROR,siHayError);
		}

		//Función que se ejecuta cuando comienza la operación de carga
		private function alComenzar(evento:Event):void {
			txtPrecarga.text = "Iniciando la Carga...";
			trace("Iniciando la Carga...");
		}

		//Función que se ejecuta en todo momento mientras dura la carga
		private function enProgreso(evento:ProgressEvent):void {
			var bytesCargados:Number = evento.bytesLoaded;
			var bytesTotales:Number = evento.bytesTotal;
			var porcentaje:Number = (bytesCargados/bytesTotales)*100;
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
		private function alEstarDisponible(evento:Event):void {
			txtPrecarga.text = "";
			loaderImagen.scaleX = loaderImagen.scaleY = 0.5;
			loaderImagen.x = (stage.stageWidth-loaderImagen.width)/2;
			loaderImagen.y = (stage.stageHeight-loaderImagen.height)/2;
			loaderSWF.scaleX = loaderSWF.scaleY = 0.5;
			loaderSWF.x = (stage.stageWidth-loaderSWF.width)/2;
			loaderSWF.y = (stage.stageHeight-loaderSWF.height)/2;
			loaderImagen2.scaleX = loaderImagen2.scaleY = loaderImagen.alpha = 0.5;
			loaderImagen2.x = 50;
			loaderImagen2.y = 350;
			loaderSWF2.scaleX = loaderSWF2.scaleY = 0.5;
			loaderSWF2.x = loaderSWF2.y = 500;
			
			trace("Carga Disponible");
		}
		
		//Función que se ejecuta cuando se completa la carga
		private function alCompletar(evento:Event):void {
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
		private function siHayError(evento:IOErrorEvent):void {
			txtPrecarga.text = "¡¡¡Error al cargar el contenido :(!!!";
			trace("¡¡¡Error al cargar el contenido :(!!!");
		}
		
		//Función que se ejecuta en todo momento para evaluar si ya se terminaron de cargar todos los archivos externos, cuando se han terminado de cargar remueve los objetos de la precarga
		private function seTerminaronArchivos(evento:Event):void{
			if(archivosACargar == totalArchivos){
				removeChild(txtPrecarga);
				removeChild(barra);
				removeChild(marco);
				root.removeEventListener(Event.ENTER_FRAME,seTerminaronArchivos);
				
				trace("Archivos Cargados:",archivosACargar);
			}
		}
		
	}//cierra public class
	
}//cierra package