//librerias
import flash.display.Loader;
import flash.net.URLRequest;

//variables
var loaderImagen:Loader = new Loader();
var imagen:URLRequest = new URLRequest("archivos/gatito.jpg");

var loaderSWF:Loader = new Loader();
var swf:URLRequest = new URLRequest("archivos/ojos.swf");

//funciones

//eventos

//estados iniciales

//para la imagen
loaderImagen.load(imagen);
//múltiple asignación
loaderImagen.x = loaderImagen.y = 5;
loaderImagen.alpha = .5;
loaderImagen.rotationX=45;
loaderImagen.scaleX=1.5;
addChild(loaderImagen);

//para el swf
loaderSWF.load(swf);
loaderSWF.x = (stage.stageWidth-loaderSWF.width)/2;
loaderSWF.y = (stage.stageHeight-loaderSWF.height)/2;
loaderSWF.alpha = .95;
addChild(loaderSWF);

//Como no accedimos a sus propiedades al estar disponibles por eso es que no muestra los tamaños reales de los archivos a cargar.
trace(loaderSWF.width,loaderSWF.x,loaderSWF.y);
trace(loaderImagen.width);