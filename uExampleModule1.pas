unit uExampleModule1;
interface

uses SysUtils, Classes,
     uSXML,
     uPluginInterface, uPluginUtils;

const
  Alias   = 'Zagruzka';
  Version = '1.0.0';

type

  TExample = class(_TInterfacedObject,
                     IModule,
                     IMathProcess)

  private

   er:Pointer;
   err:Pointer;
     Str:string;
    V : string;
  public
    function  Zap:PInteger; stdcall;
    function Init(AXML: PAnsiChar): Cardinal; stdcall;
    function Specification: PAnsiChar; stdcall;
    function ProcessBuffer(AInPtr: Pointer; AInLen: Cardinal; AOutPtr: Pointer; AOutLen: Cardinal): Cardinal; stdcall;

  end;

implementation

{ TExample }


function TExample.Specification: PAnsiChar;
 var T:String;
begin

  T:='<?xml version="1.0" encoding="UTF-8"?>'#$D#$A+
  '<module>'#$D#$A+
  '  <name value="'+Alias+'"/>'#$D#$A+
  '  <version value="'+Version+'"/>'#$D#$A+
  ' <configuration/>'#$D#$A+
  ' '+V+''#$D#$A+

  '</module>';
  Str:=T;
   Result := PAnsiChar(Str);
end;

     function TExample.Zap:PInteger;

begin




end;

         type
 PMyArray =^TMyArray;
 TMyArray = packed record
   Count : Integer;
   value: array[0..10000] of integer;
 end;

function TExample.Init(AXML: PAnsiChar): Cardinal;
  var c:PMyArray; N:Integer; Stream:TFileStream; S:String;  //Xml:TSXMLNodeMsg;
begin

  with TSXMLNodeMsg.Create(AXML) do try
   if Name='configuration' then begin
   Stream:=TFileStream.Create('C:\15.txt',fmOpenReadWrite or fmShareDenyNone);
       try
        SetLength(s,Stream.Size);
        Stream.Read(s[1],Length(s));
  finally
    Stream.Free;
  end;
  V:=s;
  Result:=S_OK;
  end;
  finally
 Free;
 end;
 with TSXMLNodeMsg.Create(AXML) do try
    if Name='init' then begin
    er:=FieldPointerByName(This,'TMyArr','',nil);
    c:=pointer(er);
    Stream:=TFileStream.Create('C:\14.txt',fmOpenReadWrite or fmShareDenyNone);
    c.Count:=Stream.Seek(0,SoFromEnd);
    Stream.Position:=0;
    for n:=0 to c.Count do
    begin
     stream.read(c.value[n],1);
    end;


     Result:=S_OK;
  end;
  finally
 Free;
 end;
end;



function TExample.ProcessBuffer(AInPtr: Pointer; AInLen: Cardinal; AOutPtr: Pointer; AOutLen: Cardinal): Cardinal;
begin
 end;
//if not Assigned(FVarA) then Exit;
//if not Assigned(FVarB) then Exit;
//if not Assigned(FVarC) then Exit;
 //FVarC^:=12345;

 // Result:=S_OK;
//end;


end.


