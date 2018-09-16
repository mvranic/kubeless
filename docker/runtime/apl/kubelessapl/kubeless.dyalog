kubeless;empty;getenv;modename;_getenv;folder;aplfile;fnname;timeout;port;lx;server;nr
⍝ Init APL runtime using JSON server.

⍝ Todo: Integration with prometius.

 ⎕←'Start with kubeless'

 empty←0∊⍴
 _getenv←{2 ⎕NQ'.' 'GetEnvironment'⍵}

 folder←'/aplcode'
 ⎕←'Folder with apl code:' folder
 modename←_getenv'MOD_NAME'
 ⎕←'MOD_NAME:'modename
⍝ Todo: This should be changed. 
 aplfile←'/kubeless/',modename,'.dyalog'
 
 folder ⎕NCOPY aplfile 
⍝ nr←⎕NGET aplfile
⍝ 'aplcode'⎕FX nr
 fnname←_getenv'FUNC_HANDLER'
 ⎕←'FUNC_HANDLER:'fnname
 port←_getenv'FUNC_PORT'
 timeout←_getenv'FUNC_TIMEOUT'

 :If ∨/lx←empty¨empty port
    (lx/empty port)←'8080' '180'
 :EndIf

 port timeout←⍎¨port timeout
 
 ⎕←'Making HandlerWrapper:'
 nr←'res←HandlerWrapper arg'  '⍝ Handler wrapper (note from JSON server is not send context).'   ('⎕←''Start handler wrapper for "',fnname,'".''')   ('res←(⍎''',fnname,''')arg')   ('⎕←''Stop handler wrapper for "',fnname,'".''' )
 ⎕←'nr:'
 ⎕←nr
 (⊂nr)⎕NPUT folder,'/HandlerWrapper.dyalog'
 ⍝⎕←nr
⍝ fn←'aplcode'⎕FX nr
⍝ ⎕←'Handler "',fn,'" is ready.'

 ⎕CY'/JSONServer/Distribution/JSONServer.dws'

 server←⎕NEW #.JSONServer
 server.Port←port
 server.Timeout←timeout
 server.CodeLocation←folder
 server.Threaded←0
 server.AllowHttpGet←1
 server.Logging←1
 server.Handler←'HandlerWrapper'
 server.HtmlInterface←0

 ⎕←'server.Port' server.Port
 ⎕←'server.Timeout' server.Timeout
 ⎕←'server.CodeLocation' server.CodeLocation
 ⎕←'server.Threaded' server.Threaded
 ⎕←'server.AllowHttpGet' server.AllowHttpGet
 ⎕←'server.Logging' server.Logging
 ⎕←'server.Handler' server.Handler
 ⎕←'server.HtmlInterface' server.HtmlInterface

 ⎕←'Starting server'

 server.Start
 
⍝ ⎕OFF

 ⎕←'Stoped server'
