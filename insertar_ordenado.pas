/*
Se recibe dni, nombre y altura de un equipo de jugadores de basquet. Dicha información debe 
quedar ordenada por altura de manera ascendente. La lectura finaliza cuando se recibe un dni = 0 que no
debe procesarse.
*/

program insertar_ordenado;

type 

lista = ^nodo; 

jugador = record 
dni:integer;
nombre:string;
altura:real;

nodo = record 
dato:jugador;
sig:lista;

procedure leerJugador(j:jugador)
begin
 read(j.dni);
 if(j.dni <> 0) then 
  read(j.nombre);
  read(j.altura);
end;

procedure cargarLista(var l:lista)
var 
 j:jugador;
begin
 leerJugador(j);
 while(j.dni <> 0 ) do 
 begin
  insertarOrdenado(l,j);
  leerJugador(j); 
 end  
end;

procedure insertarOrdenado(var l:lista; j:jugador)
var 
 act,ant:lista;
 nuevo:lista;
begin 
 new(nuevo); nuevo^.dato := j; ant := l; act:= l;
 // Se recorre la lista mientras que la lista no esté vacía
 // Y j.altura sea mayor que la altura del nodo actual 
  while( act <> nil ) and (j.altura > act^.dato.altura)do  
  begin
   ant := act;
   act := act^.sig; 
  end
  if( act = ant) then 
   l :=  nuevo; // Inserta al inicio o lista vacía.
   else 
    ant^.sig := nuevo;  // Al medio o al final.
    nuevo^.sig := act;
end;


var 
l:lista;
begin 
l:=nil;
cargarLista(l);
end.