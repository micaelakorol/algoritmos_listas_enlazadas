// Buscar un valor en la lista. Retornar V si existe, F si no existe.
Program busqueda_lista_desordenada

Type list =  ^dato;

dato = record
elemento:integer;
siguiente: list;

procedure agregarAdelante(var pI:list; num:integer)
var 
 nuevo:list
 begin
  new(nuevo); nuevo^.dato := num; nuevo^.sig := nil;
  if (pI = nil) then
  begin
   pI := nuevo;
  end
  else
   begin
    nuevo^.sig := pI;
    pI := nuevo; 
   end
 end

 function buscar(pI:list, valor:integer):boolean
 var 
  encontrado:boolean;
 begin
  encontrado := false;
  while(pI <> nil) and (encontrado = false)
  begin
    if(pI^.elemento = valor) then
      encontrado := true;
    else 
      pI := pI^.sig;
  end
  buscar := encontrado
 end

var
 pI:list;
 num:integer;
 valor:integer;
begin
 num := 10;
 valor := 4;
 pI:= nil;
 agregarAdelante(pI,num);
 write(buscar(pI, valor));
end.