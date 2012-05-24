var ObjectiveJ={};
(function(_1,_2){
if(!this.JSON){
JSON={};
}
(function(){
function f(n){
return n<10?"0"+n:n;
};
if(typeof Date.prototype.toJSON!=="function"){
Date.prototype.toJSON=function(_3){
return this.getUTCFullYear()+"-"+f(this.getUTCMonth()+1)+"-"+f(this.getUTCDate())+"T"+f(this.getUTCHours())+":"+f(this.getUTCMinutes())+":"+f(this.getUTCSeconds())+"Z";
};
String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(_4){
return this.valueOf();
};
}
var cx=new RegExp("[\\u0000\\u00ad\\u0600-\\u0604\\u070f\\u17b4\\u17b5\\u200c-\\u200f\\u2028-\\u202f\\u2060-\\u206f\\ufeff\\ufff0-\\uffff]","g");
var _5=new RegExp("[\\\\\\\"\\x00-\\x1f\\x7f-\\x9f\\u00ad\\u0600-\\u0604\\u070f\\u17b4\\u17b5\\u200c-\\u200f\\u2028-\\u202f\\u2060-\\u206f\\ufeff\\ufff0-\\uffff]","g");
var _6,_7,_8={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r","\"":"\\\"","\\":"\\\\"},_9;
function _a(_b){
_5.lastIndex=0;
return _5.test(_b)?"\""+_b.replace(_5,function(a){
var c=_8[a];
return typeof c==="string"?c:"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4);
})+"\"":"\""+_b+"\"";
};
function _c(_d,_e){
var i,k,v,_f,_10=_6,_11,_12=_e[_d];
if(_12&&typeof _12==="object"&&typeof _12.toJSON==="function"){
_12=_12.toJSON(_d);
}
if(typeof _9==="function"){
_12=_9.call(_e,_d,_12);
}
switch(typeof _12){
case "string":
return _a(_12);
case "number":
return isFinite(_12)?String(_12):"null";
case "boolean":
case "null":
return String(_12);
case "object":
if(!_12){
return "null";
}
_6+=_7;
_11=[];
if(Object.prototype.toString.apply(_12)==="[object Array]"){
_f=_12.length;
for(i=0;i<_f;i+=1){
_11[i]=_c(i,_12)||"null";
}
v=_11.length===0?"[]":_6?"[\n"+_6+_11.join(",\n"+_6)+"\n"+_10+"]":"["+_11.join(",")+"]";
_6=_10;
return v;
}
if(_9&&typeof _9==="object"){
_f=_9.length;
for(i=0;i<_f;i+=1){
k=_9[i];
if(typeof k==="string"){
v=_c(k,_12);
if(v){
_11.push(_a(k)+(_6?": ":":")+v);
}
}
}
}else{
for(k in _12){
if(Object.hasOwnProperty.call(_12,k)){
v=_c(k,_12);
if(v){
_11.push(_a(k)+(_6?": ":":")+v);
}
}
}
}
v=_11.length===0?"{}":_6?"{\n"+_6+_11.join(",\n"+_6)+"\n"+_10+"}":"{"+_11.join(",")+"}";
_6=_10;
return v;
}
};
if(typeof JSON.stringify!=="function"){
JSON.stringify=function(_13,_14,_15){
var i;
_6="";
_7="";
if(typeof _15==="number"){
for(i=0;i<_15;i+=1){
_7+=" ";
}
}else{
if(typeof _15==="string"){
_7=_15;
}
}
_9=_14;
if(_14&&typeof _14!=="function"&&(typeof _14!=="object"||typeof _14.length!=="number")){
throw new Error("JSON.stringify");
}
return _c("",{"":_13});
};
}
if(typeof JSON.parse!=="function"){
JSON.parse=function(_16,_17){
var j;
function _18(_19,key){
var k,v,_1a=_19[key];
if(_1a&&typeof _1a==="object"){
for(k in _1a){
if(Object.hasOwnProperty.call(_1a,k)){
v=_18(_1a,k);
if(v!==_29){
_1a[k]=v;
}else{
delete _1a[k];
}
}
}
}
return _17.call(_19,key,_1a);
};
cx.lastIndex=0;
if(cx.test(_16)){
_16=_16.replace(cx,function(a){
return "\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4);
});
}
if(/^[\],:{}\s]*$/.test(_16.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,""))){
j=eval("("+_16+")");
return typeof _17==="function"?_18({"":j},""):j;
}
throw new SyntaxError("JSON.parse");
};
}
}());
var _1b=new RegExp("([^%]+|%(?:\\d+\\$)?[\\+\\-\\ \\#0]*[0-9\\*]*(.[0-9\\*]+)?[hlL]?[cbBdieEfgGosuxXpn%@])","g");
var _1c=new RegExp("(%)(?:(\\d+)\\$)?([\\+\\-\\ \\#0]*)([0-9\\*]*)((?:.[0-9\\*]+)?)([hlL]?)([cbBdieEfgGosuxXpn%@])");
_2.sprintf=function(_1d){
var _1d=arguments[0],_1e=_1d.match(_1b),_1f=0,_20="",arg=1;
for(var i=0;i<_1e.length;i++){
var t=_1e[i];
if(_1d.substring(_1f,_1f+t.length)!=t){
return _20;
}
_1f+=t.length;
if(t.charAt(0)!=="%"){
_20+=t;
}else{
if(t==="%%"){
_20+="%";
}else{
var _21=t.match(_1c);
if(_21.length!=8||_21[0]!=t){
return _20;
}
var _22=_21[1],_23=_21[2],_24=_21[3],_25=_21[4],_26=_21[5],_27=_21[6],_28=_21[7];
if(_23===_29||_23===null||_23===""){
_23=arg++;
}else{
_23=Number(_23);
}
var _2a=null;
if(_25=="*"){
_2a=arguments[_23];
}else{
if(_25!=""){
_2a=Number(_25);
}
}
var _2b=null;
if(_26==".*"){
_2b=arguments[_23];
}else{
if(_26!=""){
_2b=Number(_26.substring(1));
}
}
var _2c=(_24.indexOf("-")>=0);
var _2d=(_24.indexOf("0")>=0);
var _2e="";
if(RegExp("[bBdiufeExXo]").test(_28)){
var num=Number(arguments[_23]);
var _2f="";
if(num<0){
_2f="-";
}else{
if(_24.indexOf("+")>=0){
_2f="+";
}else{
if(_24.indexOf(" ")>=0){
_2f=" ";
}
}
}
if(_28=="d"||_28=="i"||_28=="u"){
var _30=String(Math.abs(Math.floor(num)));
_2e=_31(_2f,"",_30,"",_2a,_2c,_2d);
}
if(_28=="f"){
var _30=String((_2b!=null)?Math.abs(num).toFixed(_2b):Math.abs(num));
var _32=(_24.indexOf("#")>=0&&_30.indexOf(".")<0)?".":"";
_2e=_31(_2f,"",_30,_32,_2a,_2c,_2d);
}
if(_28=="e"||_28=="E"){
var _30=String(Math.abs(num).toExponential(_2b!=null?_2b:21));
var _32=(_24.indexOf("#")>=0&&_30.indexOf(".")<0)?".":"";
_2e=_31(_2f,"",_30,_32,_2a,_2c,_2d);
}
if(_28=="x"||_28=="X"){
var _30=String(Math.abs(num).toString(16));
var _33=(_24.indexOf("#")>=0&&num!=0)?"0x":"";
_2e=_31(_2f,_33,_30,"",_2a,_2c,_2d);
}
if(_28=="b"||_28=="B"){
var _30=String(Math.abs(num).toString(2));
var _33=(_24.indexOf("#")>=0&&num!=0)?"0b":"";
_2e=_31(_2f,_33,_30,"",_2a,_2c,_2d);
}
if(_28=="o"){
var _30=String(Math.abs(num).toString(8));
var _33=(_24.indexOf("#")>=0&&num!=0)?"0":"";
_2e=_31(_2f,_33,_30,"",_2a,_2c,_2d);
}
if(RegExp("[A-Z]").test(_28)){
_2e=_2e.toUpperCase();
}else{
_2e=_2e.toLowerCase();
}
}else{
var _2e="";
if(_28=="%"){
_2e="%";
}else{
if(_28=="c"){
_2e=String(arguments[_23]).charAt(0);
}else{
if(_28=="s"||_28=="@"){
_2e=String(arguments[_23]);
}else{
if(_28=="p"||_28=="n"){
_2e="";
}
}
}
}
_2e=_31("","",_2e,"",_2a,_2c,false);
}
_20+=_2e;
}
}
}
return _20;
};
function _31(_34,_35,_36,_37,_38,_39,_3a){
var _3b=(_34.length+_35.length+_36.length+_37.length);
if(_39){
return _34+_35+_36+_37+pad(_38-_3b," ");
}else{
if(_3a){
return _34+_35+pad(_38-_3b,"0")+_36+_37;
}else{
return pad(_38-_3b," ")+_34+_35+_36+_37;
}
}
};
function pad(n,ch){
return Array(MAX(0,n)+1).join(ch);
};
CPLogDisable=false;
var _3c="Cappuccino";
var _3d=["fatal","error","warn","info","debug","trace"];
var _3e=_3d[3];
var _3f={};
for(var i=0;i<_3d.length;i++){
_3f[_3d[i]]=i;
}
var _40={};
CPLogRegister=function(_41,_42,_43){
CPLogRegisterRange(_41,_3d[0],_42||_3d[_3d.length-1],_43);
};
CPLogRegisterRange=function(_44,_45,_46,_47){
var min=_3f[_45];
var max=_3f[_46];
if(min!==_29&&max!==_29&&min<=max){
for(var i=min;i<=max;i++){
CPLogRegisterSingle(_44,_3d[i],_47);
}
}
};
CPLogRegisterSingle=function(_48,_49,_4a){
if(!_40[_49]){
_40[_49]=[];
}
for(var i=0;i<_40[_49].length;i++){
if(_40[_49][i][0]===_48){
_40[_49][i][1]=_4a;
return;
}
}
_40[_49].push([_48,_4a]);
};
CPLogUnregister=function(_4b){
for(var _4c in _40){
for(var i=0;i<_40[_4c].length;i++){
if(_40[_4c][i][0]===_4b){
_40[_4c].splice(i--,1);
}
}
}
};
function _4d(_4e,_4f,_50){
if(_50==_29){
_50=_3c;
}
if(_4f==_29){
_4f=_3e;
}
var _51=(typeof _4e[0]=="string"&&_4e.length>1)?_2.sprintf.apply(null,_4e):String(_4e[0]);
if(_40[_4f]){
for(var i=0;i<_40[_4f].length;i++){
var _52=_40[_4f][i];
_52[0](_51,_4f,_50,_52[1]);
}
}
};
CPLog=function(){
_4d(arguments);
};
for(var i=0;i<_3d.length;i++){
CPLog[_3d[i]]=(function(_53){
return function(){
_4d(arguments,_53);
};
})(_3d[i]);
}
var _54=function(_55,_56,_57){
var now=new Date(),_58;
if(_56===null){
_56="";
}else{
_56=_56||"info";
_56="["+CPLogColorize(_56,_56)+"]";
}
_57=_57||"";
if(_57&&_56){
_57+=" ";
}
_58=_57+_56;
if(_58){
_58+=": ";
}
if(typeof _2.sprintf=="function"){
return _2.sprintf("%4d-%02d-%02d %02d:%02d:%02d.%03d %s%s",now.getFullYear(),now.getMonth()+1,now.getDate(),now.getHours(),now.getMinutes(),now.getSeconds(),now.getMilliseconds(),_58,_55);
}else{
return now+" "+_58+": "+_55;
}
};
CPLogConsole=function(_59,_5a,_5b,_5c){
if(typeof console!="undefined"){
var _5d=(_5c||_54)(_59,_5a,_5b),_5e={"fatal":"error","error":"error","warn":"warn","info":"info","debug":"debug","trace":"debug"}[_5a];
if(_5e&&console[_5e]){
console[_5e](_5d);
}else{
if(console.log){
console.log(_5d);
}
}
}
};
CPLogColorize=function(_5f,_60){
return _5f;
};
CPLogAlert=function(_61,_62,_63,_64){
if(typeof alert!="undefined"&&!CPLogDisable){
var _65=(_64||_54)(_61,_62,_63);
CPLogDisable=!confirm(_65+"\n\n(Click cancel to stop log alerts)");
}
};
var _66=null;
CPLogPopup=function(_67,_68,_69,_6a){
try{
if(CPLogDisable||window.open==_29){
return;
}
if(!_66||!_66.document){
_66=window.open("","_blank","width=600,height=400,status=no,resizable=yes,scrollbars=yes");
if(!_66){
CPLogDisable=!confirm(_67+"\n\n(Disable pop-up blocking for CPLog window; Click cancel to stop log alerts)");
return;
}
_6b(_66);
}
var _6c=_66.document.createElement("div");
_6c.setAttribute("class",_68||"fatal");
var _6d=(_6a||_54)(_67,_6a?_68:null,_69);
_6c.appendChild(_66.document.createTextNode(_6d));
_66.log.appendChild(_6c);
if(_66.focusEnabled.checked){
_66.focus();
}
if(_66.blockEnabled.checked){
_66.blockEnabled.checked=_66.confirm(_6d+"\nContinue blocking?");
}
if(_66.scrollEnabled.checked){
_66.scrollToBottom();
}
}
catch(e){
}
};
var _6e="<style type=\"text/css\" media=\"screen\"> body{font:10px Monaco,Courier,\"Courier New\",monospace,mono;padding-top:15px;} div > .fatal,div > .error,div > .warn,div > .info,div > .debug,div > .trace{display:none;overflow:hidden;white-space:pre;padding:0px 5px 0px 5px;margin-top:2px;-moz-border-radius:5px;-webkit-border-radius:5px;} div[wrap=\"yes\"] > div{white-space:normal;} .fatal{background-color:#ffb2b3;} .error{background-color:#ffe2b2;} .warn{background-color:#fdffb2;} .info{background-color:#e4ffb2;} .debug{background-color:#a0e5a0;} .trace{background-color:#99b9ff;} .enfatal .fatal,.enerror .error,.enwarn .warn,.eninfo .info,.endebug .debug,.entrace .trace{display:block;} div#header{background-color:rgba(240,240,240,0.82);position:fixed;top:0px;left:0px;width:100%;border-bottom:1px solid rgba(0,0,0,0.33);text-align:center;} ul#enablers{display:inline-block;margin:1px 15px 0 15px;padding:2px 0 2px 0;} ul#enablers li{display:inline;padding:0px 5px 0px 5px;margin-left:4px;-moz-border-radius:5px;-webkit-border-radius:5px;} [enabled=\"no\"]{opacity:0.25;} ul#options{display:inline-block;margin:0 15px 0px 15px;padding:0 0px;} ul#options li{margin:0 0 0 0;padding:0 0 0 0;display:inline;} </style>";
function _6b(_6f){
var doc=_6f.document;
doc.writeln("<html><head><title></title>"+_6e+"</head><body></body></html>");
doc.title=_3c+" Run Log";
var _70=doc.getElementsByTagName("head")[0];
var _71=doc.getElementsByTagName("body")[0];
var _72=window.location.protocol+"//"+window.location.host+window.location.pathname;
_72=_72.substring(0,_72.lastIndexOf("/")+1);
var div=doc.createElement("div");
div.setAttribute("id","header");
_71.appendChild(div);
var ul=doc.createElement("ul");
ul.setAttribute("id","enablers");
div.appendChild(ul);
for(var i=0;i<_3d.length;i++){
var li=doc.createElement("li");
li.setAttribute("id","en"+_3d[i]);
li.setAttribute("class",_3d[i]);
li.setAttribute("onclick","toggle(this);");
li.setAttribute("enabled","yes");
li.appendChild(doc.createTextNode(_3d[i]));
ul.appendChild(li);
}
var ul=doc.createElement("ul");
ul.setAttribute("id","options");
div.appendChild(ul);
var _73={"focus":["Focus",false],"block":["Block",false],"wrap":["Wrap",false],"scroll":["Scroll",true],"close":["Close",true]};
for(o in _73){
var li=doc.createElement("li");
ul.appendChild(li);
_6f[o+"Enabled"]=doc.createElement("input");
_6f[o+"Enabled"].setAttribute("id",o);
_6f[o+"Enabled"].setAttribute("type","checkbox");
if(_73[o][1]){
_6f[o+"Enabled"].setAttribute("checked","checked");
}
li.appendChild(_6f[o+"Enabled"]);
var _74=doc.createElement("label");
_74.setAttribute("for",o);
_74.appendChild(doc.createTextNode(_73[o][0]));
li.appendChild(_74);
}
_6f.log=doc.createElement("div");
_6f.log.setAttribute("class","enerror endebug enwarn eninfo enfatal entrace");
_71.appendChild(_6f.log);
_6f.toggle=function(_75){
var _76=(_75.getAttribute("enabled")=="yes")?"no":"yes";
_75.setAttribute("enabled",_76);
if(_76=="yes"){
_6f.log.className+=" "+_75.id;
}else{
_6f.log.className=_6f.log.className.replace(new RegExp("[\\s]*"+_75.id,"g"),"");
}
};
_6f.scrollToBottom=function(){
_6f.scrollTo(0,_71.offsetHeight);
};
_6f.wrapEnabled.addEventListener("click",function(){
_6f.log.setAttribute("wrap",_6f.wrapEnabled.checked?"yes":"no");
},false);
_6f.addEventListener("keydown",function(e){
var e=e||_6f.event;
if(e.keyCode==75&&(e.ctrlKey||e.metaKey)){
while(_6f.log.firstChild){
_6f.log.removeChild(_6f.log.firstChild);
}
e.preventDefault();
}
},"false");
window.addEventListener("unload",function(){
if(_6f&&_6f.closeEnabled&&_6f.closeEnabled.checked){
CPLogDisable=true;
_6f.close();
}
},false);
_6f.addEventListener("unload",function(){
if(!CPLogDisable){
CPLogDisable=!confirm("Click cancel to stop logging");
}
},false);
};
CPLogDefault=(typeof window==="object"&&window.console)?CPLogConsole:CPLogPopup;
var _29;
if(typeof window!=="undefined"){
window.setNativeTimeout=window.setTimeout;
window.clearNativeTimeout=window.clearTimeout;
window.setNativeInterval=window.setInterval;
window.clearNativeInterval=window.clearInterval;
}
NO=false;
YES=true;
nil=null;
Nil=null;
NULL=null;
ABS=Math.abs;
ASIN=Math.asin;
ACOS=Math.acos;
ATAN=Math.atan;
ATAN2=Math.atan2;
SIN=Math.sin;
COS=Math.cos;
TAN=Math.tan;
EXP=Math.exp;
POW=Math.pow;
CEIL=Math.ceil;
FLOOR=Math.floor;
ROUND=Math.round;
MIN=Math.min;
MAX=Math.max;
RAND=Math.random;
SQRT=Math.sqrt;
E=Math.E;
LN2=Math.LN2;
LN10=Math.LN10;
LOG2E=Math.LOG2E;
LOG10E=Math.LOG10E;
PI=Math.PI;
PI2=Math.PI*2;
PI_2=Math.PI/2;
SQRT1_2=Math.SQRT1_2;
SQRT2=Math.SQRT2;
function _77(_78){
this._eventListenersForEventNames={};
this._owner=_78;
};
_77.prototype.addEventListener=function(_79,_7a){
var _7b=this._eventListenersForEventNames;
if(!_7c.call(_7b,_79)){
var _7d=[];
_7b[_79]=_7d;
}else{
var _7d=_7b[_79];
}
var _7e=_7d.length;
while(_7e--){
if(_7d[_7e]===_7a){
return;
}
}
_7d.push(_7a);
};
_77.prototype.removeEventListener=function(_7f,_80){
var _81=this._eventListenersForEventNames;
if(!_7c.call(_81,_7f)){
return;
}
var _82=_81[_7f],_83=_82.length;
while(_83--){
if(_82[_83]===_80){
return _82.splice(_83,1);
}
}
};
_77.prototype.dispatchEvent=function(_84){
var _85=_84.type,_86=this._eventListenersForEventNames;
if(_7c.call(_86,_85)){
var _87=this._eventListenersForEventNames[_85],_88=0,_89=_87.length;
for(;_88<_89;++_88){
_87[_88](_84);
}
}
var _8a=(this._owner||this)["on"+_85];
if(_8a){
_8a(_84);
}
};
var _8b=0,_8c=null,_8d=[];
function _8e(_8f){
var _90=_8b;
if(_8c===null){
window.setNativeTimeout(function(){
var _91=_8d,_92=0,_93=_8d.length;
++_8b;
_8c=null;
_8d=[];
for(;_92<_93;++_92){
_91[_92]();
}
},0);
}
return function(){
var _94=arguments;
if(_8b>_90){
_8f.apply(this,_94);
}else{
_8d.push(function(){
_8f.apply(this,_94);
});
}
};
};
var _95=null;
if(window.ActiveXObject!==_29){
var _96=["Msxml2.XMLHTTP.3.0","Msxml2.XMLHTTP.6.0"],_97=_96.length;
while(_97--){
try{
var _98=_96[_97];
new ActiveXObject(_98);
_95=function(){
return new ActiveXObject(_98);
};
break;
}
catch(anException){
}
}
}
if(!_95){
_95=window.XMLHttpRequest;
}
CFHTTPRequest=function(){
this._isOpen=false;
this._requestHeaders={};
this._mimeType=null;
this._eventDispatcher=new _77(this);
this._nativeRequest=new _95();
var _99=this;
this._stateChangeHandler=function(){
_ac(_99);
};
this._nativeRequest.onreadystatechange=this._stateChangeHandler;
if(CFHTTPRequest.AuthenticationDelegate!==nil){
this._eventDispatcher.addEventListener("HTTP403",function(){
CFHTTPRequest.AuthenticationDelegate(_99);
});
}
};
CFHTTPRequest.UninitializedState=0;
CFHTTPRequest.LoadingState=1;
CFHTTPRequest.LoadedState=2;
CFHTTPRequest.InteractiveState=3;
CFHTTPRequest.CompleteState=4;
CFHTTPRequest.AuthenticationDelegate=nil;
CFHTTPRequest.prototype.status=function(){
try{
return this._nativeRequest.status||0;
}
catch(anException){
return 0;
}
};
CFHTTPRequest.prototype.statusText=function(){
try{
return this._nativeRequest.statusText||"";
}
catch(anException){
return "";
}
};
CFHTTPRequest.prototype.readyState=function(){
return this._nativeRequest.readyState;
};
CFHTTPRequest.prototype.success=function(){
var _9a=this.status();
if(_9a>=200&&_9a<300){
return YES;
}
return _9a===0&&this.responseText()&&this.responseText().length;
};
CFHTTPRequest.prototype.responseXML=function(){
var _9b=this._nativeRequest.responseXML;
if(_9b&&(_95===window.XMLHttpRequest)){
return _9b;
}
return _9c(this.responseText());
};
CFHTTPRequest.prototype.responsePropertyList=function(){
var _9d=this.responseText();
if(CFPropertyList.sniffedFormatOfString(_9d)===CFPropertyList.FormatXML_v1_0){
return CFPropertyList.propertyListFromXML(this.responseXML());
}
return CFPropertyList.propertyListFromString(_9d);
};
CFHTTPRequest.prototype.responseText=function(){
return this._nativeRequest.responseText;
};
CFHTTPRequest.prototype.setRequestHeader=function(_9e,_9f){
this._requestHeaders[_9e]=_9f;
};
CFHTTPRequest.prototype.getResponseHeader=function(_a0){
return this._nativeRequest.getResponseHeader(_a0);
};
CFHTTPRequest.prototype.getAllResponseHeaders=function(){
return this._nativeRequest.getAllResponseHeaders();
};
CFHTTPRequest.prototype.overrideMimeType=function(_a1){
this._mimeType=_a1;
};
CFHTTPRequest.prototype.open=function(_a2,_a3,_a4,_a5,_a6){
this._isOpen=true;
this._URL=_a3;
this._async=_a4;
this._method=_a2;
this._user=_a5;
this._password=_a6;
return this._nativeRequest.open(_a2,_a3,_a4,_a5,_a6);
};
CFHTTPRequest.prototype.send=function(_a7){
if(!this._isOpen){
delete this._nativeRequest.onreadystatechange;
this._nativeRequest.open(this._method,this._URL,this._async,this._user,this._password);
this._nativeRequest.onreadystatechange=this._stateChangeHandler;
}
for(var i in this._requestHeaders){
if(this._requestHeaders.hasOwnProperty(i)){
this._nativeRequest.setRequestHeader(i,this._requestHeaders[i]);
}
}
if(this._mimeType&&"overrideMimeType" in this._nativeRequest){
this._nativeRequest.overrideMimeType(this._mimeType);
}
this._isOpen=false;
try{
return this._nativeRequest.send(_a7);
}
catch(anException){
this._eventDispatcher.dispatchEvent({type:"failure",request:this});
}
};
CFHTTPRequest.prototype.abort=function(){
this._isOpen=false;
return this._nativeRequest.abort();
};
CFHTTPRequest.prototype.addEventListener=function(_a8,_a9){
this._eventDispatcher.addEventListener(_a8,_a9);
};
CFHTTPRequest.prototype.removeEventListener=function(_aa,_ab){
this._eventDispatcher.removeEventListener(_aa,_ab);
};
function _ac(_ad){
var _ae=_ad._eventDispatcher;
_ae.dispatchEvent({type:"readystatechange",request:_ad});
var _af=_ad._nativeRequest,_b0=["uninitialized","loading","loaded","interactive","complete"];
if(_b0[_ad.readyState()]==="complete"){
var _b1="HTTP"+_ad.status();
_ae.dispatchEvent({type:_b1,request:_ad});
var _b2=_ad.success()?"success":"failure";
_ae.dispatchEvent({type:_b2,request:_ad});
_ae.dispatchEvent({type:_b0[_ad.readyState()],request:_ad});
}else{
_ae.dispatchEvent({type:_b0[_ad.readyState()],request:_ad});
}
};
function _b3(_b4,_b5,_b6){
var _b7=new CFHTTPRequest();
if(_b4.pathExtension()==="plist"){
_b7.overrideMimeType("text/xml");
}
if(_2.asyncLoader){
_b7.onsuccess=_8e(_b5);
_b7.onfailure=_8e(_b6);
}else{
_b7.onsuccess=_b5;
_b7.onfailure=_b6;
}
_b7.open("GET",_b4.absoluteString(),_2.asyncLoader);
_b7.send("");
};
_2.asyncLoader=YES;
_2.Asynchronous=_8e;
_2.determineAndDispatchHTTPRequestEvents=_ac;
var _b8=0;
objj_generateObjectUID=function(){
return _b8++;
};
CFPropertyList=function(){
this._UID=objj_generateObjectUID();
};
CFPropertyList.DTDRE=/^\s*(?:<\?\s*xml\s+version\s*=\s*\"1.0\"[^>]*\?>\s*)?(?:<\!DOCTYPE[^>]*>\s*)?/i;
CFPropertyList.XMLRE=/^\s*(?:<\?\s*xml\s+version\s*=\s*\"1.0\"[^>]*\?>\s*)?(?:<\!DOCTYPE[^>]*>\s*)?<\s*plist[^>]*\>/i;
CFPropertyList.FormatXMLDTD="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">";
CFPropertyList.Format280NorthMagicNumber="280NPLIST";
CFPropertyList.FormatOpenStep=1,CFPropertyList.FormatXML_v1_0=100,CFPropertyList.FormatBinary_v1_0=200,CFPropertyList.Format280North_v1_0=-1000;
CFPropertyList.sniffedFormatOfString=function(_b9){
if(_b9.match(CFPropertyList.XMLRE)){
return CFPropertyList.FormatXML_v1_0;
}
if(_b9.substr(0,CFPropertyList.Format280NorthMagicNumber.length)===CFPropertyList.Format280NorthMagicNumber){
return CFPropertyList.Format280North_v1_0;
}
return NULL;
};
CFPropertyList.dataFromPropertyList=function(_ba,_bb){
var _bc=new CFMutableData();
_bc.setRawString(CFPropertyList.stringFromPropertyList(_ba,_bb));
return _bc;
};
CFPropertyList.stringFromPropertyList=function(_bd,_be){
if(!_be){
_be=CFPropertyList.Format280North_v1_0;
}
var _bf=_c0[_be];
return _bf["start"]()+_c1(_bd,_bf)+_bf["finish"]();
};
function _c1(_c2,_c3){
var _c4=typeof _c2,_c5=_c2.valueOf(),_c6=typeof _c5;
if(_c4!==_c6){
_c4=_c6;
_c2=_c5;
}
if(_c2===YES||_c2===NO){
_c4="boolean";
}else{
if(_c4==="number"){
if(FLOOR(_c2)===_c2&&(""+_c2).indexOf("e")==-1){
_c4="integer";
}else{
_c4="real";
}
}else{
if(_c4!=="string"){
if(_c2.slice){
_c4="array";
}else{
_c4="dictionary";
}
}
}
}
return _c3[_c4](_c2,_c3);
};
var _c0={};
_c0[CFPropertyList.FormatXML_v1_0]={"start":function(){
return CFPropertyList.FormatXMLDTD+"<plist version = \"1.0\">";
},"finish":function(){
return "</plist>";
},"string":function(_c7){
return "<string>"+_c8(_c7)+"</string>";
},"boolean":function(_c9){
return _c9?"<true/>":"<false/>";
},"integer":function(_ca){
return "<integer>"+_ca+"</integer>";
},"real":function(_cb){
return "<real>"+_cb+"</real>";
},"array":function(_cc,_cd){
var _ce=0,_cf=_cc.length,_d0="<array>";
for(;_ce<_cf;++_ce){
_d0+=_c1(_cc[_ce],_cd);
}
return _d0+"</array>";
},"dictionary":function(_d1,_d2){
var _d3=_d1._keys,_97=0,_d4=_d3.length,_d5="<dict>";
for(;_97<_d4;++_97){
var key=_d3[_97];
_d5+="<key>"+key+"</key>";
_d5+=_c1(_d1.valueForKey(key),_d2);
}
return _d5+"</dict>";
}};
var _d6="A",_d7="D",_d8="f",_d9="d",_da="S",_db="T",_dc="F",_dd="K",_de="E";
_c0[CFPropertyList.Format280North_v1_0]={"start":function(){
return CFPropertyList.Format280NorthMagicNumber+";1.0;";
},"finish":function(){
return "";
},"string":function(_df){
return _da+";"+_df.length+";"+_df;
},"boolean":function(_e0){
return (_e0?_db:_dc)+";";
},"integer":function(_e1){
var _e2=""+_e1;
return _d9+";"+_e2.length+";"+_e2;
},"real":function(_e3){
var _e4=""+_e3;
return _d8+";"+_e4.length+";"+_e4;
},"array":function(_e5,_e6){
var _e7=0,_e8=_e5.length,_e9=_d6+";";
for(;_e7<_e8;++_e7){
_e9+=_c1(_e5[_e7],_e6);
}
return _e9+_de+";";
},"dictionary":function(_ea,_eb){
var _ec=_ea._keys,_97=0,_ed=_ec.length,_ee=_d7+";";
for(;_97<_ed;++_97){
var key=_ec[_97];
_ee+=_dd+";"+key.length+";"+key;
_ee+=_c1(_ea.valueForKey(key),_eb);
}
return _ee+_de+";";
}};
var _ef="xml",_f0="#document",_f1="plist",_f2="key",_f3="dict",_f4="array",_f5="string",_f6="date",_f7="true",_f8="false",_f9="real",_fa="integer",_fb="data";
var _fc=function(_fd){
var _fe="",_97=0,_ff=_fd.length;
for(;_97<_ff;++_97){
var node=_fd[_97];
if(node.nodeType===3||node.nodeType===4){
_fe+=node.nodeValue;
}else{
if(node.nodeType!==8){
_fe+=_fc(node.childNodes);
}
}
}
return _fe;
};
var _100=function(_101,_102,_103){
var node=_101;
node=(node.firstChild);
if(node!==NULL&&((node.nodeType)===8||(node.nodeType)===3)){
while((node=(node.nextSibling))&&((node.nodeType)===8||(node.nodeType)===3)){
}
}
if(node){
return node;
}
if((String(_101.nodeName))===_f4||(String(_101.nodeName))===_f3){
_103.pop();
}else{
if(node===_102){
return NULL;
}
node=_101;
while((node=(node.nextSibling))&&((node.nodeType)===8||(node.nodeType)===3)){
}
if(node){
return node;
}
}
node=_101;
while(node){
var next=node;
while((next=(next.nextSibling))&&((next.nodeType)===8||(next.nodeType)===3)){
}
if(next){
return next;
}
var node=(node.parentNode);
if(_102&&node===_102){
return NULL;
}
_103.pop();
}
return NULL;
};
CFPropertyList.propertyListFromData=function(_104,_105){
return CFPropertyList.propertyListFromString(_104.rawString(),_105);
};
CFPropertyList.propertyListFromString=function(_106,_107){
if(!_107){
_107=CFPropertyList.sniffedFormatOfString(_106);
}
if(_107===CFPropertyList.FormatXML_v1_0){
return CFPropertyList.propertyListFromXML(_106);
}
if(_107===CFPropertyList.Format280North_v1_0){
return _108(_106);
}
return NULL;
};
var _d6="A",_d7="D",_d8="f",_d9="d",_da="S",_db="T",_dc="F",_dd="K",_de="E";
function _108(_109){
var _10a=new _10b(_109),_10c=NULL,key="",_10d=NULL,_10e=NULL,_10f=[],_110=NULL;
while(_10c=_10a.getMarker()){
if(_10c===_de){
_10f.pop();
continue;
}
var _111=_10f.length;
if(_111){
_110=_10f[_111-1];
}
if(_10c===_dd){
key=_10a.getString();
_10c=_10a.getMarker();
}
switch(_10c){
case _d6:
_10d=[];
_10f.push(_10d);
break;
case _d7:
_10d=new CFMutableDictionary();
_10f.push(_10d);
break;
case _d8:
_10d=parseFloat(_10a.getString());
break;
case _d9:
_10d=parseInt(_10a.getString(),10);
break;
case _da:
_10d=_10a.getString();
break;
case _db:
_10d=YES;
break;
case _dc:
_10d=NO;
break;
default:
throw new Error("*** "+_10c+" marker not recognized in Plist.");
}
if(!_10e){
_10e=_10d;
}else{
if(_110){
if(_110.slice){
_110.push(_10d);
}else{
_110.setValueForKey(key,_10d);
}
}
}
}
return _10e;
};
function _c8(_112){
return _112.replace(/&/g,"&amp;").replace(/"/g,"&quot;").replace(/'/g,"&apos;").replace(/</g,"&lt;").replace(/>/g,"&gt;");
};
function _113(_114){
return _114.replace(/&quot;/g,"\"").replace(/&apos;/g,"'").replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&amp;/g,"&");
};
function _9c(_115){
if(window.DOMParser){
return (new window.DOMParser().parseFromString(_115,"text/xml").documentElement);
}else{
if(window.ActiveXObject){
XMLNode=new ActiveXObject("Microsoft.XMLDOM");
var _116=_115.match(CFPropertyList.DTDRE);
if(_116){
_115=_115.substr(_116[0].length);
}
XMLNode.loadXML(_115);
return XMLNode;
}
}
return NULL;
};
CFPropertyList.propertyListFromXML=function(_117){
var _118=_117;
if(_117.valueOf&&typeof _117.valueOf()==="string"){
_118=_9c(_117);
}
while(((String(_118.nodeName))===_f0)||((String(_118.nodeName))===_ef)){
_118=(_118.firstChild);
}
if(_118!==NULL&&((_118.nodeType)===8||(_118.nodeType)===3)){
while((_118=(_118.nextSibling))&&((_118.nodeType)===8||(_118.nodeType)===3)){
}
}
if(((_118.nodeType)===10)){
while((_118=(_118.nextSibling))&&((_118.nodeType)===8||(_118.nodeType)===3)){
}
}
if(!((String(_118.nodeName))===_f1)){
return NULL;
}
var key="",_119=NULL,_11a=NULL,_11b=_118,_11c=[],_11d=NULL;
while(_118=_100(_118,_11b,_11c)){
var _11e=_11c.length;
if(_11e){
_11d=_11c[_11e-1];
}
if((String(_118.nodeName))===_f2){
key=(_118.textContent||(_118.textContent!==""&&_fc([_118])));
while((_118=(_118.nextSibling))&&((_118.nodeType)===8||(_118.nodeType)===3)){
}
}
switch(String((String(_118.nodeName)))){
case _f4:
_119=[];
_11c.push(_119);
break;
case _f3:
_119=new CFMutableDictionary();
_11c.push(_119);
break;
case _f9:
_119=parseFloat((_118.textContent||(_118.textContent!==""&&_fc([_118]))));
break;
case _fa:
_119=parseInt((_118.textContent||(_118.textContent!==""&&_fc([_118]))),10);
break;
case _f5:
if((_118.getAttribute("type")==="base64")){
_119=(_118.firstChild)?CFData.decodeBase64ToString((_118.textContent||(_118.textContent!==""&&_fc([_118])))):"";
}else{
_119=_113((_118.firstChild)?(_118.textContent||(_118.textContent!==""&&_fc([_118]))):"");
}
break;
case _f6:
var _11f=Date.parseISO8601((_118.textContent||(_118.textContent!==""&&_fc([_118]))));
_119=isNaN(_11f)?new Date():new Date(_11f);
break;
case _f7:
_119=YES;
break;
case _f8:
_119=NO;
break;
case _fb:
_119=new CFMutableData();
var _120=(_118.firstChild)?CFData.decodeBase64ToArray((_118.textContent||(_118.textContent!==""&&_fc([_118]))),YES):[];
_119.setBytes(_120);
break;
default:
throw new Error("*** "+(String(_118.nodeName))+" tag not recognized in Plist.");
}
if(!_11a){
_11a=_119;
}else{
if(_11d){
if(_11d.slice){
_11d.push(_119);
}else{
_11d.setValueForKey(key,_119);
}
}
}
}
return _11a;
};
kCFPropertyListOpenStepFormat=CFPropertyList.FormatOpenStep;
kCFPropertyListXMLFormat_v1_0=CFPropertyList.FormatXML_v1_0;
kCFPropertyListBinaryFormat_v1_0=CFPropertyList.FormatBinary_v1_0;
kCFPropertyList280NorthFormat_v1_0=CFPropertyList.Format280North_v1_0;
CFPropertyListCreate=function(){
return new CFPropertyList();
};
CFPropertyListCreateFromXMLData=function(data){
return CFPropertyList.propertyListFromData(data,CFPropertyList.FormatXML_v1_0);
};
CFPropertyListCreateXMLData=function(_121){
return CFPropertyList.dataFromPropertyList(_121,CFPropertyList.FormatXML_v1_0);
};
CFPropertyListCreateFrom280NorthData=function(data){
return CFPropertyList.propertyListFromData(data,CFPropertyList.Format280North_v1_0);
};
CFPropertyListCreate280NorthData=function(_122){
return CFPropertyList.dataFromPropertyList(_122,CFPropertyList.Format280North_v1_0);
};
CPPropertyListCreateFromData=function(data,_123){
return CFPropertyList.propertyListFromData(data,_123);
};
CPPropertyListCreateData=function(_124,_125){
return CFPropertyList.dataFromPropertyList(_124,_125);
};
CFDictionary=function(_126){
this._keys=[];
this._count=0;
this._buckets={};
this._UID=objj_generateObjectUID();
};
var _127=Array.prototype.indexOf,_7c=Object.prototype.hasOwnProperty;
CFDictionary.prototype.copy=function(){
return this;
};
CFDictionary.prototype.mutableCopy=function(){
var _128=new CFMutableDictionary(),keys=this._keys,_129=this._count;
_128._keys=keys.slice();
_128._count=_129;
var _12a=0,_12b=this._buckets,_12c=_128._buckets;
for(;_12a<_129;++_12a){
var key=keys[_12a];
_12c[key]=_12b[key];
}
return _128;
};
CFDictionary.prototype.containsKey=function(aKey){
return _7c.apply(this._buckets,[aKey]);
};
CFDictionary.prototype.containsValue=function(_12d){
var keys=this._keys,_12e=this._buckets,_97=0,_12f=keys.length;
for(;_97<_12f;++_97){
if(_12e[keys[_97]]===_12d){
return YES;
}
}
return NO;
};
CFDictionary.prototype.count=function(){
return this._count;
};
CFDictionary.prototype.countOfKey=function(aKey){
return this.containsKey(aKey)?1:0;
};
CFDictionary.prototype.countOfValue=function(_130){
var keys=this._keys,_131=this._buckets,_97=0,_132=keys.length,_133=0;
for(;_97<_132;++_97){
if(_131[keys[_97]]===_130){
++_133;
}
}
return _133;
};
CFDictionary.prototype.keys=function(){
return this._keys.slice();
};
CFDictionary.prototype.valueForKey=function(aKey){
var _134=this._buckets;
if(!_7c.apply(_134,[aKey])){
return nil;
}
return _134[aKey];
};
CFDictionary.prototype.toString=function(){
var _135="{\n",keys=this._keys,_97=0,_136=this._count;
for(;_97<_136;++_97){
var key=keys[_97];
_135+="\t"+key+" = \""+String(this.valueForKey(key)).split("\n").join("\n\t")+"\"\n";
}
return _135+"}";
};
CFMutableDictionary=function(_137){
CFDictionary.apply(this,[]);
};
CFMutableDictionary.prototype=new CFDictionary();
CFMutableDictionary.prototype.copy=function(){
return this.mutableCopy();
};
CFMutableDictionary.prototype.addValueForKey=function(aKey,_138){
if(this.containsKey(aKey)){
return;
}
++this._count;
this._keys.push(aKey);
this._buckets[aKey]=_138;
};
CFMutableDictionary.prototype.removeValueForKey=function(aKey){
var _139=-1;
if(_127){
_139=_127.call(this._keys,aKey);
}else{
var keys=this._keys,_97=0,_13a=keys.length;
for(;_97<_13a;++_97){
if(keys[_97]===aKey){
_139=_97;
break;
}
}
}
if(_139===-1){
return;
}
--this._count;
this._keys.splice(_139,1);
delete this._buckets[aKey];
};
CFMutableDictionary.prototype.removeAllValues=function(){
this._count=0;
this._keys=[];
this._buckets={};
};
CFMutableDictionary.prototype.replaceValueForKey=function(aKey,_13b){
if(!this.containsKey(aKey)){
return;
}
this._buckets[aKey]=_13b;
};
CFMutableDictionary.prototype.setValueForKey=function(aKey,_13c){
if(_13c===nil||_13c===_29){
this.removeValueForKey(aKey);
}else{
if(this.containsKey(aKey)){
this.replaceValueForKey(aKey,_13c);
}else{
this.addValueForKey(aKey,_13c);
}
}
};
CFData=function(){
this._rawString=NULL;
this._propertyList=NULL;
this._propertyListFormat=NULL;
this._JSONObject=NULL;
this._bytes=NULL;
this._base64=NULL;
};
CFData.prototype.propertyList=function(){
if(!this._propertyList){
this._propertyList=CFPropertyList.propertyListFromString(this.rawString());
}
return this._propertyList;
};
CFData.prototype.JSONObject=function(){
if(!this._JSONObject){
try{
this._JSONObject=JSON.parse(this.rawString());
}
catch(anException){
}
}
return this._JSONObject;
};
CFData.prototype.rawString=function(){
if(this._rawString===NULL){
if(this._propertyList){
this._rawString=CFPropertyList.stringFromPropertyList(this._propertyList,this._propertyListFormat);
}else{
if(this._JSONObject){
this._rawString=JSON.stringify(this._JSONObject);
}else{
throw new Error("Can't convert data to string.");
}
}
}
return this._rawString;
};
CFData.prototype.bytes=function(){
return this._bytes;
};
CFData.prototype.base64=function(){
return this._base64;
};
CFMutableData=function(){
CFData.call(this);
};
CFMutableData.prototype=new CFData();
function _13d(_13e){
this._rawString=NULL;
this._propertyList=NULL;
this._propertyListFormat=NULL;
this._JSONObject=NULL;
this._bytes=NULL;
this._base64=NULL;
};
CFMutableData.prototype.setPropertyList=function(_13f,_140){
_13d(this);
this._propertyList=_13f;
this._propertyListFormat=_140;
};
CFMutableData.prototype.setJSONObject=function(_141){
_13d(this);
this._JSONObject=_141;
};
CFMutableData.prototype.setRawString=function(_142){
_13d(this);
this._rawString=_142;
};
CFMutableData.prototype.setBytes=function(_143){
_13d(this);
this._bytes=_143;
};
CFMutableData.prototype.setBase64String=function(_144){
_13d(this);
this._base64=_144;
};
var _145=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/","="],_146=[];
for(var i=0;i<_145.length;i++){
_146[_145[i].charCodeAt(0)]=i;
}
CFData.decodeBase64ToArray=function(_147,_148){
if(_148){
_147=_147.replace(/[^A-Za-z0-9\+\/\=]/g,"");
}
var pad=(_147[_147.length-1]=="="?1:0)+(_147[_147.length-2]=="="?1:0),_149=_147.length,_14a=[];
var i=0;
while(i<_149){
var bits=(_146[_147.charCodeAt(i++)]<<18)|(_146[_147.charCodeAt(i++)]<<12)|(_146[_147.charCodeAt(i++)]<<6)|(_146[_147.charCodeAt(i++)]);
_14a.push((bits&16711680)>>16);
_14a.push((bits&65280)>>8);
_14a.push(bits&255);
}
if(pad>0){
return _14a.slice(0,-1*pad);
}
return _14a;
};
CFData.encodeBase64Array=function(_14b){
var pad=(3-(_14b.length%3))%3,_14c=_14b.length+pad,_14d=[];
if(pad>0){
_14b.push(0);
}
if(pad>1){
_14b.push(0);
}
var i=0;
while(i<_14c){
var bits=(_14b[i++]<<16)|(_14b[i++]<<8)|(_14b[i++]);
_14d.push(_145[(bits&16515072)>>18]);
_14d.push(_145[(bits&258048)>>12]);
_14d.push(_145[(bits&4032)>>6]);
_14d.push(_145[bits&63]);
}
if(pad>0){
_14d[_14d.length-1]="=";
_14b.pop();
}
if(pad>1){
_14d[_14d.length-2]="=";
_14b.pop();
}
return _14d.join("");
};
CFData.decodeBase64ToString=function(_14e,_14f){
return CFData.bytesToString(CFData.decodeBase64ToArray(_14e,_14f));
};
CFData.decodeBase64ToUtf16String=function(_150,_151){
return CFData.bytesToUtf16String(CFData.decodeBase64ToArray(_150,_151));
};
CFData.bytesToString=function(_152){
return String.fromCharCode.apply(NULL,_152);
};
CFData.encodeBase64String=function(_153){
var temp=[];
for(var i=0;i<_153.length;i++){
temp.push(_153.charCodeAt(i));
}
return CFData.encodeBase64Array(temp);
};
CFData.bytesToUtf16String=function(_154){
var temp=[];
for(var i=0;i<_154.length;i+=2){
temp.push(_154[i+1]<<8|_154[i]);
}
return String.fromCharCode.apply(NULL,temp);
};
CFData.encodeBase64Utf16String=function(_155){
var temp=[];
for(var i=0;i<_155.length;i++){
var c=_155.charCodeAt(i);
temp.push(_155.charCodeAt(i)&255);
temp.push((_155.charCodeAt(i)&65280)>>8);
}
return CFData.encodeBase64Array(temp);
};
var _156,_157,_158=0;
function _159(){
if(++_158!==1){
return;
}
_156={};
_157={};
};
function _15a(){
_158=MAX(_158-1,0);
if(_158!==0){
return;
}
delete _156;
delete _157;
};
var _15b=new RegExp("^"+"(?:"+"([^:/?#]+):"+")?"+"(?:"+"(//)"+"("+"(?:"+"("+"([^:@]*)"+":?"+"([^:@]*)"+")?"+"@"+")?"+"([^:/?#]*)"+"(?::(\\d*))?"+")"+")?"+"([^?#]*)"+"(?:\\?([^#]*))?"+"(?:#(.*))?");
var _15c=["url","scheme","authorityRoot","authority","userInfo","user","password","domain","portNumber","path","queryString","fragment"];
function _15d(aURL){
if(aURL._parts){
return aURL._parts;
}
var _15e=aURL.string(),_15f=_15e.match(/^mhtml:/);
if(_15f){
_15e=_15e.substr("mhtml:".length);
}
if(_158>0&&_7c.call(_157,_15e)){
aURL._parts=_157[_15e];
return aURL._parts;
}
aURL._parts={};
var _160=aURL._parts,_161=_15b.exec(_15e),_97=_161.length;
while(_97--){
_160[_15c[_97]]=_161[_97]||NULL;
}
_160.portNumber=parseInt(_160.portNumber,10);
if(isNaN(_160.portNumber)){
_160.portNumber=-1;
}
_160.pathComponents=[];
if(_160.path){
var _162=_160.path.split("/"),_163=_160.pathComponents,_164=_162.length;
for(_97=0;_97<_164;++_97){
var _165=_162[_97];
if(_165){
_163.push(_165);
}else{
if(_97===0){
_163.push("/");
}
}
}
_160.pathComponents=_163;
}
if(_15f){
_160.url="mhtml:"+_160.url;
_160.scheme="mhtml:"+_160.scheme;
}
if(_158>0){
_157[_15e]=_160;
}
return _160;
};
CFURL=function(aURL,_166){
aURL=aURL||"";
if(aURL instanceof CFURL){
if(!_166){
return new CFURL(aURL.absoluteString());
}
var _167=aURL.baseURL();
if(_167){
_166=new CFURL(_167.absoluteURL(),_166);
}
aURL=aURL.string();
}
if(_158>0){
var _168=aURL+" "+(_166&&_166.UID()||"");
if(_7c.call(_156,_168)){
return _156[_168];
}
_156[_168]=this;
}
if(aURL.match(/^data:/)){
var _169={},_97=_15c.length;
while(_97--){
_169[_15c[_97]]="";
}
_169.url=aURL;
_169.scheme="data";
_169.pathComponents=[];
this._parts=_169;
this._standardizedURL=this;
this._absoluteURL=this;
}
this._UID=objj_generateObjectUID();
this._string=aURL;
this._baseURL=_166;
};
CFURL.prototype.UID=function(){
return this._UID;
};
var _16a={};
CFURL.prototype.mappedURL=function(){
return _16a[this.absoluteString()]||this;
};
CFURL.setMappedURLForURL=function(_16b,_16c){
_16a[_16b.absoluteString()]=_16c;
};
CFURL.prototype.schemeAndAuthority=function(){
var _16d="",_16e=this.scheme();
if(_16e){
_16d+=_16e+":";
}
var _16f=this.authority();
if(_16f){
_16d+="//"+_16f;
}
return _16d;
};
CFURL.prototype.absoluteString=function(){
if(this._absoluteString===_29){
this._absoluteString=this.absoluteURL().string();
}
return this._absoluteString;
};
CFURL.prototype.toString=function(){
return this.absoluteString();
};
function _170(aURL){
aURL=aURL.standardizedURL();
var _171=aURL.baseURL();
if(!_171){
return aURL;
}
var _172=((aURL)._parts||_15d(aURL)),_173,_174=_171.absoluteURL(),_175=((_174)._parts||_15d(_174));
if(_172.scheme||_172.authority){
_173=_172;
}else{
_173={};
_173.scheme=_175.scheme;
_173.authority=_175.authority;
_173.userInfo=_175.userInfo;
_173.user=_175.user;
_173.password=_175.password;
_173.domain=_175.domain;
_173.portNumber=_175.portNumber;
_173.queryString=_172.queryString;
_173.fragment=_172.fragment;
var _176=_172.pathComponents;
if(_176.length&&_176[0]==="/"){
_173.path=_172.path;
_173.pathComponents=_176;
}else{
var _177=_175.pathComponents,_178=_177.concat(_176);
if(!_171.hasDirectoryPath()&&_177.length){
_178.splice(_177.length-1,1);
}
if(_176.length&&(_176[0]===".."||_176[0]===".")){
_179(_178,YES);
}
_173.pathComponents=_178;
_173.path=_17a(_178,_176.length<=0||aURL.hasDirectoryPath());
}
}
var _17b=_17c(_173),_17d=new CFURL(_17b);
_17d._parts=_173;
_17d._standardizedURL=_17d;
_17d._standardizedString=_17b;
_17d._absoluteURL=_17d;
_17d._absoluteString=_17b;
return _17d;
};
function _17a(_17e,_17f){
var path=_17e.join("/");
if(path.length&&path.charAt(0)==="/"){
path=path.substr(1);
}
if(_17f){
path+="/";
}
return path;
};
function _179(_180,_181){
var _182=0,_183=0,_184=_180.length,_185=_181?_180:[],_186=NO;
for(;_182<_184;++_182){
var _187=_180[_182];
if(_187===""){
continue;
}
if(_187==="."){
_186=_183===0;
continue;
}
if(_187!==".."||_183===0||_185[_183-1]===".."){
_185[_183]=_187;
_183++;
continue;
}
if(_183>0&&_185[_183-1]!=="/"){
--_183;
}
}
if(_186&&_183===0){
_185[_183++]=".";
}
_185.length=_183;
return _185;
};
function _17c(_188){
var _189="",_18a=_188.scheme;
if(_18a){
_189+=_18a+":";
}
var _18b=_188.authority;
if(_18b){
_189+="//"+_18b;
}
_189+=_188.path;
var _18c=_188.queryString;
if(_18c){
_189+="?"+_18c;
}
var _18d=_188.fragment;
if(_18d){
_189+="#"+_18d;
}
return _189;
};
CFURL.prototype.absoluteURL=function(){
if(this._absoluteURL===_29){
this._absoluteURL=_170(this);
}
return this._absoluteURL;
};
CFURL.prototype.standardizedURL=function(){
if(this._standardizedURL===_29){
var _18e=((this)._parts||_15d(this)),_18f=_18e.pathComponents,_190=_179(_18f,NO);
var _191=_17a(_190,this.hasDirectoryPath());
if(_18e.path===_191){
this._standardizedURL=this;
}else{
var _192=_193(_18e);
_192.pathComponents=_190;
_192.path=_191;
var _194=new CFURL(_17c(_192),this.baseURL());
_194._parts=_192;
_194._standardizedURL=_194;
this._standardizedURL=_194;
}
}
return this._standardizedURL;
};
function _193(_195){
var _196={},_197=_15c.length;
while(_197--){
var _198=_15c[_197];
_196[_198]=_195[_198];
}
return _196;
};
CFURL.prototype.string=function(){
return this._string;
};
CFURL.prototype.authority=function(){
var _199=((this)._parts||_15d(this)).authority;
if(_199){
return _199;
}
var _19a=this.baseURL();
return _19a&&_19a.authority()||"";
};
CFURL.prototype.hasDirectoryPath=function(){
var _19b=this._hasDirectoryPath;
if(_19b===_29){
var path=this.path();
if(!path){
return NO;
}
if(path.charAt(path.length-1)==="/"){
return YES;
}
var _19c=this.lastPathComponent();
_19b=_19c==="."||_19c==="..";
this._hasDirectoryPath=_19b;
}
return _19b;
};
CFURL.prototype.hostName=function(){
return this.authority();
};
CFURL.prototype.fragment=function(){
return ((this)._parts||_15d(this)).fragment;
};
CFURL.prototype.lastPathComponent=function(){
if(this._lastPathComponent===_29){
var _19d=this.pathComponents(),_19e=_19d.length;
if(!_19e){
this._lastPathComponent="";
}else{
this._lastPathComponent=_19d[_19e-1];
}
}
return this._lastPathComponent;
};
CFURL.prototype.path=function(){
return ((this)._parts||_15d(this)).path;
};
CFURL.prototype.createCopyDeletingLastPathComponent=function(){
var _19f=((this)._parts||_15d(this)),_1a0=_179(_19f.pathComponents,NO);
if(_1a0.length>0){
if(_1a0.length>1||_1a0[0]!=="/"){
_1a0.pop();
}
}
var _1a1=_1a0.length===1&&_1a0[0]==="/";
_19f.pathComponents=_1a0;
_19f.path=_1a1?"/":_17a(_1a0,NO);
return new CFURL(_17c(_19f));
};
CFURL.prototype.pathComponents=function(){
return ((this)._parts||_15d(this)).pathComponents;
};
CFURL.prototype.pathExtension=function(){
var _1a2=this.lastPathComponent();
if(!_1a2){
return NULL;
}
_1a2=_1a2.replace(/^\.*/,"");
var _1a3=_1a2.lastIndexOf(".");
return _1a3<=0?"":_1a2.substring(_1a3+1);
};
CFURL.prototype.queryString=function(){
return ((this)._parts||_15d(this)).queryString;
};
CFURL.prototype.scheme=function(){
var _1a4=this._scheme;
if(_1a4===_29){
_1a4=((this)._parts||_15d(this)).scheme;
if(!_1a4){
var _1a5=this.baseURL();
_1a4=_1a5&&_1a5.scheme();
}
this._scheme=_1a4;
}
return _1a4;
};
CFURL.prototype.user=function(){
return ((this)._parts||_15d(this)).user;
};
CFURL.prototype.password=function(){
return ((this)._parts||_15d(this)).password;
};
CFURL.prototype.portNumber=function(){
return ((this)._parts||_15d(this)).portNumber;
};
CFURL.prototype.domain=function(){
return ((this)._parts||_15d(this)).domain;
};
CFURL.prototype.baseURL=function(){
return this._baseURL;
};
CFURL.prototype.asDirectoryPathURL=function(){
if(this.hasDirectoryPath()){
return this;
}
var _1a6=this.lastPathComponent();
if(_1a6!=="/"){
_1a6="./"+_1a6;
}
return new CFURL(_1a6+"/",this);
};
function _1a7(aURL){
if(!aURL._resourcePropertiesForKeys){
aURL._resourcePropertiesForKeys=new CFMutableDictionary();
}
return aURL._resourcePropertiesForKeys;
};
CFURL.prototype.resourcePropertyForKey=function(aKey){
return _1a7(this).valueForKey(aKey);
};
CFURL.prototype.setResourcePropertyForKey=function(aKey,_1a8){
_1a7(this).setValueForKey(aKey,_1a8);
};
CFURL.prototype.staticResourceData=function(){
var data=new CFMutableData();
data.setRawString(_1a9.resourceAtURL(this).contents());
return data;
};
function _10b(_1aa){
this._string=_1aa;
var _1ab=_1aa.indexOf(";");
this._magicNumber=_1aa.substr(0,_1ab);
this._location=_1aa.indexOf(";",++_1ab);
this._version=_1aa.substring(_1ab,this._location++);
};
_10b.prototype.magicNumber=function(){
return this._magicNumber;
};
_10b.prototype.version=function(){
return this._version;
};
_10b.prototype.getMarker=function(){
var _1ac=this._string,_1ad=this._location;
if(_1ad>=_1ac.length){
return null;
}
var next=_1ac.indexOf(";",_1ad);
if(next<0){
return null;
}
var _1ae=_1ac.substring(_1ad,next);
if(_1ae==="e"){
return null;
}
this._location=next+1;
return _1ae;
};
_10b.prototype.getString=function(){
var _1af=this._string,_1b0=this._location;
if(_1b0>=_1af.length){
return null;
}
var next=_1af.indexOf(";",_1b0);
if(next<0){
return null;
}
var size=parseInt(_1af.substring(_1b0,next),10),text=_1af.substr(next+1,size);
this._location=next+1+size;
return text;
};
var _1b1=0,_1b2=1<<0,_1b3=1<<1,_1b4=1<<2,_1b5=1<<3,_1b6=1<<4;
var _1b7={},_1b8={},_1b9=new Date().getTime(),_1ba=0,_1bb=0;
CFBundle=function(aURL){
aURL=_1bc(aURL).asDirectoryPathURL();
var _1bd=aURL.absoluteString(),_1be=_1b7[_1bd];
if(_1be){
return _1be;
}
_1b7[_1bd]=this;
this._bundleURL=aURL;
this._resourcesDirectoryURL=new CFURL("Resources/",aURL);
this._staticResource=NULL;
this._isValid=NO;
this._loadStatus=_1b1;
this._loadRequests=[];
this._infoDictionary=new CFDictionary();
this._eventDispatcher=new _77(this);
};
CFBundle.environments=function(){
return ["Browser","ObjJ"];
};
CFBundle.bundleContainingURL=function(aURL){
aURL=new CFURL(".",_1bc(aURL));
var _1bf,_1c0=aURL.absoluteString();
while(!_1bf||_1bf!==_1c0){
var _1c1=_1b7[_1c0];
if(_1c1&&_1c1._isValid){
return _1c1;
}
aURL=new CFURL("..",aURL);
_1bf=_1c0;
_1c0=aURL.absoluteString();
}
return NULL;
};
CFBundle.mainBundle=function(){
return new CFBundle(_1c2);
};
function _1c3(_1c4,_1c5){
if(_1c5){
_1b8[_1c4.name]=_1c5;
}
};
CFBundle.bundleForClass=function(_1c6){
return _1b8[_1c6.name]||CFBundle.mainBundle();
};
CFBundle.prototype.bundleURL=function(){
return this._bundleURL;
};
CFBundle.prototype.resourcesDirectoryURL=function(){
return this._resourcesDirectoryURL;
};
CFBundle.prototype.resourceURL=function(_1c7,_1c8,_1c9){
if(_1c8){
_1c7=_1c7+"."+_1c8;
}
if(_1c9){
_1c7=_1c9+"/"+_1c7;
}
var _1ca=(new CFURL(_1c7,this.resourcesDirectoryURL())).mappedURL();
return _1ca.absoluteURL();
};
CFBundle.prototype.mostEligibleEnvironmentURL=function(){
if(this._mostEligibleEnvironmentURL===_29){
this._mostEligibleEnvironmentURL=new CFURL(this.mostEligibleEnvironment()+".environment/",this.bundleURL());
}
return this._mostEligibleEnvironmentURL;
};
CFBundle.prototype.executableURL=function(){
if(this._executableURL===_29){
var _1cb=this.valueForInfoDictionaryKey("CPBundleExecutable");
if(!_1cb){
this._executableURL=NULL;
}else{
this._executableURL=new CFURL(_1cb,this.mostEligibleEnvironmentURL());
}
}
return this._executableURL;
};
CFBundle.prototype.infoDictionary=function(){
return this._infoDictionary;
};
CFBundle.prototype.valueForInfoDictionaryKey=function(aKey){
return this._infoDictionary.valueForKey(aKey);
};
CFBundle.prototype.hasSpritedImages=function(){
var _1cc=this._infoDictionary.valueForKey("CPBundleEnvironmentsWithImageSprites")||[],_97=_1cc.length,_1cd=this.mostEligibleEnvironment();
while(_97--){
if(_1cc[_97]===_1cd){
return YES;
}
}
return NO;
};
CFBundle.prototype.environments=function(){
return this._infoDictionary.valueForKey("CPBundleEnvironments")||["ObjJ"];
};
CFBundle.prototype.mostEligibleEnvironment=function(_1ce){
_1ce=_1ce||this.environments();
var _1cf=CFBundle.environments(),_97=0,_1d0=_1cf.length,_1d1=_1ce.length;
for(;_97<_1d0;++_97){
var _1d2=0,_1d3=_1cf[_97];
for(;_1d2<_1d1;++_1d2){
if(_1d3===_1ce[_1d2]){
return _1d3;
}
}
}
return NULL;
};
CFBundle.prototype.isLoading=function(){
return this._loadStatus&_1b2;
};
CFBundle.prototype.isLoaded=function(){
return !!(this._loadStatus&_1b6);
};
CFBundle.prototype.load=function(_1d4){
if(this._loadStatus!==_1b1){
return;
}
this._loadStatus=_1b2|_1b3;
var self=this,_1d5=this.bundleURL(),_1d6=new CFURL("..",_1d5);
if(_1d6.absoluteString()===_1d5.absoluteString()){
_1d6=_1d6.schemeAndAuthority();
}
_1a9.resolveResourceAtURL(_1d6,YES,function(_1d7){
var _1d8=_1d5.absoluteURL().lastPathComponent();
self._staticResource=_1d7._children[_1d8]||new _1a9(_1d5,_1d7,YES,NO);
function _1d9(_1da){
self._loadStatus&=~_1b3;
var _1db=_1da.request.responsePropertyList();
self._isValid=!!_1db||CFBundle.mainBundle()===self;
if(_1db){
self._infoDictionary=_1db;
}
if(!self._infoDictionary){
_1dd(self,new Error("Could not load bundle at \""+path+"\""));
return;
}
if(self===CFBundle.mainBundle()&&self.valueForInfoDictionaryKey("CPApplicationSize")){
_1bb=self.valueForInfoDictionaryKey("CPApplicationSize").valueForKey("executable")||0;
}
_1e1(self,_1d4);
};
function _1dc(){
self._isValid=CFBundle.mainBundle()===self;
self._loadStatus=_1b1;
_1dd(self,new Error("Could not load bundle at \""+self.bundleURL()+"\""));
};
new _b3(new CFURL("Info.plist",self.bundleURL()),_1d9,_1dc);
});
};
function _1dd(_1de,_1df){
_1e0(_1de._staticResource);
_1de._eventDispatcher.dispatchEvent({type:"error",error:_1df,bundle:_1de});
};
function _1e1(_1e2,_1e3){
if(!_1e2.mostEligibleEnvironment()){
return _1e4();
}
_1e5(_1e2,_1e6,_1e4);
_1e7(_1e2,_1e6,_1e4);
if(_1e2._loadStatus===_1b2){
return _1e6();
}
function _1e4(_1e8){
var _1e9=_1e2._loadRequests,_1ea=_1e9.length;
while(_1ea--){
_1e9[_1ea].abort();
}
this._loadRequests=[];
_1e2._loadStatus=_1b1;
_1dd(_1e2,_1e8||new Error("Could not recognize executable code format in Bundle "+_1e2));
};
function _1e6(){
if((typeof CPApp==="undefined"||!CPApp||!CPApp._finishedLaunching)&&typeof OBJJ_PROGRESS_CALLBACK==="function"&&_1bb){
OBJJ_PROGRESS_CALLBACK(MAX(MIN(1,_1ba/_1bb),0),_1bb,_1e2.bundlePath());
}
if(_1e2._loadStatus===_1b2){
_1e2._loadStatus=_1b6;
}else{
return;
}
_1e0(_1e2._staticResource);
function _1eb(){
_1e2._eventDispatcher.dispatchEvent({type:"load",bundle:_1e2});
};
if(_1e3){
_1ec(_1e2,_1eb);
}else{
_1eb();
}
};
};
function _1e5(_1ed,_1ee,_1ef){
var _1f0=_1ed.executableURL();
if(!_1f0){
return;
}
_1ed._loadStatus|=_1b4;
new _b3(_1f0,function(_1f1){
try{
_1ba+=_1f1.request.responseText().length;
_1f2(_1ed,_1f1.request.responseText(),_1f0);
_1ed._loadStatus&=~_1b4;
_1ee();
}
catch(anException){
_1ef(anException);
}
},_1ef);
};
function _1f3(_1f4){
return "mhtml:"+new CFURL("MHTMLTest.txt",_1f4.mostEligibleEnvironmentURL());
};
function _1f5(_1f6){
if(_1f7===_1f8){
return new CFURL("dataURLs.txt",_1f6.mostEligibleEnvironmentURL());
}
if(_1f7===_1f9||_1f7===_1fa){
return new CFURL("MHTMLPaths.txt",_1f6.mostEligibleEnvironmentURL());
}
return NULL;
};
function _1e7(_1fb,_1fc,_1fd){
if(!_1fb.hasSpritedImages()){
return;
}
_1fb._loadStatus|=_1b5;
if(!_1fe()){
return _1ff(_1f3(_1fb),function(){
_1e7(_1fb,_1fc,_1fd);
});
}
var _200=_1f5(_1fb);
if(!_200){
_1fb._loadStatus&=~_1b5;
return _1fc();
}
new _b3(_200,function(_201){
try{
_1ba+=_201.request.responseText().length;
_1f2(_1fb,_201.request.responseText(),_200);
_1fb._loadStatus&=~_1b5;
}
catch(anException){
_1fd(anException);
}
_1fc();
},_1fd);
};
var _202=[],_1f7=-1,_203=0,_1f8=1,_1f9=2,_1fa=3;
function _1fe(){
return _1f7!==-1;
};
function _1ff(_204,_205){
if(_1fe()){
return;
}
_202.push(_205);
if(_202.length>1){
return;
}
_202.push(function(){
var size=0,_206=CFBundle.mainBundle().valueForInfoDictionaryKey("CPApplicationSize");
if(!_206){
return;
}
switch(_1f7){
case _1f8:
size=_206.valueForKey("data");
break;
case _1f9:
case _1fa:
size=_206.valueForKey("mhtml");
break;
}
_1bb+=size;
});
_207([_1f8,"data:image/gif;base64,R0lGODlhAQABAIAAAMc9BQAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==",_1f9,_204+"!test",_1fa,_204+"?"+_1b9+"!test"]);
};
function _208(){
var _209=_202.length;
while(_209--){
_202[_209]();
}
};
function _207(_20a){
if(!("Image" in _1)||_20a.length<2){
_1f7=_203;
_208();
return;
}
var _20b=new Image();
_20b.onload=function(){
if(_20b.width===1&&_20b.height===1){
_1f7=_20a[0];
_208();
}else{
_20b.onerror();
}
};
_20b.onerror=function(){
_207(_20a.slice(2));
};
_20b.src=_20a[1];
};
function _1ec(_20c,_20d){
var _20e=[_20c._staticResource];
function _20f(_210){
for(;_210<_20e.length;++_210){
var _211=_20e[_210];
if(_211.isNotFound()){
continue;
}
if(_211.isFile()){
var _212=new _32a(_211.URL());
if(_212.hasLoadedFileDependencies()){
_212.execute();
}else{
_212.loadFileDependencies(function(){
_20f(_210);
});
return;
}
}else{
if(_211.URL().absoluteString()===_20c.resourcesDirectoryURL().absoluteString()){
continue;
}
var _213=_211.children();
for(var name in _213){
if(_7c.call(_213,name)){
_20e.push(_213[name]);
}
}
}
}
_20d();
};
_20f(0);
};
var _214="@STATIC",_215="p",_216="u",_217="c",_218="t",_219="I",_21a="i";
function _1f2(_21b,_21c,_21d){
var _21e=new _10b(_21c);
if(_21e.magicNumber()!==_214){
throw new Error("Could not read static file: "+_21d);
}
if(_21e.version()!=="1.0"){
throw new Error("Could not read static file: "+_21d);
}
var _21f,_220=_21b.bundleURL(),file=NULL;
while(_21f=_21e.getMarker()){
var text=_21e.getString();
if(_21f===_215){
var _221=new CFURL(text,_220),_222=_1a9.resourceAtURL(new CFURL(".",_221),YES);
file=new _1a9(_221,_222,NO,YES);
}else{
if(_21f===_216){
var URL=new CFURL(text,_220),_223=_21e.getString();
if(_223.indexOf("mhtml:")===0){
_223="mhtml:"+new CFURL(_223.substr("mhtml:".length),_220);
if(_1f7===_1fa){
var _224=_223.indexOf("!"),_225=_223.substring(0,_224),_226=_223.substring(_224);
_223=_225+"?"+_1b9+_226;
}
}
CFURL.setMappedURLForURL(URL,new CFURL(_223));
var _222=_1a9.resourceAtURL(new CFURL(".",URL),YES);
new _1a9(URL,_222,NO,YES);
}else{
if(_21f===_218){
file.write(text);
}
}
}
}
};
CFBundle.prototype.addEventListener=function(_227,_228){
this._eventDispatcher.addEventListener(_227,_228);
};
CFBundle.prototype.removeEventListener=function(_229,_22a){
this._eventDispatcher.removeEventListener(_229,_22a);
};
CFBundle.prototype.onerror=function(_22b){
throw _22b.error;
};
CFBundle.prototype.bundlePath=function(){
return this._bundleURL.absoluteURL().path();
};
CFBundle.prototype.path=function(){
CPLog.warn("CFBundle.prototype.path is deprecated, use CFBundle.prototype.bundlePath instead.");
return this.bundlePath.apply(this,arguments);
};
CFBundle.prototype.pathForResource=function(_22c){
return this.resourceURL(_22c).absoluteString();
};
var _22d={};
function _1a9(aURL,_22e,_22f,_230){
this._parent=_22e;
this._eventDispatcher=new _77(this);
var name=aURL.absoluteURL().lastPathComponent()||aURL.schemeAndAuthority();
this._name=name;
this._URL=aURL;
this._isResolved=!!_230;
if(_22f){
this._URL=this._URL.asDirectoryPathURL();
}
if(!_22e){
_22d[name]=this;
}
this._isDirectory=!!_22f;
this._isNotFound=NO;
if(_22e){
_22e._children[name]=this;
}
if(_22f){
this._children={};
}else{
this._contents="";
}
};
_1a9.rootResources=function(){
return _22d;
};
_2.StaticResource=_1a9;
function _1e0(_231){
_231._isResolved=YES;
_231._eventDispatcher.dispatchEvent({type:"resolve",staticResource:_231});
};
_1a9.prototype.resolve=function(){
if(this.isDirectory()){
var _232=new CFBundle(this.URL());
_232.onerror=function(){
};
_232.load(NO);
}else{
var self=this;
function _233(_234){
self._contents=_234.request.responseText();
_1e0(self);
};
function _235(){
self._isNotFound=YES;
_1e0(self);
};
new _b3(this.URL(),_233,_235);
}
};
_1a9.prototype.name=function(){
return this._name;
};
_1a9.prototype.URL=function(){
return this._URL;
};
_1a9.prototype.contents=function(){
return this._contents;
};
_1a9.prototype.children=function(){
return this._children;
};
_1a9.prototype.parent=function(){
return this._parent;
};
_1a9.prototype.isResolved=function(){
return this._isResolved;
};
_1a9.prototype.write=function(_236){
this._contents+=_236;
};
function _237(_238){
var _239=_238.schemeAndAuthority(),_23a=_22d[_239];
if(!_23a){
_23a=new _1a9(new CFURL(_239),NULL,YES,YES);
}
return _23a;
};
_1a9.resourceAtURL=function(aURL,_23b){
aURL=_1bc(aURL).absoluteURL();
var _23c=_237(aURL),_23d=aURL.pathComponents(),_97=0,_23e=_23d.length;
for(;_97<_23e;++_97){
var name=_23d[_97];
if(_7c.call(_23c._children,name)){
_23c=_23c._children[name];
}else{
if(_23b){
if(name!=="/"){
name="./"+name;
}
_23c=new _1a9(new CFURL(name,_23c.URL()),_23c,YES,YES);
}else{
throw new Error("Static Resource at "+aURL+" is not resolved (\""+name+"\")");
}
}
}
return _23c;
};
_1a9.prototype.resourceAtURL=function(aURL,_23f){
return _1a9.resourceAtURL(new CFURL(aURL,this.URL()),_23f);
};
_1a9.resolveResourceAtURL=function(aURL,_240,_241){
aURL=_1bc(aURL).absoluteURL();
_242(_237(aURL),_240,aURL.pathComponents(),0,_241);
};
_1a9.prototype.resolveResourceAtURL=function(aURL,_243,_244){
_1a9.resolveResourceAtURL(new CFURL(aURL,this.URL()).absoluteURL(),_243,_244);
};
function _242(_245,_246,_247,_248,_249){
var _24a=_247.length;
for(;_248<_24a;++_248){
var name=_247[_248],_24b=_7c.call(_245._children,name)&&_245._children[name];
if(!_24b){
_24b=new _1a9(new CFURL(name,_245.URL()),_245,_248+1<_24a||_246,NO);
_24b.resolve();
}
if(!_24b.isResolved()){
return _24b.addEventListener("resolve",function(){
_242(_245,_246,_247,_248,_249);
});
}
if(_24b.isNotFound()){
return _249(null,new Error("File not found: "+_247.join("/")));
}
if((_248+1<_24a)&&_24b.isFile()){
return _249(null,new Error("File is not a directory: "+_247.join("/")));
}
_245=_24b;
}
_249(_245);
};
function _24c(aURL,_24d,_24e){
var _24f=_1a9.includeURLs(),_250=new CFURL(aURL,_24f[_24d]).absoluteURL();
_1a9.resolveResourceAtURL(_250,NO,function(_251){
if(!_251){
if(_24d+1<_24f.length){
_24c(aURL,_24d+1,_24e);
}else{
_24e(NULL);
}
return;
}
_24e(_251);
});
};
_1a9.resolveResourceAtURLSearchingIncludeURLs=function(aURL,_252){
_24c(aURL,0,_252);
};
_1a9.prototype.addEventListener=function(_253,_254){
this._eventDispatcher.addEventListener(_253,_254);
};
_1a9.prototype.removeEventListener=function(_255,_256){
this._eventDispatcher.removeEventListener(_255,_256);
};
_1a9.prototype.isNotFound=function(){
return this._isNotFound;
};
_1a9.prototype.isFile=function(){
return !this._isDirectory;
};
_1a9.prototype.isDirectory=function(){
return this._isDirectory;
};
_1a9.prototype.toString=function(_257){
if(this.isNotFound()){
return "<file not found: "+this.name()+">";
}
var _258=this.name();
if(this.isDirectory()){
var _259=this._children;
for(var name in _259){
if(_259.hasOwnProperty(name)){
var _25a=_259[name];
if(_257||!_25a.isNotFound()){
_258+="\n\t"+_259[name].toString(_257).split("\n").join("\n\t");
}
}
}
}
return _258;
};
var _25b=NULL;
_1a9.includeURLs=function(){
if(_25b!==NULL){
return _25b;
}
_25b=[];
if(!_1.OBJJ_INCLUDE_PATHS&&!_1.OBJJ_INCLUDE_URLS){
_25b=["Frameworks","Frameworks/Debug"];
}else{
_25b=(_1.OBJJ_INCLUDE_PATHS||[]).concat(_1.OBJJ_INCLUDE_URLS||[]);
}
var _25c=_25b.length;
while(_25c--){
_25b[_25c]=new CFURL(_25b[_25c]).asDirectoryPathURL();
}
return _25b;
};
var _25d="accessors",_25e="class",_25f="end",_260="function",_261="implementation",_262="import",_263="each",_264="outlet",_265="action",_266="new",_267="selector",_268="super",_269="var",_26a="in",_26b="pragma",_26c="mark",_26d="=",_26e="+",_26f="-",_270=":",_271=",",_272=".",_273="*",_274=";",_275="<",_276="{",_277="}",_278=">",_279="[",_27a="\"",_27b="@",_27c="#",_27d="]",_27e="?",_27f="(",_280=")",_281=/^(?:(?:\s+$)|(?:\/(?:\/|\*)))/,_282=/^[+-]?\d+(([.]\d+)*([eE][+-]?\d+))?$/,_283=/^[a-zA-Z_$](\w|$)*$/;
function _284(_285){
this._index=-1;
this._tokens=(_285+"\n").match(/\/\/.*(\r|\n)?|\/\*(?:.|\n|\r)*?\*\/|\w+\b|[+-]?\d+(([.]\d+)*([eE][+-]?\d+))?|"[^"\\]*(\\[\s\S][^"\\]*)*"|'[^'\\]*(\\[\s\S][^'\\]*)*'|\s+|./g);
this._context=[];
return this;
};
_284.prototype.push=function(){
this._context.push(this._index);
};
_284.prototype.pop=function(){
this._index=this._context.pop();
};
_284.prototype.peek=function(_286){
if(_286){
this.push();
var _287=this.skip_whitespace();
this.pop();
return _287;
}
return this._tokens[this._index+1];
};
_284.prototype.next=function(){
return this._tokens[++this._index];
};
_284.prototype.previous=function(){
return this._tokens[--this._index];
};
_284.prototype.last=function(){
if(this._index<0){
return NULL;
}
return this._tokens[this._index-1];
};
_284.prototype.skip_whitespace=function(_288){
var _289;
if(_288){
while((_289=this.previous())&&_281.test(_289)){
}
}else{
while((_289=this.next())&&_281.test(_289)){
}
}
return _289;
};
_2.Lexer=_284;
function _28a(){
this.atoms=[];
};
_28a.prototype.toString=function(){
return this.atoms.join("");
};
_2.preprocess=function(_28b,aURL,_28c){
return new _28d(_28b,aURL,_28c).executable();
};
_2.eval=function(_28e){
return eval(_2.preprocess(_28e).code());
};
var _28d=function(_28f,aURL,_290){
this._URL=new CFURL(aURL);
_28f=_28f.replace(/^#[^\n]+\n/,"\n");
this._currentSelector="";
this._currentClass="";
this._currentSuperClass="";
this._currentSuperMetaClass="";
this._buffer=new _28a();
this._preprocessed=NULL;
this._dependencies=[];
this._tokens=new _284(_28f);
this._flags=_290;
this._classMethod=false;
this._executable=NULL;
this._classLookupTable={};
this._classVars={};
var _291=new objj_class();
for(var i in _291){
this._classVars[i]=1;
}
this.preprocess(this._tokens,this._buffer);
};
_28d.prototype.setClassInfo=function(_292,_293,_294){
this._classLookupTable[_292]={superClassName:_293,ivars:_294};
};
_28d.prototype.getClassInfo=function(_295){
return this._classLookupTable[_295];
};
_28d.prototype.allIvarNamesForClassName=function(_296){
var _297={},_298=this.getClassInfo(_296);
while(_298){
for(var i in _298.ivars){
_297[i]=1;
}
_298=this.getClassInfo(_298.superClassName);
}
return _297;
};
_2.Preprocessor=_28d;
_28d.Flags={};
_28d.Flags.IncludeDebugSymbols=1<<0;
_28d.Flags.IncludeTypeSignatures=1<<1;
_28d.prototype.executable=function(){
if(!this._executable){
this._executable=new _299(this._buffer.toString(),this._dependencies,this._URL);
}
return this._executable;
};
_28d.prototype.accessors=function(_29a){
var _29b=_29a.skip_whitespace(),_29c={};
if(_29b!=_27f){
_29a.previous();
return _29c;
}
while((_29b=_29a.skip_whitespace())!=_280){
var name=_29b,_29d=true;
if(!/^\w+$/.test(name)){
throw new SyntaxError(this.error_message("*** @accessors attribute name not valid."));
}
if((_29b=_29a.skip_whitespace())==_26d){
_29d=_29a.skip_whitespace();
if(!/^\w+$/.test(_29d)){
throw new SyntaxError(this.error_message("*** @accessors attribute value not valid."));
}
if(name=="setter"){
if((_29b=_29a.next())!=_270){
throw new SyntaxError(this.error_message("*** @accessors setter attribute requires argument with \":\" at end of selector name."));
}
_29d+=":";
}
_29b=_29a.skip_whitespace();
}
_29c[name]=_29d;
if(_29b==_280){
break;
}
if(_29b!=_271){
throw new SyntaxError(this.error_message("*** Expected ',' or ')' in @accessors attribute list."));
}
}
return _29c;
};
_28d.prototype.brackets=function(_29e,_29f){
var _2a0=[];
while(this.preprocess(_29e,NULL,NULL,NULL,_2a0[_2a0.length]=[])){
}
if(_2a0[0].length===1){
_29f.atoms[_29f.atoms.length]="[";
_29f.atoms[_29f.atoms.length]=_2a0[0][0];
_29f.atoms[_29f.atoms.length]="]";
}else{
var _2a1=new _28a();
if(_2a0[0][0].atoms[0]==_268){
_29f.atoms[_29f.atoms.length]="objj_msgSendSuper(";
_29f.atoms[_29f.atoms.length]="{ receiver:self, super_class:"+(this._classMethod?this._currentSuperMetaClass:this._currentSuperClass)+" }";
}else{
_29f.atoms[_29f.atoms.length]="objj_msgSend(";
_29f.atoms[_29f.atoms.length]=_2a0[0][0];
}
_2a1.atoms[_2a1.atoms.length]=_2a0[0][1];
var _2a2=1,_2a3=_2a0.length,_2a4=new _28a();
for(;_2a2<_2a3;++_2a2){
var pair=_2a0[_2a2];
_2a1.atoms[_2a1.atoms.length]=pair[1];
_2a4.atoms[_2a4.atoms.length]=", "+pair[0];
}
_29f.atoms[_29f.atoms.length]=", \"";
_29f.atoms[_29f.atoms.length]=_2a1;
_29f.atoms[_29f.atoms.length]="\"";
_29f.atoms[_29f.atoms.length]=_2a4;
_29f.atoms[_29f.atoms.length]=")";
}
};
_28d.prototype.directive=function(_2a5,_2a6,_2a7){
var _2a8=_2a6?_2a6:new _28a(),_2a9=_2a5.next();
if(_2a9.charAt(0)==_27a){
_2a8.atoms[_2a8.atoms.length]=_2a9;
}else{
if(_2a9===_25e){
_2a5.skip_whitespace();
return;
}else{
if(_2a9===_261){
this.implementation(_2a5,_2a8);
}else{
if(_2a9===_262){
this._import(_2a5);
}else{
if(_2a9===_267){
this.selector(_2a5,_2a8);
}
}
}
}
}
if(!_2a6){
return _2a8;
}
};
_28d.prototype.hash=function(_2aa,_2ab){
var _2ac=_2ab?_2ab:new _28a(),_2ad=_2aa.next();
if(_2ad===_26b){
_2ad=_2aa.skip_whitespace();
if(_2ad===_26c){
while((_2ad=_2aa.next()).indexOf("\n")<0){
}
}
}else{
throw new SyntaxError(this.error_message("*** Expected \"pragma\" to follow # but instead saw \""+_2ad+"\"."));
}
};
_28d.prototype.implementation=function(_2ae,_2af){
var _2b0=_2af,_2b1="",_2b2=NO,_2b3=_2ae.skip_whitespace(),_2b4="Nil",_2b5=new _28a(),_2b6=new _28a();
if(!(/^\w/).test(_2b3)){
throw new Error(this.error_message("*** Expected class name, found \""+_2b3+"\"."));
}
this._currentSuperClass="objj_getClass(\""+_2b3+"\").super_class";
this._currentSuperMetaClass="objj_getMetaClass(\""+_2b3+"\").super_class";
this._currentClass=_2b3;
this._currentSelector="";
if((_2b1=_2ae.skip_whitespace())==_27f){
_2b1=_2ae.skip_whitespace();
if(_2b1==_280){
throw new SyntaxError(this.error_message("*** Can't Have Empty Category Name for class \""+_2b3+"\"."));
}
if(_2ae.skip_whitespace()!=_280){
throw new SyntaxError(this.error_message("*** Improper Category Definition for class \""+_2b3+"\"."));
}
_2b0.atoms[_2b0.atoms.length]="{\nvar the_class = objj_getClass(\""+_2b3+"\")\n";
_2b0.atoms[_2b0.atoms.length]="if(!the_class) throw new SyntaxError(\"*** Could not find definition for class \\\""+_2b3+"\\\"\");\n";
_2b0.atoms[_2b0.atoms.length]="var meta_class = the_class.isa;";
}else{
if(_2b1==_270){
_2b1=_2ae.skip_whitespace();
if(!_283.test(_2b1)){
throw new SyntaxError(this.error_message("*** Expected class name, found \""+_2b1+"\"."));
}
_2b4=_2b1;
_2b1=_2ae.skip_whitespace();
}
_2b0.atoms[_2b0.atoms.length]="{var the_class = objj_allocateClassPair("+_2b4+", \""+_2b3+"\"),\nmeta_class = the_class.isa;";
if(_2b1==_276){
var _2b7={},_2b8=0,_2b9=[],_2ba,_2bb={},_2bc=[];
while((_2b1=_2ae.skip_whitespace())&&_2b1!=_277){
if(_2b1===_27b){
_2b1=_2ae.next();
if(_2b1===_25d){
_2ba=this.accessors(_2ae);
}else{
if(_2b1!==_264){
throw new SyntaxError(this.error_message("*** Unexpected '@' token in ivar declaration ('@"+_2b1+"')."));
}else{
_2bc.push("@"+_2b1);
}
}
}else{
if(_2b1==_274){
if(_2b8++===0){
_2b0.atoms[_2b0.atoms.length]="class_addIvars(the_class, [";
}else{
_2b0.atoms[_2b0.atoms.length]=", ";
}
var name=_2b9[_2b9.length-1];
if(this._flags&_28d.Flags.IncludeTypeSignatures){
_2b0.atoms[_2b0.atoms.length]="new objj_ivar(\""+name+"\", \""+_2bc.slice(0,_2bc.length-1).join(" ")+"\")";
}else{
_2b0.atoms[_2b0.atoms.length]="new objj_ivar(\""+name+"\")";
}
_2b7[name]=1;
_2b9=[];
_2bc=[];
if(_2ba){
_2bb[name]=_2ba;
_2ba=NULL;
}
}else{
_2b9.push(_2b1);
_2bc.push(_2b1);
}
}
}
if(_2b9.length){
throw new SyntaxError(this.error_message("*** Expected ';' in ivar declaration, found '}'."));
}
if(_2b8){
_2b0.atoms[_2b0.atoms.length]="]);\n";
}
if(!_2b1){
throw new SyntaxError(this.error_message("*** Expected '}'"));
}
this.setClassInfo(_2b3,_2b4==="Nil"?null:_2b4,_2b7);
var _2b7=this.allIvarNamesForClassName(_2b3);
for(ivar_name in _2bb){
var _2bd=_2bb[ivar_name],_2be=_2bd["property"]||ivar_name;
var _2bf=_2bd["getter"]||_2be,_2c0="(id)"+_2bf+"\n{\nreturn "+ivar_name+";\n}";
if(_2b5.atoms.length!==0){
_2b5.atoms[_2b5.atoms.length]=",\n";
}
_2b5.atoms[_2b5.atoms.length]=this.method(new _284(_2c0),_2b7);
if(_2bd["readonly"]){
continue;
}
var _2c1=_2bd["setter"];
if(!_2c1){
var _2c2=_2be.charAt(0)=="_"?1:0;
_2c1=(_2c2?"_":"")+"set"+_2be.substr(_2c2,1).toUpperCase()+_2be.substring(_2c2+1)+":";
}
var _2c3="(void)"+_2c1+"(id)newValue\n{\n";
if(_2bd["copy"]){
_2c3+="if ("+ivar_name+" !== newValue)\n"+ivar_name+" = [newValue copy];\n}";
}else{
_2c3+=ivar_name+" = newValue;\n}";
}
if(_2b5.atoms.length!==0){
_2b5.atoms[_2b5.atoms.length]=",\n";
}
_2b5.atoms[_2b5.atoms.length]=this.method(new _284(_2c3),_2b7);
}
}else{
_2ae.previous();
}
_2b0.atoms[_2b0.atoms.length]="objj_registerClassPair(the_class);\n";
}
if(!_2b7){
var _2b7=this.allIvarNamesForClassName(_2b3);
}
while((_2b1=_2ae.skip_whitespace())){
if(_2b1==_26e){
this._classMethod=true;
if(_2b6.atoms.length!==0){
_2b6.atoms[_2b6.atoms.length]=", ";
}
_2b6.atoms[_2b6.atoms.length]=this.method(_2ae,this._classVars);
}else{
if(_2b1==_26f){
this._classMethod=false;
if(_2b5.atoms.length!==0){
_2b5.atoms[_2b5.atoms.length]=", ";
}
_2b5.atoms[_2b5.atoms.length]=this.method(_2ae,_2b7);
}else{
if(_2b1==_27c){
this.hash(_2ae,_2b0);
}else{
if(_2b1==_27b){
if((_2b1=_2ae.next())==_25f){
break;
}else{
throw new SyntaxError(this.error_message("*** Expected \"@end\", found \"@"+_2b1+"\"."));
}
}
}
}
}
}
if(_2b5.atoms.length!==0){
_2b0.atoms[_2b0.atoms.length]="class_addMethods(the_class, [";
_2b0.atoms[_2b0.atoms.length]=_2b5;
_2b0.atoms[_2b0.atoms.length]="]);\n";
}
if(_2b6.atoms.length!==0){
_2b0.atoms[_2b0.atoms.length]="class_addMethods(meta_class, [";
_2b0.atoms[_2b0.atoms.length]=_2b6;
_2b0.atoms[_2b0.atoms.length]="]);\n";
}
_2b0.atoms[_2b0.atoms.length]="}";
this._currentClass="";
};
_28d.prototype._import=function(_2c4){
var _2c5="",_2c6=_2c4.skip_whitespace(),_2c7=(_2c6!==_275);
if(_2c6===_275){
while((_2c6=_2c4.next())&&_2c6!==_278){
_2c5+=_2c6;
}
if(!_2c6){
throw new SyntaxError(this.error_message("*** Unterminated import statement."));
}
}else{
if(_2c6.charAt(0)===_27a){
_2c5=_2c6.substr(1,_2c6.length-2);
}else{
throw new SyntaxError(this.error_message("*** Expecting '<' or '\"', found \""+_2c6+"\"."));
}
}
this._buffer.atoms[this._buffer.atoms.length]="objj_executeFile(\"";
this._buffer.atoms[this._buffer.atoms.length]=_2c5;
this._buffer.atoms[this._buffer.atoms.length]=_2c7?"\", YES);":"\", NO);";
this._dependencies.push(new _2c8(new CFURL(_2c5),_2c7));
};
_28d.prototype.method=function(_2c9,_2ca){
var _2cb=new _28a(),_2cc,_2cd="",_2ce=[],_2cf=[null];
_2ca=_2ca||{};
while((_2cc=_2c9.skip_whitespace())&&_2cc!==_276&&_2cc!==_274){
if(_2cc==_270){
var type="";
_2cd+=_2cc;
_2cc=_2c9.skip_whitespace();
if(_2cc==_27f){
while((_2cc=_2c9.skip_whitespace())&&_2cc!=_280){
type+=_2cc;
}
_2cc=_2c9.skip_whitespace();
}
_2cf[_2ce.length+1]=type||null;
_2ce[_2ce.length]=_2cc;
if(_2cc in _2ca){
CPLog.warn(this.error_message("*** Warning: Method ( "+_2cd+" ) uses a parameter name that is already in use ( "+_2cc+" )"));
}
}else{
if(_2cc==_27f){
var type="";
while((_2cc=_2c9.skip_whitespace())&&_2cc!=_280){
type+=_2cc;
}
_2cf[0]=type||null;
}else{
if(_2cc==_271){
if((_2cc=_2c9.skip_whitespace())!=_272||_2c9.next()!=_272||_2c9.next()!=_272){
throw new SyntaxError(this.error_message("*** Argument list expected after ','."));
}
}else{
_2cd+=_2cc;
}
}
}
}
if(_2cc===_274){
_2cc=_2c9.skip_whitespace();
if(_2cc!==_276){
throw new SyntaxError(this.error_message("Invalid semi-colon in method declaration. "+"Semi-colons are allowed only to terminate the method signature, before the open brace."));
}
}
var _2d0=0,_2d1=_2ce.length;
_2cb.atoms[_2cb.atoms.length]="new objj_method(sel_getUid(\"";
_2cb.atoms[_2cb.atoms.length]=_2cd;
_2cb.atoms[_2cb.atoms.length]="\"), function";
this._currentSelector=_2cd;
if(this._flags&_28d.Flags.IncludeDebugSymbols){
_2cb.atoms[_2cb.atoms.length]=" $"+this._currentClass+"__"+_2cd.replace(/:/g,"_");
}
_2cb.atoms[_2cb.atoms.length]="(self, _cmd";
for(;_2d0<_2d1;++_2d0){
_2cb.atoms[_2cb.atoms.length]=", ";
_2cb.atoms[_2cb.atoms.length]=_2ce[_2d0];
}
_2cb.atoms[_2cb.atoms.length]=")\n{ with(self)\n{";
_2cb.atoms[_2cb.atoms.length]=this.preprocess(_2c9,NULL,_277,_276);
_2cb.atoms[_2cb.atoms.length]="}\n}";
if(this._flags&_28d.Flags.IncludeDebugSymbols){
_2cb.atoms[_2cb.atoms.length]=","+JSON.stringify(_2cf);
}
_2cb.atoms[_2cb.atoms.length]=")";
this._currentSelector="";
return _2cb;
};
_28d.prototype.preprocess=function(_2d2,_2d3,_2d4,_2d5,_2d6){
var _2d7=_2d3?_2d3:new _28a(),_2d8=0,_2d9="";
if(_2d6){
_2d6[0]=_2d7;
var _2da=false,_2db=[0,0,0];
}
while((_2d9=_2d2.next())&&((_2d9!==_2d4)||_2d8)){
if(_2d6){
if(_2d9===_27e){
++_2db[2];
}else{
if(_2d9===_276){
++_2db[0];
}else{
if(_2d9===_277){
--_2db[0];
}else{
if(_2d9===_27f){
++_2db[1];
}else{
if(_2d9===_280){
--_2db[1];
}else{
if((_2d9===_270&&_2db[2]--===0||(_2da=(_2d9===_27d)))&&_2db[0]===0&&_2db[1]===0){
_2d2.push();
var _2dc=_2da?_2d2.skip_whitespace(true):_2d2.previous(),_2dd=_281.test(_2dc);
if(_2dd||_283.test(_2dc)&&_281.test(_2d2.previous())){
_2d2.push();
var last=_2d2.skip_whitespace(true),_2de=true,_2df=false;
if(last==="+"||last==="-"){
if(_2d2.previous()!==last){
_2de=false;
}else{
last=_2d2.skip_whitespace(true);
_2df=true;
}
}
_2d2.pop();
_2d2.pop();
if(_2de&&((!_2df&&(last===_277))||last===_280||last===_27d||last===_272||_282.test(last)||last.charAt(last.length-1)==="\""||last.charAt(last.length-1)==="'"||_283.test(last)&&!/^(new|return|case|var)$/.test(last))){
if(_2dd){
_2d6[1]=":";
}else{
_2d6[1]=_2dc;
if(!_2da){
_2d6[1]+=":";
}
var _2d8=_2d7.atoms.length;
while(_2d7.atoms[_2d8--]!==_2dc){
}
_2d7.atoms.length=_2d8;
}
return !_2da;
}
if(_2da){
return NO;
}
}
_2d2.pop();
if(_2da){
return NO;
}
}
}
}
}
}
}
_2db[2]=MAX(_2db[2],0);
}
if(_2d5){
if(_2d9===_2d5){
++_2d8;
}else{
if(_2d9===_2d4){
--_2d8;
}
}
}
if(_2d9===_260){
var _2e0="";
while((_2d9=_2d2.next())&&_2d9!==_27f&&!(/^\w/).test(_2d9)){
_2e0+=_2d9;
}
if(_2d9===_27f){
if(_2d5===_27f){
++_2d8;
}
_2d7.atoms[_2d7.atoms.length]="function"+_2e0+"(";
if(_2d6){
++_2db[1];
}
}else{
_2d7.atoms[_2d7.atoms.length]=_2d9+" = function";
}
}else{
if(_2d9==_27b){
this.directive(_2d2,_2d7);
}else{
if(_2d9==_27c){
this.hash(_2d2,_2d7);
}else{
if(_2d9==_279){
this.brackets(_2d2,_2d7);
}else{
_2d7.atoms[_2d7.atoms.length]=_2d9;
}
}
}
}
}
if(_2d6){
throw new SyntaxError(this.error_message("*** Expected ']' - Unterminated message send or array."));
}
if(!_2d3){
return _2d7;
}
};
_28d.prototype.selector=function(_2e1,_2e2){
var _2e3=_2e2?_2e2:new _28a();
_2e3.atoms[_2e3.atoms.length]="sel_getUid(\"";
if(_2e1.skip_whitespace()!=_27f){
throw new SyntaxError(this.error_message("*** Expected '('"));
}
var _2e4=_2e1.skip_whitespace();
if(_2e4==_280){
throw new SyntaxError(this.error_message("*** Unexpected ')', can't have empty @selector()"));
}
_2e2.atoms[_2e2.atoms.length]=_2e4;
var _2e5,_2e6=true;
while((_2e5=_2e1.next())&&_2e5!=_280){
if(_2e6&&/^\d+$/.test(_2e5)||!(/^(\w|$|\:)/.test(_2e5))){
if(!(/\S/).test(_2e5)){
if(_2e1.skip_whitespace()==_280){
break;
}else{
throw new SyntaxError(this.error_message("*** Unexpected whitespace in @selector()."));
}
}else{
throw new SyntaxError(this.error_message("*** Illegal character '"+_2e5+"' in @selector()."));
}
}
_2e3.atoms[_2e3.atoms.length]=_2e5;
_2e6=(_2e5==_270);
}
_2e3.atoms[_2e3.atoms.length]="\")";
if(!_2e2){
return _2e3;
}
};
_28d.prototype.error_message=function(_2e7){
return _2e7+" <Context File: "+this._URL+(this._currentClass?" Class: "+this._currentClass:"")+(this._currentSelector?" Method: "+this._currentSelector:"")+">";
};
function _2c8(aURL,_2e8){
this._URL=aURL;
this._isLocal=_2e8;
};
_2.FileDependency=_2c8;
_2c8.prototype.URL=function(){
return this._URL;
};
_2c8.prototype.isLocal=function(){
return this._isLocal;
};
_2c8.prototype.toMarkedString=function(){
var _2e9=this.URL().absoluteString();
return (this.isLocal()?_21a:_219)+";"+_2e9.length+";"+_2e9;
};
_2c8.prototype.toString=function(){
return (this.isLocal()?"LOCAL: ":"STD: ")+this.URL();
};
var _2ea=0,_2eb=1,_2ec=2,_2ed=0;
function _299(_2ee,_2ef,aURL,_2f0){
if(arguments.length===0){
return this;
}
this._code=_2ee;
this._function=_2f0||NULL;
this._URL=_1bc(aURL||new CFURL("(Anonymous"+(_2ed++)+")"));
this._fileDependencies=_2ef;
if(_2ef.length){
this._fileDependencyStatus=_2ea;
this._fileDependencyCallbacks=[];
}else{
this._fileDependencyStatus=_2ec;
}
if(this._function){
return;
}
this.setCode(_2ee);
};
_2.Executable=_299;
_299.prototype.path=function(){
return this.URL().path();
};
_299.prototype.URL=function(){
return this._URL;
};
_299.prototype.functionParameters=function(){
var _2f1=["global","objj_executeFile","objj_importFile"];
return _2f1;
};
_299.prototype.functionArguments=function(){
var _2f2=[_1,this.fileExecuter(),this.fileImporter()];
return _2f2;
};
_299.prototype.execute=function(){
var _2f3=_2f4;
_2f4=CFBundle.bundleContainingURL(this.URL());
var _2f5=this._function.apply(_1,this.functionArguments());
_2f4=_2f3;
return _2f5;
};
_299.prototype.code=function(){
return this._code;
};
_299.prototype.setCode=function(code){
this._code=code;
var _2f6=this.functionParameters().join(",");
this._function=new Function(_2f6,code);
};
_299.prototype.fileDependencies=function(){
return this._fileDependencies;
};
_299.prototype.hasLoadedFileDependencies=function(){
return this._fileDependencyStatus===_2ec;
};
var _2f7=0,_2f8=[],_2f9={};
_299.prototype.loadFileDependencies=function(_2fa){
var _2fb=this._fileDependencyStatus;
if(_2fa){
if(_2fb===_2ec){
return _2fa();
}
this._fileDependencyCallbacks.push(_2fa);
}
if(_2fb===_2ea){
if(_2f7){
throw "Can't load";
}
_2fc(this);
}
};
function _2fc(_2fd){
_2f8.push(_2fd);
_2fd._fileDependencyStatus=_2eb;
var _2fe=_2fd.fileDependencies(),_97=0,_2ff=_2fe.length,_300=_2fd.referenceURL(),_301=_300.absoluteString(),_302=_2fd.fileExecutableSearcher();
_2f7+=_2ff;
for(;_97<_2ff;++_97){
var _303=_2fe[_97],_304=_303.isLocal(),URL=_303.URL(),_305=(_304&&(_301+" ")||"")+URL;
if(_2f9[_305]){
if(--_2f7===0){
_306();
}
continue;
}
_2f9[_305]=YES;
_302(URL,_304,_307);
}
};
function _307(_308){
--_2f7;
if(_308._fileDependencyStatus===_2ea){
_2fc(_308);
}else{
if(_2f7===0){
_306();
}
}
};
function _306(){
var _309=_2f8,_97=0,_30a=_309.length;
_2f8=[];
for(;_97<_30a;++_97){
_309[_97]._fileDependencyStatus=_2ec;
}
for(_97=0;_97<_30a;++_97){
var _30b=_309[_97],_30c=_30b._fileDependencyCallbacks,_30d=0,_30e=_30c.length;
for(;_30d<_30e;++_30d){
_30c[_30d]();
}
_30b._fileDependencyCallbacks=[];
}
};
_299.prototype.referenceURL=function(){
if(this._referenceURL===_29){
this._referenceURL=new CFURL(".",this.URL());
}
return this._referenceURL;
};
_299.prototype.fileImporter=function(){
return _299.fileImporterForURL(this.referenceURL());
};
_299.prototype.fileExecuter=function(){
return _299.fileExecuterForURL(this.referenceURL());
};
_299.prototype.fileExecutableSearcher=function(){
return _299.fileExecutableSearcherForURL(this.referenceURL());
};
var _30f={};
_299.fileExecuterForURL=function(aURL){
var _310=_1bc(aURL),_311=_310.absoluteString(),_312=_30f[_311];
if(!_312){
_312=function(aURL,_313,_314){
_299.fileExecutableSearcherForURL(_310)(aURL,_313,function(_315){
if(!_315.hasLoadedFileDependencies()){
throw "No executable loaded for file at URL "+aURL;
}
_315.execute(_314);
});
};
_30f[_311]=_312;
}
return _312;
};
var _316={};
_299.fileImporterForURL=function(aURL){
var _317=_1bc(aURL),_318=_317.absoluteString(),_319=_316[_318];
if(!_319){
_319=function(aURL,_31a,_31b){
_159();
_299.fileExecutableSearcherForURL(_317)(aURL,_31a,function(_31c){
_31c.loadFileDependencies(function(){
_31c.execute();
_15a();
if(_31b){
_31b();
}
});
});
};
_316[_318]=_319;
}
return _319;
};
var _31d={},_31e={};
_299.fileExecutableSearcherForURL=function(_31f){
var _320=_31f.absoluteString(),_321=_31d[_320],_322={};
if(!_321){
_321=function(aURL,_323,_324){
var _325=(_323&&_31f||"")+aURL,_326=_31e[_325];
if(_326){
return _327(_326);
}
var _328=(aURL instanceof CFURL)&&aURL.scheme();
if(_323||_328){
if(!_328){
aURL=new CFURL(aURL,_31f);
}
_1a9.resolveResourceAtURL(aURL,NO,_327);
}else{
_1a9.resolveResourceAtURLSearchingIncludeURLs(aURL,_327);
}
function _327(_329){
if(!_329){
throw new Error("Could not load file at "+aURL);
}
_31e[_325]=_329;
_324(new _32a(_329.URL()));
};
};
_31d[_320]=_321;
}
return _321;
};
var _32b={};
function _32a(aURL){
aURL=_1bc(aURL);
var _32c=aURL.absoluteString(),_32d=_32b[_32c];
if(_32d){
return _32d;
}
_32b[_32c]=this;
var _32e=_1a9.resourceAtURL(aURL).contents(),_32f=NULL,_330=aURL.pathExtension();
if(_32e.match(/^@STATIC;/)){
_32f=_331(_32e,aURL);
}else{
if(_330==="j"||!_330){
_32f=_2.preprocess(_32e,aURL,_28d.Flags.IncludeDebugSymbols);
}else{
_32f=new _299(_32e,[],aURL);
}
}
_299.apply(this,[_32f.code(),_32f.fileDependencies(),aURL,_32f._function]);
this._hasExecuted=NO;
};
_2.FileExecutable=_32a;
_32a.prototype=new _299();
_32a.prototype.execute=function(_332){
if(this._hasExecuted&&!_332){
return;
}
this._hasExecuted=YES;
_299.prototype.execute.call(this);
};
_32a.prototype.hasExecuted=function(){
return this._hasExecuted;
};
function _331(_333,aURL){
var _334=new _10b(_333);
var _335=NULL,code="",_336=[];
while(_335=_334.getMarker()){
var text=_334.getString();
if(_335===_218){
code+=text;
}else{
if(_335===_219){
_336.push(new _2c8(new CFURL(text),NO));
}else{
if(_335===_21a){
_336.push(new _2c8(new CFURL(text),YES));
}
}
}
}
var fn=_32a._lookupCachedFunction(aURL);
if(fn){
return new _299(code,_336,aURL,fn);
}
return new _299(code,_336,aURL);
};
var _337={};
_32a._cacheFunction=function(aURL,fn){
aURL=typeof aURL==="string"?aURL:aURL.absoluteString();
_337[aURL]=fn;
};
_32a._lookupCachedFunction=function(aURL){
aURL=typeof aURL==="string"?aURL:aURL.absoluteString();
return _337[aURL];
};
var _338=1,_339=2,_33a=4,_33b=8;
objj_ivar=function(_33c,_33d){
this.name=_33c;
this.type=_33d;
};
objj_method=function(_33e,_33f,_340){
this.name=_33e;
this.method_imp=_33f;
this.types=_340;
};
objj_class=function(_341){
this.isa=NULL;
this.version=0;
this.super_class=NULL;
this.sub_classes=[];
this.name=NULL;
this.info=0;
this.ivar_list=[];
this.ivar_store=function(){
};
this.ivar_dtable=this.ivar_store.prototype;
this.method_list=[];
this.method_store=function(){
};
this.method_dtable=this.method_store.prototype;
this.allocator=function(){
};
this._UID=-1;
};
objj_object=function(){
this.isa=NULL;
this._UID=-1;
};
class_getName=function(_342){
if(_342==Nil){
return "";
}
return _342.name;
};
class_isMetaClass=function(_343){
if(!_343){
return NO;
}
return ((_343.info&(_339)));
};
class_getSuperclass=function(_344){
if(_344==Nil){
return Nil;
}
return _344.super_class;
};
class_setSuperclass=function(_345,_346){
_345.super_class=_346;
_345.isa.super_class=_346.isa;
};
class_addIvar=function(_347,_348,_349){
var _34a=_347.allocator.prototype;
if(typeof _34a[_348]!="undefined"){
return NO;
}
var ivar=new objj_ivar(_348,_349);
_347.ivar_list.push(ivar);
_347.ivar_dtable[_348]=ivar;
_34a[_348]=NULL;
return YES;
};
class_addIvars=function(_34b,_34c){
var _34d=0,_34e=_34c.length,_34f=_34b.allocator.prototype;
for(;_34d<_34e;++_34d){
var ivar=_34c[_34d],name=ivar.name;
if(typeof _34f[name]==="undefined"){
_34b.ivar_list.push(ivar);
_34b.ivar_dtable[name]=ivar;
_34f[name]=NULL;
}
}
};
class_copyIvarList=function(_350){
return _350.ivar_list.slice(0);
};
class_addMethod=function(_351,_352,_353,_354){
var _355=new objj_method(_352,_353,_354);
_351.method_list.push(_355);
_351.method_dtable[_352]=_355;
if(!((_351.info&(_339)))&&(((_351.info&(_339)))?_351:_351.isa).isa===(((_351.info&(_339)))?_351:_351.isa)){
class_addMethod((((_351.info&(_339)))?_351:_351.isa),_352,_353,_354);
}
return YES;
};
class_addMethods=function(_356,_357){
var _358=0,_359=_357.length,_35a=_356.method_list,_35b=_356.method_dtable;
for(;_358<_359;++_358){
var _35c=_357[_358];
_35a.push(_35c);
_35b[_35c.name]=_35c;
}
if(!((_356.info&(_339)))&&(((_356.info&(_339)))?_356:_356.isa).isa===(((_356.info&(_339)))?_356:_356.isa)){
class_addMethods((((_356.info&(_339)))?_356:_356.isa),_357);
}
};
class_getInstanceMethod=function(_35d,_35e){
if(!_35d||!_35e){
return NULL;
}
var _35f=_35d.method_dtable[_35e];
return _35f?_35f:NULL;
};
class_getInstanceVariable=function(_360,_361){
if(!_360||!_361){
return NULL;
}
var _362=_360.ivar_dtable[_361];
return _362;
};
class_getClassMethod=function(_363,_364){
if(!_363||!_364){
return NULL;
}
var _365=(((_363.info&(_339)))?_363:_363.isa).method_dtable[_364];
return _365?_365:NULL;
};
class_respondsToSelector=function(_366,_367){
return class_getClassMethod(_366,_367)!=NULL;
};
class_copyMethodList=function(_368){
return _368.method_list.slice(0);
};
class_getVersion=function(_369){
return _369.version;
};
class_setVersion=function(_36a,_36b){
_36a.version=parseInt(_36b,10);
};
class_replaceMethod=function(_36c,_36d,_36e){
if(!_36c||!_36d){
return NULL;
}
var _36f=_36c.method_dtable[_36d],_370=NULL;
if(_36f){
_370=_36f.method_imp;
}
_36f.method_imp=_36e;
return _370;
};
var _371=function(_372){
var meta=(((_372.info&(_339)))?_372:_372.isa);
if((_372.info&(_339))){
_372=objj_getClass(_372.name);
}
if(_372.super_class&&!((((_372.super_class.info&(_339)))?_372.super_class:_372.super_class.isa).info&(_33a))){
_371(_372.super_class);
}
if(!(meta.info&(_33a))&&!(meta.info&(_33b))){
meta.info=(meta.info|(_33b))&~(0);
objj_msgSend(_372,"initialize");
meta.info=(meta.info|(_33a))&~(_33b);
}
};
var _373=function(self,_374){
var isa=self.isa,_375=isa.method_dtable[_376];
if(_375){
var _377=_375.method_imp.call(this,self,_376,_374);
if(_377&&_377!==self){
arguments[0]=_377;
return objj_msgSend.apply(this,arguments);
}
}
_375=isa.method_dtable[_378];
if(_375){
var _379=isa.method_dtable[_37a];
if(_379){
var _37b=_375.method_imp.call(this,self,_378,_374);
if(_37b){
var _37c=objj_lookUpClass("CPInvocation");
if(_37c){
var _37d=objj_msgSend(_37c,_37e,_37b),_97=0,_37f=arguments.length;
for(;_97<_37f;++_97){
objj_msgSend(_37d,_380,arguments[_97],_97);
}
_379.method_imp.call(this,self,_37a,_37d);
return objj_msgSend(_37d,_381);
}
}
}
}
_375=isa.method_dtable[_382];
if(_375){
return _375.method_imp.call(this,self,_382,_374);
}
throw class_getName(isa)+" does not implement doesNotRecognizeSelector:. Did you forget a superclass for "+class_getName(isa)+"?";
};
class_getMethodImplementation=function(_383,_384){
if(!((((_383.info&(_339)))?_383:_383.isa).info&(_33a))){
_371(_383);
}
var _385=_383.method_dtable[_384];
var _386=_385?_385.method_imp:_373;
return _386;
};
var _387={};
objj_allocateClassPair=function(_388,_389){
var _38a=new objj_class(_389),_38b=new objj_class(_389),_38c=_38a;
if(_388){
_38c=_388;
while(_38c.superclass){
_38c=_38c.superclass;
}
_38a.allocator.prototype=new _388.allocator;
_38a.ivar_dtable=_38a.ivar_store.prototype=new _388.ivar_store;
_38a.method_dtable=_38a.method_store.prototype=new _388.method_store;
_38b.method_dtable=_38b.method_store.prototype=new _388.isa.method_store;
_38a.super_class=_388;
_38b.super_class=_388.isa;
}else{
_38a.allocator.prototype=new objj_object();
}
_38a.isa=_38b;
_38a.name=_389;
_38a.info=_338;
_38a._UID=objj_generateObjectUID();
_38b.isa=_38c.isa;
_38b.name=_389;
_38b.info=_339;
_38b._UID=objj_generateObjectUID();
return _38a;
};
var _2f4=nil;
objj_registerClassPair=function(_38d){
_1[_38d.name]=_38d;
_387[_38d.name]=_38d;
_1c3(_38d,_2f4);
};
class_createInstance=function(_38e){
if(!_38e){
throw new Error("*** Attempting to create object with Nil class.");
}
var _38f=new _38e.allocator();
_38f.isa=_38e;
_38f._UID=objj_generateObjectUID();
return _38f;
};
var _390=function(){
};
_390.prototype.member=false;
with(new _390()){
member=true;
}
if(new _390().member){
var _391=class_createInstance;
class_createInstance=function(_392){
var _393=_391(_392);
if(_393){
var _394=_393.isa,_395=_394;
while(_394){
var _396=_394.ivar_list,_397=_396.length;
while(_397--){
_393[_396[_397].name]=NULL;
}
_394=_394.super_class;
}
_393.isa=_395;
}
return _393;
};
}
object_getClassName=function(_398){
if(!_398){
return "";
}
var _399=_398.isa;
return _399?class_getName(_399):"";
};
objj_lookUpClass=function(_39a){
var _39b=_387[_39a];
return _39b?_39b:Nil;
};
objj_getClass=function(_39c){
var _39d=_387[_39c];
if(!_39d){
}
return _39d?_39d:Nil;
};
objj_getMetaClass=function(_39e){
var _39f=objj_getClass(_39e);
return (((_39f.info&(_339)))?_39f:_39f.isa);
};
ivar_getName=function(_3a0){
return _3a0.name;
};
ivar_getTypeEncoding=function(_3a1){
return _3a1.type;
};
objj_msgSend=function(_3a2,_3a3){
if(_3a2==nil){
return nil;
}
var isa=_3a2.isa;
if(!((((isa.info&(_339)))?isa:isa.isa).info&(_33a))){
_371(isa);
}
var _3a4=isa.method_dtable[_3a3];
var _3a5=_3a4?_3a4.method_imp:_373;
switch(arguments.length){
case 2:
return _3a5(_3a2,_3a3);
case 3:
return _3a5(_3a2,_3a3,arguments[2]);
case 4:
return _3a5(_3a2,_3a3,arguments[2],arguments[3]);
}
return _3a5.apply(_3a2,arguments);
};
objj_msgSendSuper=function(_3a6,_3a7){
var _3a8=_3a6.super_class;
arguments[0]=_3a6.receiver;
if(!((((_3a8.info&(_339)))?_3a8:_3a8.isa).info&(_33a))){
_371(_3a8);
}
var _3a9=_3a8.method_dtable[_3a7];
var _3aa=_3a9?_3a9.method_imp:_373;
return _3aa.apply(_3a6.receiver,arguments);
};
method_getName=function(_3ab){
return _3ab.name;
};
method_getImplementation=function(_3ac){
return _3ac.method_imp;
};
method_setImplementation=function(_3ad,_3ae){
var _3af=_3ad.method_imp;
_3ad.method_imp=_3ae;
return _3af;
};
method_exchangeImplementations=function(lhs,rhs){
var _3b0=method_getImplementation(lhs),_3b1=method_getImplementation(rhs);
method_setImplementation(lhs,_3b1);
method_setImplementation(rhs,_3b0);
};
sel_getName=function(_3b2){
return _3b2?_3b2:"<null selector>";
};
sel_getUid=function(_3b3){
return _3b3;
};
sel_isEqual=function(lhs,rhs){
return lhs===rhs;
};
sel_registerName=function(_3b4){
return _3b4;
};
objj_class.prototype.toString=objj_object.prototype.toString=function(){
var isa=this.isa;
if(class_getInstanceMethod(isa,_3b5)){
return objj_msgSend(this,_3b5);
}
if(class_isMetaClass(isa)){
return this.name;
}
return "["+isa.name+" Object](-description not implemented)";
};
var _3b5=sel_getUid("description"),_376=sel_getUid("forwardingTargetForSelector:"),_378=sel_getUid("methodSignatureForSelector:"),_37a=sel_getUid("forwardInvocation:"),_382=sel_getUid("doesNotRecognizeSelector:"),_37e=sel_getUid("invocationWithMethodSignature:"),_3b6=sel_getUid("setTarget:"),_3b7=sel_getUid("setSelector:"),_380=sel_getUid("setArgument:atIndex:"),_381=sel_getUid("returnValue");
objj_eval=function(_3b8){
var url=_2.pageURL;
var _3b9=_2.asyncLoader;
_2.asyncLoader=NO;
var _3ba=_2.preprocess(_3b8,url,0);
if(!_3ba.hasLoadedFileDependencies()){
_3ba.loadFileDependencies();
}
_1._objj_eval_scope={};
_1._objj_eval_scope.objj_executeFile=_299.fileExecuterForURL(url);
_1._objj_eval_scope.objj_importFile=_299.fileImporterForURL(url);
var code="with(_objj_eval_scope){"+_3ba._code+"\n//*/\n}";
var _3bb;
_3bb=eval(code);
_2.asyncLoader=_3b9;
return _3bb;
};
_2.objj_eval=objj_eval;
_159();
var _3bc=new CFURL(window.location.href),_3bd=document.getElementsByTagName("base"),_3be=_3bd.length;
if(_3be>0){
var _3bf=_3bd[_3be-1],_3c0=_3bf&&_3bf.getAttribute("href");
if(_3c0){
_3bc=new CFURL(_3c0,_3bc);
}
}
var _3c1=new CFURL(window.OBJJ_MAIN_FILE||"main.j"),_1c2=new CFURL(".",new CFURL(_3c1,_3bc)).absoluteURL(),_3c2=new CFURL("..",_1c2).absoluteURL();
if(_1c2===_3c2){
_3c2=new CFURL(_3c2.schemeAndAuthority());
}
_1a9.resourceAtURL(_3c2,YES);
_2.pageURL=_3bc;
_2.bootstrap=function(){
_3c3();
};
function _3c3(){
_1a9.resolveResourceAtURL(_1c2,YES,function(_3c4){
var _3c5=_1a9.includeURLs(),_97=0,_3c6=_3c5.length;
for(;_97<_3c6;++_97){
_3c4.resourceAtURL(_3c5[_97],YES);
}
_299.fileImporterForURL(_1c2)(_3c1.lastPathComponent(),YES,function(){
_15a();
_3cc(function(){
var _3c7=window.location.hash.substring(1),args=[];
if(_3c7.length){
args=_3c7.split("/");
for(var i=0,_3c6=args.length;i<_3c6;i++){
args[i]=decodeURIComponent(args[i]);
}
}
var _3c8=window.location.search.substring(1).split("&"),_3c9=new CFMutableDictionary();
for(var i=0,_3c6=_3c8.length;i<_3c6;i++){
var _3ca=_3c8[i].split("=");
if(!_3ca[0]){
continue;
}
if(_3ca[1]==null){
_3ca[1]=true;
}
_3c9.setValueForKey(decodeURIComponent(_3ca[0]),decodeURIComponent(_3ca[1]));
}
main(args,_3c9);
});
});
});
};
var _3cb=NO;
function _3cc(_3cd){
if(_3cb){
return _3cd();
}
if(window.addEventListener){
window.addEventListener("load",_3cd,NO);
}else{
if(window.attachEvent){
window.attachEvent("onload",_3cd);
}
}
};
_3cc(function(){
_3cb=YES;
});
if(typeof OBJJ_AUTO_BOOTSTRAP==="undefined"||OBJJ_AUTO_BOOTSTRAP){
_2.bootstrap();
}
function _1bc(aURL){
if(aURL instanceof CFURL&&aURL.scheme()){
return aURL;
}
return new CFURL(aURL,_1c2);
};
objj_importFile=_299.fileImporterForURL(_1c2);
objj_executeFile=_299.fileExecuterForURL(_1c2);
objj_import=function(){
CPLog.warn("objj_import is deprecated, use objj_importFile instead");
objj_importFile.apply(this,arguments);
};
})(window,ObjectiveJ);
