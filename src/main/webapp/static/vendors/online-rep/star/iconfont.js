(function(window){var svgSprite='<svg><symbol id="icon-star" viewBox="0 0 1024 1024"><path d="M746.494709 953.126836L513.27197 812.595172 280.062534 953.146279c-13.382798 8.045233-29.958312 7.103792-42.432415-2.336208-12.492522-9.491165-18.49012-25.977651-15.283078-41.753963l55.686276-274.880511L78.205153 445.977307c-11.449773-10.822486-17.965164-27.570939-13.229303-42.886762 4.806469-15.321964 19.922748-26.239618 35.276435-27.948539l267.635503-29.6636 109.7281-256.56333c6.285147-14.71412 20.243043-26.105564 35.667338-26.105565 15.404852 0 29.369911 11.392468 35.673477 26.105565l109.728101 256.56333 267.629363 29.6636c15.359826 1.708921 25.50386 12.627598 30.284747 27.948539 4.780887 15.314801 3.193739 32.089859-8.236592 42.886762l-199.8517 188.19829 55.725162 274.880511c3.180436 15.776312-2.809999 32.249495-15.283078 41.72838-6.809079 5.170766-14.879895 7.807826-22.982434 7.807826-6.694469 0-13.408381-1.817392-19.475563-5.465478z" fill="#666666" ></path></symbol></svg>';var script=function(){var scripts=document.getElementsByTagName("script");return scripts[scripts.length-1]}();var shouldInjectCss=script.getAttribute("data-injectcss");var ready=function(fn){if(document.addEventListener){if(~["complete","loaded","interactive"].indexOf(document.readyState)){setTimeout(fn,0)}else{var loadFn=function(){document.removeEventListener("DOMContentLoaded",loadFn,false);fn()};document.addEventListener("DOMContentLoaded",loadFn,false)}}else if(document.attachEvent){IEContentLoaded(window,fn)}function IEContentLoaded(w,fn){var d=w.document,done=false,init=function(){if(!done){done=true;fn()}};var polling=function(){try{d.documentElement.doScroll("left")}catch(e){setTimeout(polling,50);return}init()};polling();d.onreadystatechange=function(){if(d.readyState=="complete"){d.onreadystatechange=null;init()}}}};var before=function(el,target){target.parentNode.insertBefore(el,target)};var prepend=function(el,target){if(target.firstChild){before(el,target.firstChild)}else{target.appendChild(el)}};function appendSvg(){var div,svg;div=document.createElement("div");div.innerHTML=svgSprite;svgSprite=null;svg=div.getElementsByTagName("svg")[0];if(svg){svg.setAttribute("aria-hidden","true");svg.style.position="absolute";svg.style.width=0;svg.style.height=0;svg.style.overflow="hidden";prepend(svg,document.body)}}if(shouldInjectCss&&!window.__iconfont__svg__cssinject__){window.__iconfont__svg__cssinject__=true;try{document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>")}catch(e){console&&console.log(e)}}ready(appendSvg)})(window)