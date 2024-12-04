Program recorrer_lista

Type list =  ^dato;

dato = record
elemento:integer;
siguiente: list;

procedure agregarNodo(var pI:list; num:integer)
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

procedure recorrerLista(pI:list)
begin
  while(pI <> nil)
  begin
    write(pI^.elemento);
    pI := pI^.sig;
  end
end


var
 pI:list;
 num:integer;
begin
 num := 10;
 pI:= nil;
 agregarNodo(pI,num);
 recorrerLista(pI)
end.