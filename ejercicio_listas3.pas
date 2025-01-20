/*
 La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
 al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
 (cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
 rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
 Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
 ingresar la sonda llamada “GAIA”, que debe procesarse.
 Una vez finalizada la lectura, informar:
 a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
 b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
 c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
 d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
 Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible
*/

program ejercicio3;

type 

vector = array[1..7] of integer;

lista = ^nodo;

sonda = record 
nombre:string;
duracion:integer;
costo:integer;
mantenimiento:integer;
rango:integer;

nodo = record 
dato:sonda;
sig:lista; 

procedure leerSonda(var s:sonda)
var 
 i:integer;
 begin
   read(s.nombre);
   read(s.duracion);
   read(s.costo);
   read(s.mantenimiento);
   read(s.rango); // rango en el que realizará el estudio. [1..7];
 end;

 procedure agregarAdelante(var l:lista, s:sonda)
 var
  nuevoNodo:lista; 
 begin 
  new(nuevoNodo); nuevoNodo^.dato := sonda; nuevo^.sig := nil;
  if (l = nil) then 
  begin
   l := nuevoNodo; 
  end;
  else 
  begin
   nuevoNodo^.sig := l;
   l := nuevoNodo;
  end;
 end;

procedure generarLista(var l:lista)
var 
 s:sonda;
begin
 leerSonda(s);
 repeat 
  agregarAdelante(l,s); 
  until(s.nombre = "GAIA") // Finaliza si el nombre es GAIA.
end;

procedure procesarLista(l:lista; var v:vector;var accDuracion:integer; var cantSondas:integer; var costo:integer)
var 
 nombre:string;
begin 
 max:=-9999;
 accDuracion:=0;
 costo:=0;
 cantSondas:=0;
 while(l <> nil) do 
 begin
   acc:=0;
   acc := l^.dato.costo + l^.dato.mantenimiento;
   if(acc > max) then 
    begin 
     nombre := l^.dato.nombre;
     max := acc; 
    end;
    v[l^.dato.rango] := v[l^.dato.rango] + 1; // Inciso b.
    accDuracion := accDuracion + l^.dato.duracion;
    costo := costo + l^.dato.costo;
    cantSondas := cantSondas + 1;
   l := l^.sig; // Avanzar en la lista.
 end
 write('La sonda mas costosa es', nombre);
end

procedure inicializarVector(var v:vector)
var 
 i:integer;
 begin
  for i := 1 to 7 do 
  begin
   v[i] := 0;
  end  
 end 

procedure recorrerVector(v:vector)
var 
 i:integer;
 begin
  for i := 1 to 7 do 
  begin
   write('Cantidad de sondas:', v[i]); 
  end 
 end
 

function duracionPromedio(accDuracion:integer; cantSondas:integer):real
begin 
 duracionPromedio := accDuracion / cantSondas; 
end

function costoPromedio(costo:integer; cantSondas:integer):real 
begin
 costoPromedio := costo / cantSondas; 
end

procedure recorrerLista(l:lista; promedioDur:integer; promedioCos:integer)
var 
 superaPromedioDur:integer;
 nombre:string;
begin 
superaPromedioDur:=0;
 while( l <> nil) do 
 begin
   if(l^.dato.duracion > promedioDur) then 
    begin  
      superaPromedioDur := superaPromedioDur + 1;
    end 
    if(l^.dato.costo > promedioCos)then 
     begin
      write(l^.dato.nombre); // informa el nombre de la sonda que supera el promedio de costo de const. 
     end 
   l:= l^.dato; // avanza en la lista.
 end
end

var 
v:vector;
l:lista;
accDuracion,cantSondas,costo:integer;
promedioDur, promedioCos:real;
begin 
l:=nil;
inicializarVector(v);
generarLista(l);
procesarLista(l,v,accDuracion,cantSondas,costo);
promedioDur := duracionPromedio(accDuracion,cantSondas); // promedio total de la duracion de las sondas
promedioCos:= costoPromedio(costo,cantSondas);
recorrerLista(l,promedioDur,promedioCos);
recorrerVector(v); // Muestra los datos del inciso b.
end.