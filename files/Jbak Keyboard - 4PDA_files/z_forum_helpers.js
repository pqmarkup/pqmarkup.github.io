(function(p,q,v){(function(d){function e(){return!1}function b(){return!0}function a(c){c||d.event;if(c[k])return c;c[k]=1;c[k+g]=c[g];c[k+f]=c[f];c[s]=e;c[m]=e;c[g]=function(){this[s]=b;if(this[k+g])this[k+g]();else this.returnValue=!1};c[f]=function(){this[m]=b;if(this[k+f])this[k+f]();else this.cancelBubble=!0};c.target||(c.target=c.srcElement||q);3===c.target.nodeType&&(c.target=c.target.parentNode);return c}var k="isFixed",g="preventDefault",f="stopPropagation",s="isDefaultPrevented",m="isPropagationStopped",
h=0;Array.prototype.indexOf||(Array.prototype.indexOf=function(c,b){b||(b=0);for(var a=b;a<this.length;a++)if(this[a]==c)return a;return-1});if(!d.jsEvent)var l=d.jsEvent={add:function(c,b,e){c.setInterval&&c!=d&&!c.frameElement&&(c=d);e.guid||(e.guid=++h);c.events||(c.events={},c.handle=function(b){a(b);for(var e in c.events[b.type])!1===c.events[b.type][e].call(c,b)&&(b[g](),b[f]())});c.events[b]||(c.events[b]={},c.addEventListener?c.addEventListener(b,c.handle,!1):c.attachEvent?c.attachEvent("on"+
b,c.handle):c["on"+b]=c.handle);c.events[b][e.guid]=e;return l},remove:function(c,a,e){var f=c.events&&c.events[a],d;if(f){delete f[e.guid];for(d in f)return l;c.removeEventListener?c.removeEventListener(a,c.handle,!1):c.detachEvent?c.detachEvent("on"+a,c.handle):c["on"+a]=b;delete c.events[a];for(d in c.events)return l;try{delete c.handle,delete c.events}catch(k){c.removeAttribute("handle"),c.removeAttribute("events")}}return l}}})(p);var r=function(d,e){e&&e.querySelectorAll||(e=q);return e.querySelectorAll(d)},
t=function(d,e){return(e=r(d,e))&&e.length?e[0]:v},u=function(d,e,b){jsEvent.add(d,e,b);return d},n=function(d,e){var b=d.className,a=RegExp("\\b"+e+"\\b","gi");if(b)return a.test(b)?d.className=b.replace(a,""):d.className=b+" "+e,d};(function(d,e){var b=function(b,a){return"padding:"+b+";margin:"+a+";"},a=function(){var a=t("#qrPopupWindowBackground"),d=t("#qrPopupWindowContent");a||(a=e.createElement("div"),a.id="qrPopupWindowBackground",a.setAttribute("style","display:none;"),a.onclick=function(){this.style.display=
"none";return!1},a.title="������� ��� ��������",e.body.appendChild(a));d||(d=e.createElement("div"),d.id="qrPopupWindowContent",d.setAttribute("style","width:auto;"+b("8px","0 auto")+"background:#FFF;z-index:65534;-webkit-border-radius:8px;border-radius:8px;-webkit-box-shadow:0 0 10px 0 #000;box-shadow:0 0 10px 0 #000;"),a.appendChild(d));return[a,d]},k=function(a){return'<img src="'+a+'" border="0" style="'+b(0,0)+'" align="middle">'},g=function(b){var d=a()[1];d.innerHTML=k("http://s.4pda.ru/forum/style_images/1/qr_code.gif");
d.innerHTML=k("http://qrfree.kaywa.com/?l=1&s=8&d="+encodeURIComponent(b));a()[0].setAttribute("style","position:fixed;left:0;top:0;right:0;bottom:0;display:-webkit-flex;display:-ms-flex:display:none;background:rgba(0,0,0,.5);-ms-flex-align:center;-webkit-align-items:center;align-items:center;z-index:65533")};d.jsShowQr=g;d.jsParseQrForum=function(){for(var a=r(".borderwrap .postcolor a"),k=0,m,h,l,c;k<a.length;k++)(h=(m=a[k]).getAttribute("href"))&&""!=h&&"#"!=h.substr(0,1)&&"java"!=h.substr(0,4)&&
(l=e.createElement("img"),l.alt=l.title="QR",l.setAttribute("style","border:0;vertical-align:middle;"+b(0,"0 3px")+"cursor:pointer"),l.src="http://s.4pda.ru/forum/style_images/1/qr_code.gif",c=h.split(":")[0],"http"!=c&&"https"!=c&&"market"!=c&&"magnet"!=c&&(c=d.location.pathname,c="/"==h.substr(0,1)?"":-1==c.lastIndexOf("/")?"/":c.substr(0,c.lastIndexOf("/")+1),h=d.location.protocol+"//"+d.location.host+c+h),l.H=h,l.onclick=function(){g(this.H);return!1},m.parentNode.insertBefore(l,m))}})(p,q);(function(d,
e){c_post_block="post-block";c_block_title="block-title";c_open="open";c_close="close";c_box="box";c_unbox="unbox";c_quote="quote";c_hidden="hidden";hasClass=function(b,a){return b.className&&-1<(" "+b.className+" ").indexOf(" "+a+" ")};fn_ev=function(b){if(!b.isDefaultPrevented()){b=b.target;for(var a;b&&b!=e&&!hasClass(b,c_block_title);)b=b.parentNode;if(b&&b!=e&&(a=b.parentNode)&&hasClass(b,c_block_title)&&hasClass(a,c_post_block)){if(hasClass(a,c_open)||hasClass(a,c_close))return n(n(a,c_close),
c_open),!1;if(hasClass(a,c_unbox)||hasClass(a,c_box))return n(n(a,c_unbox),c_box),!1}}};u(e,"click",fn_ev);d.initPostBlock=function(){var b,a,d,g,f=0;try{for(b=e.getElementsByName(location.hash.replace(/^#/,"")),f=0;f<b.length;f++){d=[];g=0;if("A"==b[f].tagName)for(a=b[f].parentNode;a&&a!=e.body&&!(g=/^post-main-\d+$/.test(a.id));)a=a.parentNode,d.push(a);if(g)for(;d.length;)a=d.pop(),hasClass(a,c_post_block)&&hasClass(a,c_close)&&n(n(a,c_close),c_open)}}catch(p){}b=e.body||e.getElementsByTagName("body")[0];
a=e.createElement("style");d=e.createElement("div");f=!1;a.type="text/css";d.className="checkPseudoSupport";a.styleSheet?a.styleSheet.cssText='.checkPseudoSupport{position:fixed;left:-100px;top:-100px;display:block;width:auto;height:auto} .checkPseudoSupport:before{content:"";display:block;height:50px}':a.appendChild(e.createTextNode('.checkPseudoSupport{position:fixed;left:-100px;top:-100px;display:block;width:auto;height:auto} .checkPseudoSupport:before{content:"";display:block;height:50px}'));
b.appendChild(a);b.appendChild(d);f=40<d.offsetHeight;b.removeChild(d);b.removeChild(a);if(!f){var m,h="BLOCK";b=r("."+c_post_block+">."+c_block_title);for(f=0;f<b.length;f++)m=0,a=(d=b[f]).parentNode,g=!(d.innerHTML+"").replace(/(^\s+)|(\s+$)/g,""),hasClass(a,c_close)||hasClass(a,c_open)?(h="SPOILER",m=1):hasClass(a,c_box)||hasClass(a,c_unbox)?(h="CODE",m=1):hasClass(a,c_quote)?h="QUOTE":hasClass(a,c_hidden)&&(h="HIDE"),g&&(d.innerHTML=h),m&&u(b[f],"click",fn_ev)}}})(p,q);(function(d,e){setTimeout(function(b,
a,e,g){"CONFIG"in d&&"tz"in d.CONFIG&&"baseurl"in d.CONFIG&&(b=new Date,a=-parseInt(b.getTimezoneOffset()/30),e=d.CONFIG.baseurl+"act=xmlout&do=tz-autoset&tz="+30*a,a!=2*parseFloat(d.CONFIG.tz)&&((g=function(a){try{return new XMLHttpRequest}catch(b){}try{return new ActiveXObject("Microsoft.XMLHTTP")}catch(d){}try{return new ActiveXObject("Msxml2.XMLHTTP.6.0")}catch(e){}try{return new ActiveXObject("Msxml2.XMLHTTP.3.0")}catch(g){}return 0}())?(g.onreadystatechange=function(){4==this.readyState&&"success"!=
this.responseText&&(d.location=e)},g.open("GET",e+"&xml=1&_="+b.getTime()),g.send(null)):d.location=e))},1E3)})(p)})(window,document);