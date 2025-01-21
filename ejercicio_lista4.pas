/* Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
 todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android
 instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB).
 La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese
 la información disponible de todos los dispositivos e informe:
 a. La cantidad de dispositivos para cada versión de Android.
 b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
 c. El tamaño promedio de las pantallas de todos los dispositivos.
 */
/*Aplico corte de control con listas.*/
 program ejercicio4;

 type 

 lista = ^nodo;

 dispositivo = record 
 android:real;
 pantalla:real;
 ram:integer;

 nodo = record 
 dato:dispositivo;
 sig:lista;


 procedure generarLista(var l:lista) // Se dispone
 procedure leerProducto(p:producto) // Se dispone

 procedure procesarLista(l:lista; var sumaProm:real; var totalDisp:integer)
 var 
  cantA:integer; // inciso a.
  cantB:integer; // inciso b.
 begin 
  cantB := 0;
  while(l <> nil) do
  begin
   act := l^.dato.android;
   cantA := 0;
   while(l <> nil) and (l^.dato.android = act)do
   begin
    cantA := cantA + 1; // Acumula la cant. de android de la misma versión.
   if(l^.dato.ram > 3) and (l^.dato.pantalla < 5) then 
    begin
      cantB := cantB + 1;  
    end 
     sumaProm := sumaProm + l^.dato.pantalla; // Acumulo la suma de pantallas.
     totalDisp := totalDisp + 1;    // Acumula el total de dispositivos.
     l := l^.sig; // Avanza
   end;
   // En este punto, salio porque cambió la versión android:
   writeln('Hay ', cantA, ' dispositivos con la versión de Android ', act);
  end;
  writeln('Cantidad de disp. con + 3 GB y pantalla de a lo sumo 5 pulg.', cantB);
 end;

 function promedioPantallas(sumaProm:real;totalDisp:integer):real;
 begin
    if(totalDisp > 0)then
    promedioPantallas := sumaProm / totalDisp;
 end;


 var
 l:lista;
 sumaProm:real;
 totalDisp:integer;
 promedio:real;
 begin 
 l := nil;
 sumaProm := 0;
 totalDisp := 0;
 generarLista(l);
 procesarLista(l,sumaProm,totalDisp);
 promedio := promedioPantallas(sumaProm,totalDisp);
 writeln('El tamaño promedio de pantallas es de: ', promedio);
 end.