unit uExampleModule3;
interface

uses SysUtils, Classes,
     uSXML,
     uPluginInterface, uPluginUtils;

const
  Alias   = 'Osnovnoy';
  Version = '1.0.0';

type

  TExample = class(_TInterfacedObject,
                     IModule,
                     IMathProcess,
                     IModule_use_Model)

  private
    m:IModel;
  zagrr:Pointer;
  er:Pointer;
  public

    function Init(AXML: PAnsiChar): Cardinal; stdcall;
    function Specification: PAnsiChar; stdcall;
    function ProcessBuffer(AInPtr: Pointer; AInLen: Cardinal; AOutPtr: Pointer; AOutLen: Cardinal): Cardinal; stdcall;
    function SetModel(AModel: IModel): HRESULT; stdcall;

  end;

implementation

uses uExampleModule1;

{ TExample }

function TExample.Specification: PAnsiChar;
begin
  Result :=
  '<?xml version="1.0" encoding="UTF-8"?>'#$D#$A+
  '<module>'#$D#$A+
  '  <name value="'+Alias+'"/>'#$D#$A+
  '  <version value="'+Version+'"/>'#$D#$A+
  '<input><T><count type=S32 /><vi type=S32 /></T></input>'#$D#$A+
  '</module>';
end;
 type
 PMyArray =^TMyArray;
 TMyArray = packed record
   Count : integer;
   Value : array[0..1000000] of Integer;
 end;
    type
P = ^PT;
Pt = packed record
first : integer;
second : integer;
end;
function TExample.Init(AXML: PAnsiChar): Cardinal;
var  N:Integer; x:PMyArray; Zagr:P; R:Integer;
begin
  with TSXMLNodeMsg.Create(AXML) do try
    if Name='init' then begin
       zagrr:=FieldPointerByName(This,'T','',nil);
      er:=FieldPointerByName(This,'TMyArr','',nil);
      x:=pointer(er);
      zagr:=pointer(zagrr);
  if x.count = 0 then begin
   FmtLog(m,'Модуль "Zagruzka" не подключен',[]);
   end
   else begin

   FmtLog(m,'Модуль "Zagruzka" подключен',[]);


  //FmtLog(m,'%s (Info) Count=%d',[Alias, x.Count]);
  for N:=0 to x.count do begin
     zagr.first:=zagr.first+x.value[N];
     zagr.second:=zagr.first+x.count;

     end;
     end;



   { r:=TFileStream.Create('C:\13.txt',fmOpenReadWrite or fmShareDenyNone);
      for N:=0 to x.count do begin
      r.Write(x.value[n],1);
      end;}

         //    with TFileStream.Create('C:\13.txt',fmOpenRead or fmShareDenyNone) do try
        //SetLength(s,Size);
        //Write(s[1],Size);


        end;
  finally
    Free;
  end;
  Result:=S_OK;
end;




function TExample.ProcessBuffer(AInPtr: Pointer; AInLen: Cardinal; AOutPtr: Pointer; AOutLen: Cardinal): Cardinal;
begin

end;

function TExample.SetModel(AModel: IModel): HRESULT;
begin
  m:=AModel;
end;

end.

