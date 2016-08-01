unit FBfunc;

interface

uses winhttp_TLB,dialogs,StdCtrls;

var
 winhttp : IWinhttpRequest;
 li,mts,lsd,fbdtsg : String;
 myCode,myTimelineURL,myName : String;

Function FBLogin(Const ID,PW : String):Boolean;
Function CutStr(Const Main,First,Second:String):String;
Function FBWriteMe(Const Content : String; Const PrivacyType : Byte):Boolean;
Procedure RefreshData(var LB : TListBox);
implementation

Function FBLogin(Const ID,PW : String):Boolean;
begin
 result := False;
 winhttp := coWinhttpRequest.Create;
 winhttp.Open('GET','https://m.facebook.com/',False);
 winhttp.Send('');

 li := Cutstr(winhttp.ResponseText,'li" value="','"');
 mts := Cutstr(winhttp.ResponseText,'m_ts" value="','"');
 lsd := Cutstr(winhttp.ResponseText,'lsd" value="','"');

 winhttp.Open('POST','https://m.facebook.com/login.php?refsrc=https%3A%2F%2Fm.facebook.com%2F&lwv=100&refid=8',False);
 winhttp.SetRequestHeader('Referer','https://m.facebook.com/');
 winhttp.SetRequestHeader('User-Agent','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0');
 winhttp.SetRequestHeader('Content-Type','application/x-www-form-urlencoded');
 winhttp.Send('lsd=' + lsd + '&charset_test=%E2%82%AC%2C%C2%B4%2C%E2%82%AC%2C%C2%B4%2C%E6%B0%B4%2C%D0%94%2C%D0%84&version=1'
  + '&ajax=0&width=0&pxr=0&gps=0&dimensions=0&m_ts=' + mts + '&li=' + li + '&email=' + ID + '&pass=' + PW + '&login=%EB%A1%9C%EA%B7%B8%EC%9D%B8');

 if POS('https://m.facebook.com/home.php',winhttp.Option[WinhttpRequestOption_URL]) <> 0 then begin
  winhttp.Open('GET',winhttp.Option[WinhttpRequestOption_URL],False);
  winhttp.Send('');
  myCode := CutStr(winhttp.ResponseText,'/composer/mbasic/?av=','&');
  myTimelineURL := 'https://m.facebook.com' + CutStr(Cutstr(winhttp.ResponseText,'홈','프로필'),'href="','">');
  winhttp.Open('GET',myTimelineURL,False);
  winhttp.Send('');
  fbdtsg := Cutstr(winhttp.ResponseText,'fb_dtsg" value="','"');
  myName := Cutstr(winhttp.ResponseText,'<title>','</title>');
  Result := True;
 end;
end;

Function CutStr(Const Main,First,Second:String):String;
var
tmpstr : String;
begin
tmpstr := Main;
tmpstr := Copy(tmpstr,POS(First,tmpstr)+length(First),length(tmpstr));
Result := Copy(tmpstr,1,POS(Second,tmpstr)-1);
end;

Function FBWriteMe(Const Content : String; Const PrivacyType : Byte):Boolean;
var
PT : String;
begin
 Result := False;
 Case PrivacyType of
  1: PT := '300645083384735';
  2: PT := '291667064279714';
  3: PT := '286958161406148';
 end;

 winhttp.Open('POST','https://m.facebook.com/composer/mbasic/?av=' + myCode + '&refid=17',False);
 winhttp.SetRequestHeader('User-Agent','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0');
 winhttp.SetRequestHeader('Content-Type','application/x-www-form-urlencoded');
 winhttp.Send('fb_dtsg=' + fbdtsg + '&charset_test=%E2%82%AC%2C%C2%B4%2C%E2%82%AC%2C%C2%B4%2C%E6%B0%B4%2C%D0%94%2C%D0%84' +
  '&privacyx=' + PT + '&r2a=1&xhpc_timeline=1&target=' + myCode + '&c_src=timeline_self&cwevent=composer_entry&referrer=timeline&ctype=inline&cver=amber&rst_icv='+
  '&xc_message=' + Content + '&view_post=%EA%B2%8C%EC%8B%9C%ED%95%98%EA%B8%B0');

 Result := True;
end;

Procedure RefreshData(var LB : TListBox);
begin

end;

end.
