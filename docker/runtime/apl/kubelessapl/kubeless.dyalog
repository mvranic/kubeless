 kubeless;empty;getenv;modename;_getenv;folder;aplfile;fnname;timeout;port;lx;server
⍝ Init APL runtime using JSON server.

⍝ Todo: Integration with prometius.

 empty←0∊⍴
 _getenv←{2 ⎕NQ'.' 'GetEnvironment'⍵}

 modename←_getenv'MOD_NAME'
 folder←'/aplcode'
 aplfile←'/kubeless/',modename,'.dyalog'
 folder ⎕NCOPY aplfile
 fnname←_getenv'FUNC_HANDLER'
 port←_getenv'FUNC_PORT'
 timeout←_getenv'FUNC_TIMEOUT'

 :If ∨/lx←empty¨empty port
    (lx/empty port)←'8080' '180'
 :EndIf

 port timeout←⍎¨port timeout
  
⎕CY'/JSONServer/Distribution/JSONServer.dws'

 server←⎕NEW #.JSONServer
 server.Port←port
 server.Timeout←timeout
 server.CodeLocation←folder
 server.Threaded←0
 server.AllowHttpGet←1
 server.Loging←1

 server.Start

 ⎕OFF