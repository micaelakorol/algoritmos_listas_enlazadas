//Un salon de eventos necesita un programa para administrar la información de las reservas de diciembre.
//Se dispone de una estructura con la informacion de las reservas. De cada reserva se conoce: nro de 
// reserva, DNI del cliente, dia del evento (1..31), hora inicio, hora fin , categoria del servicio (1..4).
// Además, se dispone de una tabla con el precio por hora de acuerdo a cada categoria del servicio.

// Se pide: 
// a. Generar una nueva estructura con nro y precio total de cada reserva. Debe generarse ordenada por
// nro de reserva. 
// b. Informar los dos dias del mes con mayor cantidad de reservas de clientes con dni par.
// c. Informa porcentaje de reservas que inicien antes de las 12hs y se produzcan en la 1° quincena.


program ejercicioParcial;

type 

vector = array[1..4] of real; // tabla con precio por hora de las 4 categorias.
vectorMax = array[1..31] of integer; // v contador. inciso b.
reserva = record 
nro:integer
dni:integer
dia:1..31;
inicio:integer
fin:integer
categoria: 1..4

lista = ^nodo;

nodo = record 
dato:reserva
sig:lista

//nueva lista:

nuevaReserva = record 
nro:integer
precioTotal:real

nuevaLista = ^nodoNuevo;

nodoNuevo = record 
dato:nuevaReserva
sig:nuevaLista

//inciso a.
procedure generarLista(var l2:nuevaLista; l:lista; v:vector)
var 
r:nuevaReserva;
cantHoras:integer;
precioTotal:real;
begin
 while(l <> nil) do
 begin
  cantHoras := l^.dato.fin - l^.dato.inicio; 
  precioTotal := v[l^.dato.categoria] * cantHoras; // v[l^.dato.categoria] accede al precio en la pos del vector.
  // Asignamos sus valores para insertar el nodo en la lista:
  r.nro := l^.dato.nro;
  r.precioTotal := precioTotal;
  insertarOrdenado(r,l2);
  l := l^.sig; 
 end;  
end;

procedure insertarOrdenado(r:nuevaReserva; var l2:nuevaLista)
var 
 ant,act,nuevo:nuevaLista;
begin 
 new(nuevo); nuevo^.dato := r; ant:= l2; act:= l2;
  while( act <> nil) and (r.nro > nro)do 
  begin
   ant := act; 
   act :=  act^.sig;
  end
  if(ant = act) then 
   l2 := nuevo;
   else 
    ant^.sig := nuevo;
    nuevo^.sig := act;
end;
 
 // inciso b y c.
procedure recorrerLista(l:lista; var vMax:vectorMax; reservas:integer; totalR:integer)
begin
 while(l <> nil)do 
 begin 
  if(esPar(l^.dato.dni))then
  begin
   v[l^.dato.dia] := v[l^.dato.dia] + 1;
  end;
  if(l^.dato.inicio < 12)and(l^.dato.dia <= 15)then 
  begin
    reservas := reservas + 1;
  end
  totalR := totalR + 1; 
  l := l^.sig; 
 end;
end;

// calculo inciso c.
function porcentajeReservas(reservas:integer; totalR:integer):real
begin
 porcentajeReservas := reservas / totalR * 100; 
end;

// retorna true si el dni es par:
function esPar(dni: integer): boolean;
var 
  dig: integer;
begin
  esPar := true; 
  while (dni <> 0) do
  begin
    dig := dni mod 10;
    if (dig mod 2 <> 0) then
    begin
      esPar := false; 
    end;
    dni := dni div 10; 
  end;
end;

// calculo de dos máximos de clientes con dni par: (inciso b)
procedure calcularMaximos(vMax: vectorMax);
var 
  i: integer;
  max1, max2: integer;
  dia1, dia2: integer;
begin 
  max1 := -999;  
  max2 := -999; 
  for i := 1 to 31 do 
  begin
    if (vMax[i] > max1) then
    begin
      max2 := max1;  
      dia2 := dia1;    
      max1 := vMax[i]; // Act el valor
      dia1 := i;  // Act la posición (día)
    end
    // Si no es mayor que max1 pero sí mayor que max2, solo actualizamos max2 y dia2
    else if (vMax[i] > max2) then
    begin
      max2 := vMax[i]; 
      dia2 := i; 
    end;
  end;
  writeln('El máximo 1 es ', max1, ' en el día ', dia1);
  writeln('El máximo 2 es ', max2, ' en el día ', dia2);
end;

var
l:lista; 
l2:nuevaLista;
l:=nil;
v:vector;
vMax:vectorMax;
reservas, totalR:integer;
porcentaje:real;
begin 
reservas := 0;
totalR := 0;
inicializarVector(vMax); // Se dispone 
armarLista(l); // se dispone (leer y agregar a la lista).
generarLista(l,l2,v);
recorrerLista(l,vMax,reservas, totalR);
porcentajeReservas(reservas, totalR);
porcentaje := porcentajeReservas;
write('Porcentaje inciso c:', porcentaje);
calcularMaximos(vMax);
end.