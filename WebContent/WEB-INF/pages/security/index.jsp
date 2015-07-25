<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--

  ######  ######
  ######  ######
  ######  ######

                  ######
                  ######
                  ######

  ######  ######
  ######  ######
  ######  ######

  ######
  ######
  ######

-->
<html>
<head>
<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"beacon-1.newrelic.com","errorBeacon":"bam.nr-data.net","licenseKey":"153135129c","applicationID":"1723063","transactionName":"JgpdRxANWQ1SQk1VAwkJVkEbTUUTWFoHURYW","queueTime":354,"applicationTime":1002,"agentToken":null,"agent":"js-agent.newrelic.com/nr-476.min.js"}</script>
<script type="text/javascript">(window.NREUM||(NREUM={})).loader_config={xpid:"UwEGUVdACQQCV1FUBA=="};window.NREUM||(NREUM={}),__nr_require=function(t,e,n){function r(n){if(!e[n]){var o=e[n]={exports:{}};t[n][0].call(o.exports,function(e){var o=t[n][1][e];return r(o?o:e)},o,o.exports)}return e[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<n.length;o++)r(n[o]);return r}({QJf3ax:[function(t,e){function n(t){function e(e,n,a){t&&t(e,n,a),a||(a={});for(var c=s(e),u=c.length,f=i(a,o,r),d=0;u>d;d++)c[d].apply(f,n);return f}function a(t,e){u[t]=s(t).concat(e)}function s(t){return u[t]||[]}function c(){return n(e)}var u={};return{on:a,emit:e,create:c,listeners:s,_events:u}}function r(){return{}}var o="nr@context",i=t("gos");e.exports=n()},{gos:"7eSDFh"}],ee:[function(t,e){e.exports=t("QJf3ax")},{}],3:[function(t){function e(t,e,n,i,s){try{c?c-=1:r("err",[s||new UncaughtException(t,e,n)])}catch(u){try{r("ierr",[u,(new Date).getTime(),!0])}catch(f){}}return"function"==typeof a?a.apply(this,o(arguments)):!1}function UncaughtException(t,e,n){this.message=t||"Uncaught error with no additional information",this.sourceURL=e,this.line=n}function n(t){r("err",[t,(new Date).getTime()])}var r=t("handle"),o=t(4),i=t("ee"),a=window.onerror,s=!1,c=0;t("loader").features.err=!0,window.onerror=e,NREUM.noticeError=n;try{throw new Error}catch(u){"stack"in u&&(t(5),t(3),"addEventListener"in window&&t(1),window.XMLHttpRequest&&XMLHttpRequest.prototype&&XMLHttpRequest.prototype.addEventListener&&t(2),s=!0)}i.on("fn-start",function(){s&&(c+=1)}),i.on("fn-err",function(t,e,r){s&&(this.thrown=!0,n(r))}),i.on("fn-end",function(){s&&!this.thrown&&c>0&&(c-=1)}),i.on("internal-error",function(t){r("ierr",[t,(new Date).getTime(),!0])})},{1:4,2:7,3:5,4:18,5:6,ee:"QJf3ax",handle:"D5DuLP",loader:"G9z0Bl"}],4:[function(t,e){function n(t){i.inPlace(t,["addEventListener","removeEventListener"],"-",r)}function r(t){return t[1]}var o=(t(1),t("ee").create()),i=t(2)(o),a=t("gos");if(e.exports=o,n(window),"getPrototypeOf"in Object){for(var s=document;s&&!s.hasOwnProperty("addEventListener");)s=Object.getPrototypeOf(s);s&&n(s);for(var c=XMLHttpRequest.prototype;c&&!c.hasOwnProperty("addEventListener");)c=Object.getPrototypeOf(c);c&&n(c)}else XMLHttpRequest.prototype.hasOwnProperty("addEventListener")&&n(XMLHttpRequest.prototype);o.on("addEventListener-start",function(t){if(t[1]){var e=t[1];"function"==typeof e?this.wrapped=t[1]=a(e,"nr@wrapped",function(){return i(e,"fn-",null,e.name||"anonymous")}):"function"==typeof e.handleEvent&&i.inPlace(e,["handleEvent"],"fn-")}}),o.on("removeEventListener-start",function(t){var e=this.wrapped;e&&(t[1]=e)})},{1:18,2:19,ee:"QJf3ax",gos:"7eSDFh"}],5:[function(t,e){var n=(t(2),t("ee").create()),r=t(1)(n);e.exports=n,r.inPlace(window,["requestAnimationFrame","mozRequestAnimationFrame","webkitRequestAnimationFrame","msRequestAnimationFrame"],"raf-"),n.on("raf-start",function(t){t[0]=r(t[0],"fn-")})},{1:19,2:18,ee:"QJf3ax"}],6:[function(t,e){function n(t,e,n){var r=t[0];"string"==typeof r&&(r=new Function(r)),t[0]=o(r,"fn-",null,n)}var r=(t(2),t("ee").create()),o=t(1)(r);e.exports=r,o.inPlace(window,["setTimeout","setInterval","setImmediate"],"setTimer-"),r.on("setTimer-start",n)},{1:19,2:18,ee:"QJf3ax"}],7:[function(t,e){function n(){c.inPlace(this,d,"fn-")}function r(t,e){c.inPlace(e,["onreadystatechange"],"fn-")}function o(t,e){return e}var i=t("ee").create(),a=t(1),s=t(2),c=s(i),u=s(a),f=window.XMLHttpRequest,d=["onload","onerror","onabort","onloadstart","onloadend","onprogress","ontimeout"];e.exports=i,window.XMLHttpRequest=function(t){var e=new f(t);try{i.emit("new-xhr",[],e),u.inPlace(e,["addEventListener","removeEventListener"],"-",function(t,e){return e}),e.addEventListener("readystatechange",n,!1)}catch(r){try{i.emit("internal-error",[r])}catch(o){}}return e},window.XMLHttpRequest.prototype=f.prototype,c.inPlace(XMLHttpRequest.prototype,["open","send"],"-xhr-",o),i.on("send-xhr-start",r),i.on("open-xhr-start",r)},{1:4,2:19,ee:"QJf3ax"}],8:[function(t){function e(t){if("string"==typeof t&&t.length)return t.length;if("object"!=typeof t)return void 0;if("undefined"!=typeof ArrayBuffer&&t instanceof ArrayBuffer&&t.byteLength)return t.byteLength;if("undefined"!=typeof Blob&&t instanceof Blob&&t.size)return t.size;if("undefined"!=typeof FormData&&t instanceof FormData)return void 0;try{return JSON.stringify(t).length}catch(e){return void 0}}function n(t){var n=this.params,r=this.metrics;if(!this.ended){this.ended=!0;for(var i=0;c>i;i++)t.removeEventListener(s[i],this.listener,!1);if(!n.aborted){if(r.duration=(new Date).getTime()-this.startTime,4===t.readyState){n.status=t.status;var a=t.responseType,u="arraybuffer"===a||"blob"===a||"json"===a?t.response:t.responseText,f=e(u);if(f&&(r.rxSize=f),this.sameOrigin){var d=t.getResponseHeader("X-NewRelic-App-Data");d&&(n.cat=d.split(", ").pop())}}else n.status=0;r.cbTime=this.cbTime,o("xhr",[n,r,this.startTime])}}}function r(t,e){var n=i(e),r=t.params;r.host=n.hostname+":"+n.port,r.pathname=n.pathname,t.sameOrigin=n.sameOrigin}if(window.XMLHttpRequest&&XMLHttpRequest.prototype&&XMLHttpRequest.prototype.addEventListener&&!/CriOS/.test(navigator.userAgent)){t("loader").features.xhr=!0;var o=t("handle"),i=t(2),a=t("ee"),s=["load","error","abort","timeout"],c=s.length,u=t(1);t(4),t(3),a.on("new-xhr",function(){this.totalCbs=0,this.called=0,this.cbTime=0,this.end=n,this.ended=!1,this.xhrGuids={}}),a.on("open-xhr-start",function(t){this.params={method:t[0]},r(this,t[1]),this.metrics={}}),a.on("open-xhr-end",function(t,e){"loader_config"in NREUM&&"xpid"in NREUM.loader_config&&this.sameOrigin&&e.setRequestHeader("X-NewRelic-ID",NREUM.loader_config.xpid)}),a.on("send-xhr-start",function(t,n){var r=this.metrics,o=t[0],i=this;if(r&&o){var u=e(o);u&&(r.txSize=u)}this.startTime=(new Date).getTime(),this.listener=function(t){try{"abort"===t.type&&(i.params.aborted=!0),("load"!==t.type||i.called===i.totalCbs&&(i.onloadCalled||"function"!=typeof n.onload))&&i.end(n)}catch(e){try{a.emit("internal-error",[e])}catch(r){}}};for(var f=0;c>f;f++)n.addEventListener(s[f],this.listener,!1)}),a.on("xhr-cb-time",function(t,e,n){this.cbTime+=t,e?this.onloadCalled=!0:this.called+=1,this.called!==this.totalCbs||!this.onloadCalled&&"function"==typeof n.onload||this.end(n)}),a.on("xhr-load-added",function(t,e){var n=""+u(t)+!!e;this.xhrGuids&&!this.xhrGuids[n]&&(this.xhrGuids[n]=!0,this.totalCbs+=1)}),a.on("xhr-load-removed",function(t,e){var n=""+u(t)+!!e;this.xhrGuids&&this.xhrGuids[n]&&(delete this.xhrGuids[n],this.totalCbs-=1)}),a.on("addEventListener-end",function(t,e){e instanceof XMLHttpRequest&&"load"===t[0]&&a.emit("xhr-load-added",[t[1],t[2]],e)}),a.on("removeEventListener-end",function(t,e){e instanceof XMLHttpRequest&&"load"===t[0]&&a.emit("xhr-load-removed",[t[1],t[2]],e)}),a.on("fn-start",function(t,e,n){e instanceof XMLHttpRequest&&("onload"===n&&(this.onload=!0),("load"===(t[0]&&t[0].type)||this.onload)&&(this.xhrCbStart=(new Date).getTime()))}),a.on("fn-end",function(t,e){this.xhrCbStart&&a.emit("xhr-cb-time",[(new Date).getTime()-this.xhrCbStart,this.onload,e],e)})}},{1:"XL7HBI",2:9,3:7,4:4,ee:"QJf3ax",handle:"D5DuLP",loader:"G9z0Bl"}],9:[function(t,e){e.exports=function(t){var e=document.createElement("a"),n=window.location,r={};e.href=t,r.port=e.port;var o=e.href.split("://");return!r.port&&o[1]&&(r.port=o[1].split("/")[0].split(":")[1]),r.port&&"0"!==r.port||(r.port="https"===o[0]?"443":"80"),r.hostname=e.hostname||n.hostname,r.pathname=e.pathname,"/"!==r.pathname.charAt(0)&&(r.pathname="/"+r.pathname),r.sameOrigin=!e.hostname||e.hostname===document.domain&&e.port===n.port&&e.protocol===n.protocol,r}},{}],gos:[function(t,e){e.exports=t("7eSDFh")},{}],"7eSDFh":[function(t,e){function n(t,e,n){if(r.call(t,e))return t[e];var o=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,e,{value:o,writable:!0,enumerable:!1}),o}catch(i){}return t[e]=o,o}var r=Object.prototype.hasOwnProperty;e.exports=n},{}],D5DuLP:[function(t,e){function n(t,e,n){return r.listeners(t).length?r.emit(t,e,n):(o[t]||(o[t]=[]),void o[t].push(e))}var r=t("ee").create(),o={};e.exports=n,n.ee=r,r.q=o},{ee:"QJf3ax"}],handle:[function(t,e){e.exports=t("D5DuLP")},{}],XL7HBI:[function(t,e){function n(t){var e=typeof t;return!t||"object"!==e&&"function"!==e?-1:t===window?0:i(t,o,function(){return r++})}var r=1,o="nr@id",i=t("gos");e.exports=n},{gos:"7eSDFh"}],id:[function(t,e){e.exports=t("XL7HBI")},{}],loader:[function(t,e){e.exports=t("G9z0Bl")},{}],G9z0Bl:[function(t,e){function n(){var t=p.info=NREUM.info;if(t&&t.agent&&t.licenseKey&&t.applicationID&&c&&c.body){p.proto="https"===d.split(":")[0]||t.sslForHttp?"https://":"http://",a("mark",["onload",i()]);var e=c.createElement("script");e.src=p.proto+t.agent,c.body.appendChild(e)}}function r(){"complete"===c.readyState&&o()}function o(){a("mark",["domContent",i()])}function i(){return(new Date).getTime()}var a=t("handle"),s=window,c=s.document,u="addEventListener",f="attachEvent",d=(""+location).split("?")[0],p=e.exports={offset:i(),origin:d,features:{}};c[u]?(c[u]("DOMContentLoaded",o,!1),s[u]("load",n,!1)):(c[f]("onreadystatechange",r),s[f]("onload",n)),a("mark",["firstbyte",i()])},{handle:"D5DuLP"}],18:[function(t,e){function n(t,e,n){e||(e=0),"undefined"==typeof n&&(n=t?t.length:0);for(var r=-1,o=n-e||0,i=Array(0>o?0:o);++r<o;)i[r]=t[e+r];return i}e.exports=n},{}],19:[function(t,e){function n(t){return!(t&&"function"==typeof t&&t.apply&&!t[i])}var r=t("ee"),o=t(1),i="nr@wrapper",a=Object.prototype.hasOwnProperty;e.exports=function(t){function e(t,e,r,a){function nrWrapper(){var n,i,s,u;try{i=this,n=o(arguments),s=r&&r(n,i)||{}}catch(d){f([d,"",[n,i,a],s])}c(e+"start",[n,i,a],s);try{return u=t.apply(i,n)}catch(p){throw c(e+"err",[n,i,p],s),p}finally{c(e+"end",[n,i,u],s)}}return n(t)?t:(e||(e=""),nrWrapper[i]=!0,u(t,nrWrapper),nrWrapper)}function s(t,r,o,i){o||(o="");var a,s,c,u="-"===o.charAt(0);for(c=0;c<r.length;c++)s=r[c],a=t[s],n(a)||(t[s]=e(a,u?s+o:o,i,s,t))}function c(e,n,r){try{t.emit(e,n,r)}catch(o){f([o,e,n,r])}}function u(t,e){if(Object.defineProperty&&Object.keys)try{var n=Object.keys(t);return n.forEach(function(n){Object.defineProperty(e,n,{get:function(){return t[n]},set:function(e){return t[n]=e,e}})}),e}catch(r){f([r])}for(var o in t)a.call(t,o)&&(e[o]=t[o]);return e}function f(e){try{t.emit("internal-error",e)}catch(n){}}return t||(t=r),e.inPlace=s,e.flag=i,e}},{1:18,ee:"QJf3ax"}]},{},["G9z0Bl",3,8]);</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>  
  <title>Yahoo Finance System</title>
  <meta content="authenticity_token" name="csrf-param" />
<meta content="SzcOs8ZsiDpIkVDIPieisJezZeO+TefgSQfv/UxwTA8=" name="csrf-token" />
  
  <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
  <!-- <meta name="viewport" content="width=360px; initial-scale=0.75; maximum-scale=1.0; minimum-scale=0.5;" /> -->
  <!-- <meta name="viewport" content="width=520px; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.5;" /> -->
  <!-- <meta name="viewport" content="width=540px; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.5;" /> -->
  <!-- <meta name="viewport" content="width=540px" /> -->
  <meta name="viewport" content="width=device-width">
  <link href="https://d340syr2dan8gj.cloudfront.net/assets/application-204cd70edb8a1f781ecf47388d4eca0c.css" media="screen" rel="stylesheet" />
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
 
 
 
 <script language="javascript">

$(document).ready(function() {
  if ("<c:out value='${param.login_error}'/>" != "") {
      $('#wrongCredentials').show();
  }
  $("#signin").on("click", loginValidation);  
  $("#r_username").on("blur", function() {
    $.ajax({
      url: "validate/username.htm",
      type: "get",
      dataType: "html",
      data: {username: $("#r_username").val()},
      success: function(response) {
        alert(response);
      } 
      
    });
  });
});
 

function loginValidation() {
  $("#usernameAndPasswordReq").hide();
  $("#usernameReq").hide();
  $("#passwordReq").hide();   
  $("#wrongCredentials").hide();  
    if($("#j_username").val().length == 0 && $("#j_password").val().length == 0) {
      $("#usernameAndPasswordReq").show();
      return false;
    } else if ($("#j_username").val().length == 0) {
      $('#usernameReq').show();
      return false;
    } else if ($("#j_password").val().length == 0) {
      $("#passwordReq").show();
      return false;
    } else {
      return true;
    }
}

function check()
{   $("#usernameRequired").hide();
	$("#passNoMatch").hide();
	$("#passMatch").hide();
	
with(document.all){
if(r_password.value!=r_r_password.value)
{
	$("#passNoMatch").show();
/*  alert("Password doesn't match")  */
r_password.value = "";
r_r_password.value = "";
}
else if(r_password.value==r_r_password.value){
	$("#passMatch").hide();
}
	
}
}



$(document).ready(function(){
    $("input").focus(function(){
      $(this).css("background-color","#cccccc");
    });
    $("input").blur(function(){
      $(this).css("background-color","#ffffff");
    });
  });

var md5Encrypt = function(form){
  //alert($("#r_password"));
}
</script>





<script>
$(document).ready(function() {
		$("#register-form").on("submit", validateForm);
		$("#r_password").on("blur", function() {
			$("#userExist").hide();
			$.ajax({
				url: "validation",
				type: "get",
				dataType: "html",
				data: {name: $("#r_password").val()},
				success: function(response) {
					var result = response.toString().trim();
					if (result=="true") {
						$("#userExist").show();
					}
				},
				/* error: function(msg) {
					alert(msg);
				} */
			});
		});
	});


	function validateForm() {
		$("#r_password").hide();
		
		var pass = $("#r_password").val();
		
		if (pass.length==0 ) {
			$("#r_password").show();
			return false;
		}else
		return true;
	}
</script>









<script> 
$(document).ready(function(){
  $("div#aaa").show(function(){
    var div=$("div#aaa");  
    div.animate({left:'150px'},"slow");
    div.animate({fontSize:'3em'},"slow");
  });
});
</script>

<script>
var myVar=setInterval(function(){myTimer()},1000);

function myTimer() {
    var d = new Date();
    document.getElementById("demo").innerHTML = d.toLocaleTimeString();
}
</script>




<script>
/* 	$(document).ready(function() {
		$("#loginForm").on("submit", validateForm);
		$("#r_username").on("blur", function() {
			$("#userExist").hide();
			$.ajax({
				url: "validation",
				type: "get",
				dataType: "html",
				data: {name: $("#r_username").val()},
				success: function(response) {
					var result = response.toString().trim();
					if (result=="true") {
						$("#userExist").show();
					}
				},
				 error: function(msg) {
					alert(msg);
				} 
			});
		});
	}); 
	
	$(document).ready(function() {
		$("#loginForm").on("submit", validateForm);
		$("#r_username").on("blur", function() {
			$("#userExist").hide();
			$.ajax({
				url: "validation",
				type: "get",
				dataType: "html",
				data: {name: $("#r_username").val()},
				success: function(response) {
					var result = response.toString().trim();
					if (result=="true") {
						$("#userExist").show();
					}
				},
				error: function(msg) {
					alert(msg);
				}
			});
		});
	});
 	function validateForm() {
		$("#nameAndAgeReq").hide();
		$("#nameReq").hide();
		$("#ageReq").hide();
		$("#ageIllegal").hide();
		var name = $("#r_username").val();
		var age = $("#j_age").val();
		if (name.length==0 && age.length==0) {
			$("#nameAndAgeReq").show();
			return false;
		} else if (name.length==0) {
			$("#nameReq").show();
			return false;
		} else if (age.length==0) {
			$("#ageReq").show();
			return false;
		} else if (!($.isNumeric(age) && Math.floor(age)==age)) {
			$("#ageIllegal").show();
			return false;
		} 
		return true;
	}*/ 
	
	
	
	</script>






<style>
.ccc {
  -webkit-border-radius: 50em;
  -moz-border-radius: 50em;
  border-radius: 50em;
}


@font-face {
   font-family: myFirstFont;
   src: url('XTREE.ttf');
 
}

div#aaa {
   font-family: myFirstFont;
}



	.alert {
		color: red;
		
		font-size: 15px;
		line-height: 16px;
		width: 300px;
		margin: 10;
		position: right;
	}

.col-md-4{
        color:red;
        font-size:15px;
        line-height:16px;
        width:300px;
        margin:10;
        position:relative;
}

input.ng-invalid.ng-dirty{
	border: 2px solid #FF6666;
}

.col-md-4 {
	color: red;
}

</style>

<script>
	    var app = angular.module('MyApp', []);
    
    app.controller('appCtrl', function($scope, $http ) {
        $scope.user = {
                username: "",
                password: "",
                
            };
        $scope.users = [];
        
      });
    
    
    app.directive("passwordVerify", function() {
           return {
              require: "ngModel",
              scope: {
                passwordVerify: '='
              },
              link: function(scope, element, attrs, ctrl) {
                scope.$watch(function() {
                    var combined;

                    if (scope.passwordVerify || ctrl.$viewValue) {
                       combined = scope.passwordVerify + '_' + ctrl.$viewValue; 
                    }                    
                    return combined;
                }, function(value) {
                    if (value) {
                        ctrl.$parsers.unshift(function(viewValue) {
                            var origin = scope.passwordVerify;
                            if (origin !== viewValue) {
                                ctrl.$setValidity("passwordVerify", false);
                                return undefined;
                            } else {
                                ctrl.$setValidity("passwordVerify", true);
                                return viewValue;
                            }
                        });
                    }
                });
             }
           };
        });

    var md5Encrypt = function(form){
    	$("#r_password").val((md5($("#r_password").val())));
    	return true;
    }
    var loginEncrypt = function(form){
    	$("#j_password").val(md5($("#j_password").val()));
    	return true;
    }
	</script>

  
</head>
<body class="blueprint fixed-navbar" ng-app="MyApp" >

  
  <div class="push-footer-wrapper">

    <div id="" class="navbar navbar-default navbar-px" role="navigation">
      <div class="container-fluid">

      <!--  <a class="navbar-brand pixelapse-30-logo" href="/"><img alt="Pixelapse logo 15 white" src="https://d340syr2dan8gj.cloudfront.net/assets/media/pixelapse_logo_15_white-99fb68c1a2951ec8b3dc6c5cecddb9fd.png" /></a>
      -->

        <ul class="nav navbar-nav">

          <!-- Gallery -->
    <!--      <li class="active">
            <a id="header_gallery" href="/explore">
              <i class="icon-globe"></i> Explore
            </a>
          </li>
    -->

          <!-- Showcases -->
    <!--      <li class="">
            <a id="header_designers" href="/showcases">
              <i class="icon-star"></i><span class="hidden-xs"> Showcases</span>
            </a>
          </li>
    -->


<div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active dropdown">
          <a id="header_designers" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="/designers" >
            <i class="icon-profile-circle"></i><span class="hidden-xs"  > Designers</span>
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu" role="menu" aria-labelledby="header_designers">
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#top" ><img class="ccc"src="./images/on.jpg"/> Oscar Ni</a></li>
            <li role="presentation" class="divider"></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#table"><img class="ccc"src="./images/mn.jpg"/>Michael Nie </a></li>
            <li role="presentation" class="divider"></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#typograph"> <img class="ccc"src="./images/cwq.jpg">Cassie Cheng</a></li>
          </ul>
        </li>
      </ul>
    
        <!-- Designers -->
       <!--   <li class="">
            <a id="header_designers" href="/designers">
              <i class="icon-profile-circle"></i><span class="hidden-xs"> Designers</span>

            </a>
          </li>
        -->
     



      </div>




          <!-- Designers -->
      <!--    <li class="">
            <a id="header_designers" href="/designers">
              <i class="icon-profile-circle"></i><span class="hidden-xs"> Designers</span>

            </a>
          </li>
       -->



          <!-- Design Tennis -->
          <!-- <li class="hidden">
            <a id="header_designtennis" href="http://designtennis.io">
              Design Tennis
            </a>
          </li> -->

        </ul>

        <ul class="nav navbar-nav navbar-right">


       <!-- <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" >
        Log In
        </button>
       -->



    <div class="alert" style="display:none;" id="usernameAndPasswordReq">
      <p>Username and password are required</p>
    </div>

    <div class="alert" style="display:none;" id="usernameReq">
      <p>Username is required</p>
    </div>
    <div class="alert" style="display:none;" id="passwordReq">
      <p>Password is required</p>
    </div>
    <div class="alert" id="wrongCredentials" style="display:none;">
      <p>The username or password supplied is incorrect</p>
    </div>
      
       <form class="navbar-form navbar-right" action="<c:url value='j_spring_security_check'/>" method="POST" id="login-form" onSubmit="loginEncrypt(this)">
        <div class="form-group">
          <input type="text" placeholder="Username" class="form-control" name="j_username" id="j_username" />
        </div>
        <div class="form-group">
          <input type="password" placeholder="Password" class="form-control" name="j_password" id="j_password"/>
        </div>
        <button id="signin" type="submit" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-user"></span>Login</button>
        <!-- End of Login Form -->
      </form>





     <!--  <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        Sign In
        </button>
    -->


        <!--    <li class=""><a href="/login">Login</a></li>
            <li class=""><a href="/signup" class="btn btn-default navbar-btn" role="button">Sign Up</a></li>
         -->

        </ul>

      </div>
    </div>

    
  <!-- <div class="push-footer-wrapper"> -->
    



    

<div id="px-open-header" class="background-gradient-4 px-profile fixed-header jumbotron">
  <canvas id="animated-canvas"></canvas>
  <div class="bg-overlay bg-overlay-on"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-10 col-lg-offset-1">
        <div><i class="icon-globe icon-60"></i></div>
        <h1>Yahoo Finance System</h1>
        <!-- <h1>Better designs start with collaboration</h1> -->
        <!-- <p>AN OPEN SOURCE COLLABORATIVE PLATFORM POWERED BY PIXELAPSE</p> -->
        

      <!--  <p>Design is fundamentally collaborative. We believe that the best ideas grow and expand with the input of others. Please join us and take part in the <a href="/open">open design movement</a></p>
      -->

      </div>
    </div>
  </div>
</div>

</script>





    <!-- <div class="push-footer"></div> -->
  <!-- </div> -->




    <div class="push-footer"></div>

  </div>

      <footer>
    <div class="footer-top">
      <div class="container">

        <div class="row">

          <div class="col-xs-6 col-md-3 random-project">
           <!--  <i class="icon-pixelapse icon-28"></i>   -->
           <!-- <h4>Pixelapse</h4> -->
            <p class="footer-para">
              <large><strong>
               New User
                <!-- We streamline the design workflow for thousands of creatives. -->
              </strong></large>
            </p>
             




        <a href="#" class="btn btn-info btn-sm"  data-toggle="modal"  data-target="#myModal">
          <span class="glyphicon glyphicon-user"></span>Sign Up 
        </a>
         

         <br/>
         <br/>
         <br/>
         

         <!--   <p><a href="/signup" class="btn btn-default">Sign In</a></p>  -->
              



          </div>

          <div class="col-xs-6 col-md-3">
            <i class="icon-globe icon-28"></i>
            <h4>Community</h4>
        

            <a href="/explore">
              <strong>Global Finance System</strong>
             
            </a>
            <a href="/designers">
              <strong>Twitter</strong>
                <i class="icon-twitter icon-24"></i>
           <h4>Connect</h4>
           </a>
           <a>
           <strong>Facebook</strong>
             <i class="icon-facebook icon-24"></i>
           <h4>Connect</h4>
            </a>




          </div>



         

         <div class="col-xs-6 col-md-6">
           <!-- <i class="icon-toolkit icon-28"></i>
           <h4>Resources</h4> -->
            
             
            <div id="aaa" style="height:120px;width:250px;position:absolute; border-radius: 10em"><center>Merry Christmas </center></div>

             <br/>
             <br/>
             <br/>
             <br/>
             <br/>
             <br/>
             <br/>
             <br/>
           <p id="demo"></p>


          <!--  <a href="https://toolbelt.pixelapse.com">
            <strong>The Design Toolbelt</strong>
            <p><small>Image Inspector, Color Picker, Lorem Ipsum, and more</small></p>
          </a>
          <a href="https://bold.pixelapse.com">
            <strong>BOLD.</strong>
            <p><small>Quality design articles</small></p>
          </a> 
         </div>
       
         <div class="col-xs-6 col-md-3">
           <i class="icon-broadcast icon-28"></i>
           <h4>Connect</h4>
           <a href="/contact">
             <strong>Say hello!</strong>
           </a>
           <a href="http://blog.pixelapse.com">
             <strong>Pixelapse Blog</strong>
           </a>
           <p>
             <a href="http://twitter.com/pixelapse" target="_blank" class="social-link">
               <i class="icon-twitter icon-24"></i>
             </a>
             <a href="http://facebook.com/pixelapse" target="_blank" class="social-link">
               c
             </a>
           </p>
         </div> -->


        </div>

      </div>

    </div>

    <div class="footer-bottom">
      <div class="container">
        <div class="row">
           <div class="col-xs-12">
           <!-- <p>
             <a href="/tour">Tour</a>
             <a href="/features">Features</a>
             <a href="/business">Teams</a>
             <a href="/pricing">Plans &amp; Pricing</a>
             <a href="/sync">Sync+</a>
             -->
             <span class="dot-divider">&middot;</span>

            <!--  <a href="/install">Install</a>
                       </p>  -->
          <!--  <p>
            <a href="/about">About</a>
            <a href="/jobs">Jobs</a>
            <a href="/media">Press Kit</a>
            <a href="/legal">Legal</a>
            <a href="/help">Help</a>
          </p>  -->
            <div class="footer-notice">
            <br/>
              <p><large><center>Copyright By Oscar, Michael,Cassie</large></small></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>




<!-- Modal -->  
  


  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="myModalLabel">Forms</h4>
        </div>
        <div class="modal-body">
          <form class="form-horizontal" name="registerform" onSubmit="md5Encrypt(this)" role="form" action="register.html" method="POST" id="register-form">
          <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Required Field</strong></div>
          <div class="form-group">
              <label for="r_username" class="col-sm-2 control-label">Username:</label>
              <span class="glyphicon glyphicon-asterisk"></span>
              
              <div class="col-sm-6">
                <input type="text" class="form-control" name="r_username" id="r_username" ng-model="user.username" placeholder="Username" required>
                <span class="col-md-4" ng-show="registerform.r_username.$dirty && registerform.r_username.$invalid">Required</span>
              </div>
            </div> 
            
            <div class="alert" style="display:none;" id="userExist">
	        <p>The user already exists</p>
            </div>
          
          <div class="form-group">
              <label for="r_password" class="col-sm-2 control-label">Password:</label>
              <span class="glyphicon glyphicon-asterisk"></span>
              <div class="col-sm-6">
                <input type="password" class="form-control" name="r_password" ng-model="user.r_password" id="r_password" placeholder="Password must between 6 to 20" required ng-minlength="6" ng-maxlength="20">
                <span class="col-md-4" ng-show="registerform.r_password.$dirty && registerform.r_password.$error.required">Required</span>
                <span class="col-md-4" ng-show="registerform.password.$dirty && (registerform.password.$error.minlength || registerform.password.$error.maxlength)">6 to 20 characters</span>

              </div>
            </div>


          <div class="form-group">
          <label class="control-label col-sm-2" for="pwd1">Confirm Password:</label>
          <span class="glyphicon glyphicon-asterisk"></span>
          <div class="col-sm-6">          
          <input type="password" class="form-control" name="r_r_password" id="r_r_password" ng-model="user.r_r_password" password-verify="user.r_password" placeholder="Re-enter password must between 6 to 20" required ng-minlength="6" ng-maxlength="20">
          </div>
         <span class="col-md-4" ng-show="registerform.r_r_password.$dirty && registerform.r_r_password.$error.required">Required</span>
         <span class="col-md-4" ng-show="registerform.r_r_password.$dirty && registerform.r_r_password.$error.passwordVerify">Password does not match</span>
           <span class="col-md-4" ng-show="registerform.password.$dirty && (registerform.password.$error.minlength || registerform.password.$error.maxlength)">6 to 20 characters</span>
          <!-- <button type="button" onclick="check()" value="Check">Check</button> -->
        </div>

          <div class="form-group">
          <label class="control-label col-sm-2" for="r_firstname">Firstname:</label>
          <span class="glyphicon glyphicon-asterisk"></span>
          <div class="col-sm-6">
            <input onclick="check()"type="text" class="form-control" name="r_firstname" id="r_firstname" ng-model="user.r_firstname" placeholder="Enter Firstname" required>
         	<span class="col-md-4" ng-show="registerform.r_firstname.$dirty && registerform.r_firstname.$error.required">Required</span>

          </div>
        </div>


           <div class="form-group">
          <label class="control-label col-sm-2" for="r_lastname">Lastname:</label>
          <span class="glyphicon glyphicon-asterisk"></span>
          <div class="col-sm-6">
            <input type="text" class="form-control" name="r_lastname" id="r_lastname" ng-model="user.r_lastname" placeholder="Enter Lastname" required>
            <span class="col-md-4" ng-show="registerform.r_lastname.$dirty && registerform.r_lastname.$error.required">Required</span>

          </div>
        </div>


            <div class="form-group">
              <label for="r_email" class="col-sm-2 control-label">Email:</label>
              <span class="glyphicon glyphicon-asterisk"></span>
              <div class="col-sm-6">
                <input type="email" class="form-control" name="r_email" id="r_email" ng-model="user.r_email" ng-pattern="/^[a-z]+[a-z0-9._]+@[a-z]+\.[a-z.]{2,5}$/"  placeholder="Email" required>
                    <span class="col-md-4" ng-show="registerform.r_email.$dirty && registerform.r_email.$error.required">Required</span>
                    <span class="col-md-4" ng-show="registerform.r_email.$dirty && registerform.r_email.$error.email">Invalid Email</span>
              </div>
            </div>
            
         

        <div class="form-group">
          <label class="control-label col-sm-2" for="r_address">Address:</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" name="r_address" id="r_address" ng-model="user.r_address" placeholder="Enter address">
            <span class="col-md-4" ng-show="registerform.r_address.$dirty && registerform.r_address.$error.required">Required</span>
          </div>
        </div>



         <div class="form-group">
          <label class="control-label col-sm-2" for="r_city">City:</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" name="r_city" id="r_city" placeholder="Enter city">
          </div>
        </div>

         <div class="form-group">
          <label class="control-label col-sm-2" for="r_state">State:</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" name="r_state" id="r_state" placeholder="Enter state">
          </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-2" for="r_zipcode">Zipcode:</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" name="r_zipcode" id="r_zipcode" placeholder="Enter state">
          </div>
        </div>

           <div class="form-group">
          <label class="control-label col-sm-2" for="r_phone">Phone:</label>
          <div class="col-sm-6">          
            <input type="text" class="form-control" name="r_phone" id="r_phone" placeholder="Enter phone">
          </div>
        </div>


          
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" >Sign Up</button>
              </div>
            </div>
          </form>
          
        </div>
        





      
      </div>
    </div>
  </div>


  <div id="global-loading" style="display:none;">
    <div class="spinner-dark"></div>
  </div>

  <div id="loading-bar"></div>

    <script type="text/template" id="timeline_item_template">

    {{ var item_color = getActivityColor(item.get("type")); }}
    {{ var item_icon_type = getActivityIcon(item.get("type")); }}
    {{ var timezone = 'America/Los_Angeles'; }}
    {{ var convert_timezone = new Date (item.get("created_at")); }}

    {{ if (window.preferences) { }}
    {{  timezone = window.preferences.preferences_saved_timezone || 'America/Los_Angeles'; }}
    {{ } }}

    {{ var comment_date = moment(convert_timezone).tz(timezone).format('D MMM'); }}
    {{ var comment_time = moment(convert_timezone).tz(timezone).format('hh:mm A'); }}

    <div class="timeline-item-line"></div>
    <div class="timeline-item-content">
      <div class="timeline-item-date">
        <span>
          <b>{{= comment_date}}</b><br/>
          {{= comment_time}}
        </span>
      </div>
      <div class="timeline-item-icon background-{{= item_color }}">
        <div class="timeline-item-icon-wrapper {{= item_icon_type }}"></div>
        <div class="timeline-item-datetime"></div>
      </div>
      <div class="timeline-item-body">
        <div class="timeline-item-avatar">
          {{ if (item.get("user") && item.get("user").length > 0 ) { }}
            <div class="user-avatar user-avatar-inline user-avatar-30 user-avatar-round">
              <img src="{{= item.get("user")[0].avatar_url }}" />
            </div>
            {{ if (item.get("user").length > 1 ) { }}
              <div class="timeline-item-avatar-count"><span>{{= item.get("user").length }}</span></div>
            {{ } }}
          {{ } }}
        </div>
        <div class="timeline-item-avatar-content">
          <div class="timeline-item-label-datetime">{{= prettyDate(item.get("created_at")) }}</div>
          <div class="timeline-item-label">
            {{= item.get("message_html") }}
          </div>
          {{ if (_.contains(["CommentedActivity", "AssignedActivity", "ResolvedActivity", "TeamMemberAddedActivity", "AddNotesActivity", "FlagMilestoneActivity"], item.get("type")) && item.get("caption") && item.get("caption").length > 0) { }}
              {{ _.each(item.get("caption"), function(c, i) { if(c) { }}
              <div class="timeline-item-comment">
                <span>{{= c }}</span>
              </div>
              {{ } }); }}
          {{ } }}
          {{ if (item.get("type") != "CommentedActivity" && item.get("image_url") && item.get("image_url").length > 0 ) { }}
            <div class="timeline-item-img">
              {{ _.each(item.get("image_url"), function(image, i) { }}
                {{ if (item.get("title_url")[i]) { }}
                  <a title="{{= item.get("title")[i] }}" rel="tooltip" href="{{= item.get("title_url")[i] }}"><img src="{{= image }}" /></a>
                {{ } else { }}
                  <img title="{{= item.get("title")[i] }}" rel="tooltip" src="{{= image }}" />
                {{ } }}
              {{ }); }}
            </div>
          {{ } }}
        </div>
      </div>
    </div>
  </script>




  <div pub-key="pub-67f7a52b-4a10-4b99-9867-0dd9c3c39763" sub-key="sub-04ec04a1-64b2-11e1-b6c4-9344aa4658bd" ssl="on" origin="pubsub.pubnub.com" id="pubnub"></div>

  <script src="https://d340syr2dan8gj.cloudfront.net/assets/application-9a68fe5a983fb328eff63e1a9bc920e5.js"></script>
  

  <script type='text/javascript'>
    var zero_clipboard_path="https://d340syr2dan8gj.cloudfront.net/assets/ZeroClipboard-c1e4cf7d0de2fa8b5a516d5993c1c04d.swf";window.current_username="",window.current_user_id=-1,window.current_user=-1,window.user_signed_in=!1,window.preferences={}
      function adjustFeedHeight(){$(".header-timeline-list").css("max-height",$(window).height()-200+"px")}function promptNewNotifications(){$(".notification-dropdown .dropdown-menu-prompt").removeClass("hidden"),$(".notification-dropdown .dropdown-menu-prompt").slideDown(),setTimeout(function(){$(".notification-dropdown .dropdown-menu-prompt").slideUp(700,function(){$(".notification-dropdown .dropdown-menu-prompt").addClass("hidden")})},3e3)}$(function(){$(window).resize(function(){adjustFeedHeight()})}),adjustFeedHeight(),ActivityItem=Backbone.Model.extend({}),ActivityList=Backbone.Collection.extend({model:ActivityItem,url:function(){return"/api/feed.json?username="+window.current_username}}),ActivityItemView=Backbone.View.extend({template:_.template($("#timeline_item_template").html()),tagName:"li",initialize:function(){_.bindAll(this,"render"),this.model.on("change",this.render,this),this.model.on("destroy",this.remove,this)},events:{},render:function(){return $(this.el).html(this.template({item:this.model})),this},remove:function(){$(this.el).fadeOut(300,function(){$(this).remove()})}}),ActivityListView=Backbone.View.extend({events:{},initialize:function(){_.bindAll(this,"addItem","render"),this.collection.bind("add",this.addItem,this),this.collection.bind("reset",this.render,this)},render:function(){return this.setElement($("#activity-list-el")),$(this.el).find("li:not(.timeline-new-comment)").remove(),this.collection.each(this.addItem),this},addItem:function(a){if(a.get("id")&&a.get("message_html")&&a.get("message_html")!="Error"){var b=new ActivityItemView({model:a});$(this.el).append(b.render().el)}}}),activity_list=new ActivityList,activity_list_view=new ActivityListView({collection:activity_list});var firstFeedMouse=!0;$(".btn-notification").on("click",function(){analytics_track("[Action] Toggle Feed Dropdown"),$(".btn-notification").hasClass("btn-notification-on")&&($(".btn-notification").removeClass("btn-notification-on"),$(".btn-notification").addClass("btn-notification-off"),$(".btn-notification").html("0"),$(".header-timeline-header").delay(2e3).slideUp(1e3,function(){$(".header-timeline-header-on").removeClass("header-timeline-header-on")}),$.post("/api/feeds_all_read"))}),$(".notification-dropdown, .profile-dropdown").on("mouseenter",function(){firstFeedMouse&&(firstFeedMouse=!1,$.get("/api/feed.json?username="+window.current_username,{}).success(function(a){activity_list.reset(a.feeds),activity_list.length==0&&$(".header-timeline-empty").show()}).error(function(){}))})

  </script>

    <script type='text/javascript'>
    window.init_projects_json = {"category":"featured","per_page":10,"page":1,"previous_page_url":null,"previous_page_api_url":null,"next_page_url":"http://www.pixelapse.com/explore/featured/2","next_page_api_url":null,"projects_count":10,"files_count":53,"projects":[{"id":5554205,"revisions_count":0,"comments_count":0,"loves_count":0,"created_at":"2014-05-21T17:46:30.364Z","updated_at":"2014-11-11T13:57:07.845Z","public_datetime":"2014-10-16T16:05:11.385Z","last_rev_update":null,"featured_notes":"","featured_at":"2014-10-23T01:51:43.348Z","description":"","views_count":0,"is_public":true,"is_root_public":true,"preview":false,"filesystem":"pixelapse","url":"http://www.pixelapse.com/yelp/projects/public/overview","filename":"public","cover_img_url":"https://img-pixelapse.s3.amazonaws.com/67135/8034560/img_5570085.png?AWSAccessKeyId=AKIAJXL2IXYH62T5HXDA&Expires=1479757515&Signature=byGAYKeoXsZMJng9JqK3Ns2T2sM%3D","file_types_count":[{"count":2,"extension":"psd"}],"total_items_count":5,"total_files_count":4,"cover_img_url_blur":"https://pixelapse.imgix.net/67135/8034560/img_5570085.png?blur=60&fm=jpg&q=85&s=f564b0fe7001a6fef186d501ccea6f23","cover_img_url_800":"https://pixelapse.imgix.net/67135/8034560/img_5570085.png?w=800&s=36718726fc13672c3bc83a029c93d2c9","cover_img_url_800_blur":"https://pixelapse.imgix.net/67135/8034560/img_5570085.png?w=800&blur=60&fm=jpg&q=85&s=98c28acfd16d29f16a5c74981118bcbf","cover_img_url_400":"https://pixelapse.imgix.net/67135/8034560/img_5570085.png?w=400&s=76ebdee28fd58a7ad00864191c495666","cover_img_url_400_blur":"https://pixelapse.imgix.net/67135/8034560/img_5570085.png?w=400&blur=60&fm=jpg&q=85&s=16a6907f4d0494c74ef83bdb657ac1b0","tags":"","items_count":3,"snapshots":[{"id":8034560,"created_at":"2014-10-24T20:44:03.451Z","updated_at":"2014-10-27T17:29:01.622Z","last_rev_update":"2014-10-27T16:28:29.213Z","filename":"cover.psd","extension":"psd","pages_count":null,"width":1761,"height":1320,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/67135/8034560/img_small_5570085.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/67135/8034560/img_medium_5570085.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/67135/8034560/img_large_5570085.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/67135/8034560/img_5570085.png","image_url_jpg":"https://pixelapse.imgix.net/67135/8034560/img_5570085.png?&s=bcee6c84ef98e5ff68152bc958b0686a","image_url_square":"https://pixelapse.imgix.net/67135/8034560/img_5570085.png?&s=bcee6c84ef98e5ff68152bc958b0686a","preview_ready":true},{"id":7045076,"created_at":"2014-09-19T21:27:43.682Z","updated_at":"2014-10-27T17:29:01.622Z","last_rev_update":"2014-09-19T21:28:43.457Z","filename":"yelp-styleguide.psd","extension":"psd","pages_count":null,"width":1280,"height":5886,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/25699/7045076/img_small_4969574.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/25699/7045076/img_medium_4969574.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/25699/7045076/img_large_4969574.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/25699/7045076/img_4969574.png","image_url_jpg":"https://pixelapse.imgix.net/25699/7045076/img_4969574.png?&s=db720e7c26a7bc2ecd2b194acb00975b","image_url_square":"https://pixelapse.imgix.net/25699/7045076/img_4969574.png?&s=db720e7c26a7bc2ecd2b194acb00975b","preview_ready":true}],"user":{"id":64714,"username":"yelp","first_name":null,"last_name":null,"avatar_url":"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xaf1/t1.0-1/c12.12.155.155/398397_10150594226702886_1289227296_n.jpg","profile_url":"http://www.pixelapse.com/yelp"}},{"id":7719287,"revisions_count":0,"comments_count":0,"loves_count":0,"created_at":"2014-10-10T21:13:42.191Z","updated_at":"2014-11-14T06:09:03.125Z","public_datetime":"2014-10-10T21:13:42.227Z","last_rev_update":null,"featured_notes":"","featured_at":"2014-11-13T00:15:59.358Z","description":"Mobile Music Player concept","views_count":0,"is_public":true,"is_root_public":true,"preview":false,"filesystem":"pixelapse","url":"http://www.pixelapse.com/sok/projects/Mobile%20Music%20Player/overview","filename":"Mobile Music Player","cover_img_url":"https://img-pixelapse.s3.amazonaws.com/68065/7719410/img_5289939.png?AWSAccessKeyId=AKIAJXL2IXYH62T5HXDA&Expires=1479757515&Signature=DWG33xYGFPYJnhMtjjk8YciIHJk%3D","file_types_count":[{"count":3,"extension":"psd"}],"total_items_count":4,"total_files_count":4,"cover_img_url_blur":"https://pixelapse.imgix.net/68065/7719410/img_5289939.png?blur=60&fm=jpg&q=85&s=e44388fdcd9b47a98f3745b58736771a","cover_img_url_800":"https://pixelapse.imgix.net/68065/7719410/img_5289939.png?w=800&s=d00051478be5ea01ccf312b5cb619481","cover_img_url_800_blur":"https://pixelapse.imgix.net/68065/7719410/img_5289939.png?w=800&blur=60&fm=jpg&q=85&s=b216a63a45c865e77af37f7e52f611d5","cover_img_url_400":"https://pixelapse.imgix.net/68065/7719410/img_5289939.png?w=400&s=2a665ef980b59ecd5adb63079204526e","cover_img_url_400_blur":"https://pixelapse.imgix.net/68065/7719410/img_5289939.png?w=400&blur=60&fm=jpg&q=85&s=c71ec75bd1aeeaec7c5dd4f90617463e","tags":"mobile","items_count":4,"snapshots":[{"id":7719410,"created_at":"2014-10-10T21:32:33.302Z","updated_at":"2014-10-10T21:32:51.302Z","last_rev_update":"2014-10-10T21:32:42.377Z","filename":"cover.psd","extension":"psd","pages_count":null,"width":2400,"height":1800,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/68065/7719410/img_small_5289939.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/68065/7719410/img_medium_5289939.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/68065/7719410/img_large_5289939.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/68065/7719410/img_5289939.png","image_url_jpg":"https://pixelapse.imgix.net/68065/7719410/img_5289939.png?&s=97db1097f2e9e7d8674cdd877d52687e","image_url_square":"https://pixelapse.imgix.net/68065/7719410/img_5289939.png?&s=97db1097f2e9e7d8674cdd877d52687e","preview_ready":true},{"id":7719323,"created_at":"2014-10-10T21:21:05.163Z","updated_at":"2014-10-10T21:21:18.187Z","last_rev_update":"2014-10-10T21:21:13.347Z","filename":"mp.psd","extension":"psd","pages_count":null,"width":640,"height":1136,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/68065/7719323/img_small_5289894.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/68065/7719323/img_medium_5289894.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/68065/7719323/img_large_5289894.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/68065/7719323/img_5289894.png","image_url_jpg":"https://pixelapse.imgix.net/68065/7719323/img_5289894.png?&s=90a9326ace7d6d2ba9308c59964229f4","image_url_square":"https://pixelapse.imgix.net/68065/7719323/img_5289894.png?&s=90a9326ace7d6d2ba9308c59964229f4","preview_ready":true},{"id":7719320,"created_at":"2014-10-10T21:20:54.709Z","updated_at":"2014-10-10T21:21:04.940Z","last_rev_update":"2014-10-10T21:21:01.310Z","filename":"iphone.psd","extension":"psd","pages_count":null,"width":640,"height":1136,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/68065/7719320/img_small_5289892.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/68065/7719320/img_medium_5289892.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/68065/7719320/img_large_5289892.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/68065/7719320/img_5289892.png","image_url_jpg":"https://pixelapse.imgix.net/68065/7719320/img_5289892.png?&s=cf3a32501c7925cbc5081c5001957962","image_url_square":"https://pixelapse.imgix.net/68065/7719320/img_5289892.png?&s=cf3a32501c7925cbc5081c5001957962","preview_ready":true}],"user":{"id":68065,"username":"sok","first_name":"Simeon","last_name":"","avatar_url":"https://secure.gravatar.com/avatar/76d40816eeb5574e5b34cdf3a91a68d4?s=90&d=https://s3.amazonaws.com/pixelapse-assets/pixelapse-avatar-small.png","profile_url":"http://www.pixelapse.com/sok"}},{"id":7938638,"revisions_count":0,"comments_count":0,"loves_count":0,"created_at":"2014-10-20T21:40:57.249Z","updated_at":"2014-11-13T00:16:34.349Z","public_datetime":"2014-10-20T21:40:57.274Z","last_rev_update":null,"featured_notes":"","featured_at":"2014-11-13T00:14:55.430Z","description":"Some common Mobile UI elements","views_count":0,"is_public":true,"is_root_public":true,"preview":false,"filesystem":"pixelapse","url":"http://www.pixelapse.com/chrometaphore/projects/Mobile%20UI%20Blueprint/overview","filename":"Mobile UI Blueprint","cover_img_url":"https://img-pixelapse.s3.amazonaws.com/68668/7954406/img_5457252.png?AWSAccessKeyId=AKIAJXL2IXYH62T5HXDA&Expires=1479757515&Signature=yUXf%2FIIKFfInsVYHw6lKLm3EIPM%3D","file_types_count":[{"count":2,"extension":"psd"},{"count":1,"extension":"png"}],"total_items_count":4,"total_files_count":4,"cover_img_url_blur":"https://pixelapse.imgix.net/68668/7954406/img_5457252.png?blur=60&fm=jpg&q=85&s=2e165c95bee00c31c76cebc9ce318e22","cover_img_url_800":"https://pixelapse.imgix.net/68668/7954406/img_5457252.png?w=800&s=24eb87aa3ce2e45f424f9fd13ceb3f83","cover_img_url_800_blur":"https://pixelapse.imgix.net/68668/7954406/img_5457252.png?w=800&blur=60&fm=jpg&q=85&s=47bdbad92e4d2d42656ec1cd381fe9a3","cover_img_url_400":"https://pixelapse.imgix.net/68668/7954406/img_5457252.png?w=400&s=13dedf3954d05909ff2a6afd94a7d5b6","cover_img_url_400_blur":"https://pixelapse.imgix.net/68668/7954406/img_5457252.png?w=400&blur=60&fm=jpg&q=85&s=a18f410d57fe1114635f15de4d9c003f","tags":"blueprint, wireframe","items_count":4,"snapshots":[{"id":7954406,"created_at":"2014-10-21T18:34:16.427Z","updated_at":"2014-10-21T18:34:34.786Z","last_rev_update":"2014-10-21T18:34:25.350Z","filename":"cover.png","extension":"png","pages_count":null,"width":2400,"height":1800,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/68668/7954406/img_small_5457252.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/68668/7954406/img_medium_5457252.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/68668/7954406/img_large_5457252.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/68668/7954406/img_5457252.png","image_url_jpg":"https://pixelapse.imgix.net/68668/7954406/img_5457252.png?&s=71794408c44ea4d8532ce9a093b8ca3c","image_url_square":"https://pixelapse.imgix.net/68668/7954406/img_5457252.png?&s=71794408c44ea4d8532ce9a093b8ca3c","preview_ready":true},{"id":7938641,"created_at":"2014-10-20T21:41:36.404Z","updated_at":"2014-10-20T21:42:12.275Z","last_rev_update":"2014-10-20T21:41:47.922Z","filename":"Mobile_UI_blueprint_1.3_-_long_view.psd","extension":"psd","pages_count":null,"width":1146,"height":10375,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/68668/7938641/img_small_5440524.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/68668/7938641/img_medium_5440524.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/68668/7938641/img_large_5440524.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/68668/7938641/img_5440524.png","image_url_jpg":"https://pixelapse.imgix.net/68668/7938641/img_5440524.png?&s=f1d6cdde987d9a6263e9408cb758ba7f","image_url_square":"https://pixelapse.imgix.net/68668/7938641/img_5440524.png?&s=f1d6cdde987d9a6263e9408cb758ba7f","preview_ready":true},{"id":7938647,"created_at":"2014-10-20T21:41:36.798Z","updated_at":"2014-10-20T21:41:59.753Z","last_rev_update":"2014-10-20T21:41:47.420Z","filename":"Mobile_UI_Blueprint_1.3.psd","extension":"psd","pages_count":null,"width":3202,"height":3131,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/68668/7938647/img_small_5440526.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/68668/7938647/img_medium_5440526.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/68668/7938647/img_large_5440526.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/68668/7938647/img_5440526.png","image_url_jpg":"https://pixelapse.imgix.net/68668/7938647/img_5440526.png?&s=0785d56de6276b983f3e25ef0a9c1819","image_url_square":"https://pixelapse.imgix.net/68668/7938647/img_5440526.png?&s=0785d56de6276b983f3e25ef0a9c1819","preview_ready":true}],"user":{"id":68668,"username":"chrometaphore","first_name":"Lorenzo","last_name":null,"avatar_url":"https://secure.gravatar.com/avatar/c9106bfece0ee98739646a229f8e30cb?s=200&d=https://s3.amazonaws.com/pixelapse-assets/pixelapse-avatar-medium.png","profile_url":"http://www.pixelapse.com/chrometaphore"}},{"id":7970987,"revisions_count":0,"comments_count":0,"loves_count":0,"created_at":"2014-10-22T19:40:17.884Z","updated_at":"2014-11-13T00:16:34.473Z","public_datetime":"2014-10-22T19:40:17.964Z","last_rev_update":null,"featured_notes":"","featured_at":"2014-11-13T00:14:18.763Z","description":"Working for a while on this Music App design UI Freebie :) ","views_count":0,"is_public":true,"is_root_public":true,"preview":false,"filesystem":"pixelapse","url":"http://www.pixelapse.com/ionutbondoc/projects/Musicapp%20Ui%20Kit/overview","filename":"Musicapp Ui Kit","cover_img_url":"https://img-pixelapse.s3.amazonaws.com/69235/7972796/img_5477407.png?AWSAccessKeyId=AKIAJXL2IXYH62T5HXDA&Expires=1479757515&Signature=mw2cMYpV6C1C8Rmh3RhxhTrtoFk%3D","file_types_count":[{"count":1,"extension":"txt"},{"count":1,"extension":"png"},{"count":1,"extension":"psd"}],"total_items_count":4,"total_files_count":4,"cover_img_url_blur":"https://pixelapse.imgix.net/69235/7972796/img_5477407.png?blur=60&fm=jpg&q=85&s=bef95ab7ac99b66b663ff1a54fda9b3c","cover_img_url_800":"https://pixelapse.imgix.net/69235/7972796/img_5477407.png?w=800&s=f7d68f817a1cac6c8000fcb325a2980c","cover_img_url_800_blur":"https://pixelapse.imgix.net/69235/7972796/img_5477407.png?w=800&blur=60&fm=jpg&q=85&s=37ddc0b3b45ac7556ceec6df0452ae3c","cover_img_url_400":"https://pixelapse.imgix.net/69235/7972796/img_5477407.png?w=400&s=8ad8b4763bcd2bd61a8818a6f6fedb32","cover_img_url_400_blur":"https://pixelapse.imgix.net/69235/7972796/img_5477407.png?w=400&blur=60&fm=jpg&q=85&s=95db66c92171d775dfd4e8f3a2d57baf","tags":"ui kit","items_count":4,"snapshots":[{"id":7972796,"created_at":"2014-10-23T01:52:13.546Z","updated_at":"2014-10-23T01:52:29.232Z","last_rev_update":"2014-10-23T01:52:20.196Z","filename":"cover.png","extension":"png","pages_count":null,"width":2400,"height":1800,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69235/7972796/img_small_5477407.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69235/7972796/img_medium_5477407.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69235/7972796/img_large_5477407.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69235/7972796/img_5477407.png","image_url_jpg":"https://pixelapse.imgix.net/69235/7972796/img_5477407.png?&s=d18a50ff27ef1a6c0c7820b4cb3e3049","image_url_square":"https://pixelapse.imgix.net/69235/7972796/img_5477407.png?&s=d18a50ff27ef1a6c0c7820b4cb3e3049","preview_ready":true},{"id":7971098,"created_at":"2014-10-22T19:52:40.931Z","updated_at":"2014-10-22T19:52:57.947Z","last_rev_update":"2014-10-22T19:52:54.831Z","filename":"MusicApp-Ui-Kit.psd","extension":"psd","pages_count":null,"width":1280,"height":1100,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69235/7971098/img_small_5474656.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69235/7971098/img_medium_5474656.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69235/7971098/img_large_5474656.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69235/7971098/img_5474656.png","image_url_jpg":"https://pixelapse.imgix.net/69235/7971098/img_5474656.png?&s=4057c9198d1aa911727e6db8c24b8464","image_url_square":"https://pixelapse.imgix.net/69235/7971098/img_5474656.png?&s=4057c9198d1aa911727e6db8c24b8464","preview_ready":true}],"user":{"id":69235,"username":"ionutbondoc","first_name":"Ionut Bondoc ( ÃÂ¢Ã¢â¬âÃÂºIB )","last_name":"","avatar_url":"https://s3.amazonaws.com/img-pixelapse/69235/7971005/img_medium_5474521.png","profile_url":"http://www.pixelapse.com/ionutbondoc"}},{"id":8034401,"revisions_count":0,"comments_count":0,"loves_count":0,"created_at":"2014-10-24T20:17:31.486Z","updated_at":"2014-11-13T00:16:34.657Z","public_datetime":"2014-10-24T20:17:31.549Z","last_rev_update":null,"featured_notes":"","featured_at":"2014-11-13T00:14:01.518Z","description":"We're gonna need some mockups soon for Apple's new product, Apple Watch. Some talented designers shared great mockups and I wanted to add on more for you. You're completely free to download & use this. No need credits but likes and shares will be appreciated!\n\nLove you all! Cheers.","views_count":0,"is_public":true,"is_root_public":true,"preview":false,"filesystem":"pixelapse","url":"http://www.pixelapse.com/yigitpinarbasi/projects/Apple%20Watch%20Flat%20Mockup/overview","filename":"Apple Watch Flat Mockup","cover_img_url":"https://img-pixelapse.s3.amazonaws.com/69433/8036984/img_5527986.png?AWSAccessKeyId=AKIAJXL2IXYH62T5HXDA&Expires=1479757516&Signature=wF54Fta6SJjes7%2F79W2Q79nRy7Y%3D","file_types_count":[{"count":1,"extension":"png"},{"count":1,"extension":"psd"}],"total_items_count":3,"total_files_count":3,"cover_img_url_blur":"https://pixelapse.imgix.net/69433/8036984/img_5527986.png?blur=60&fm=jpg&q=85&s=9eb52b2478f5c1f0adbae0a914570473","cover_img_url_800":"https://pixelapse.imgix.net/69433/8036984/img_5527986.png?w=800&s=76894ed5fa7728f16fcd193247748a73","cover_img_url_800_blur":"https://pixelapse.imgix.net/69433/8036984/img_5527986.png?w=800&blur=60&fm=jpg&q=85&s=a813a57f9fe1b410aa8359f481a2c7a9","cover_img_url_400":"https://pixelapse.imgix.net/69433/8036984/img_5527986.png?w=400&s=f32fe9c9dcb322ad37391ad380541aa5","cover_img_url_400_blur":"https://pixelapse.imgix.net/69433/8036984/img_5527986.png?w=400&blur=60&fm=jpg&q=85&s=37933a8bb32a5dafa89ffc1887dc9697","tags":"watch, apple watch","items_count":3,"snapshots":[{"id":8036984,"created_at":"2014-10-25T00:01:24.187Z","updated_at":"2014-10-25T00:01:39.265Z","last_rev_update":"2014-10-25T00:01:29.948Z","filename":"cover.png","extension":"png","pages_count":null,"width":2400,"height":1800,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69433/8036984/img_small_5527986.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69433/8036984/img_medium_5527986.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69433/8036984/img_large_5527986.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69433/8036984/img_5527986.png","image_url_jpg":"https://pixelapse.imgix.net/69433/8036984/img_5527986.png?&s=c6a9754a67c9a0e8b135fdb521d9d07a","image_url_square":"https://pixelapse.imgix.net/69433/8036984/img_5527986.png?&s=c6a9754a67c9a0e8b135fdb521d9d07a","preview_ready":true},{"id":8034425,"created_at":"2014-10-24T20:21:43.027Z","updated_at":"2014-10-24T20:21:56.710Z","last_rev_update":"2014-10-24T20:21:48.855Z","filename":"apple_watch_mockup.psd","extension":"psd","pages_count":null,"width":2400,"height":1800,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69433/8034425/img_small_5526298.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69433/8034425/img_medium_5526298.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69433/8034425/img_large_5526298.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69433/8034425/img_5526298.png","image_url_jpg":"https://pixelapse.imgix.net/69433/8034425/img_5526298.png?&s=29d9b578165bcd884ca04994d9e48c50","image_url_square":"https://pixelapse.imgix.net/69433/8034425/img_5526298.png?&s=29d9b578165bcd884ca04994d9e48c50","preview_ready":true}],"user":{"id":69433,"username":"yigitpinarbasi","first_name":"YiÃâÃÂ¸it PÃâÃÂ±narbaÃâ¦ÃÂ¸ÃâÃÂ±","last_name":"","avatar_url":"https://secure.gravatar.com/avatar/72020b69201158455aff5eb7f95ae13f?s=200&d=https://s3.amazonaws.com/pixelapse-assets/pixelapse-avatar-medium.png","profile_url":"http://www.pixelapse.com/yigitpinarbasi"}},{"id":7859861,"revisions_count":0,"comments_count":0,"loves_count":0,"created_at":"2014-10-18T00:50:42.590Z","updated_at":"2014-11-07T23:16:01.519Z","public_datetime":"2014-10-18T00:50:42.613Z","last_rev_update":null,"featured_notes":"","featured_at":"2014-10-29T22:30:42.200Z","description":"A collection of new designs for various apps","views_count":0,"is_public":true,"is_root_public":true,"preview":false,"filesystem":"pixelapse","url":"http://www.pixelapse.com/ray_design/projects/App%20Icon%20Redesign/overview","filename":"App Icon Redesign","cover_img_url":"https://img-pixelapse.s3.amazonaws.com/68863/7994471/img_5494135.png?AWSAccessKeyId=AKIAJXL2IXYH62T5HXDA&Expires=1479757516&Signature=js6jD8%2BWIi0TmR%2Byl13ehfBl06Y%3D","file_types_count":[{"count":8,"extension":"sketch"},{"count":8,"extension":"icns"},{"count":1,"extension":"png"}],"total_items_count":20,"total_files_count":18,"cover_img_url_blur":"https://pixelapse.imgix.net/68863/7994471/img_5494135.png?blur=60&fm=jpg&q=85&s=b696f6ba763c1298a9824ef43fbecd0b","cover_img_url_800":"https://pixelapse.imgix.net/68863/7994471/img_5494135.png?w=800&s=15b8da2a3e3e5d553152aba33daadf32","cover_img_url_800_blur":"https://pixelapse.imgix.net/68863/7994471/img_5494135.png?w=800&blur=60&fm=jpg&q=85&s=731eb71d022bfbd1e8fcb764fb8303ec","cover_img_url_400":"https://pixelapse.imgix.net/68863/7994471/img_5494135.png?w=400&s=8cb7ac3f8d8f29ced5b77a2c8c1fa3bb","cover_img_url_400_blur":"https://pixelapse.imgix.net/68863/7994471/img_5494135.png?w=400&blur=60&fm=jpg&q=85&s=924d05a888362015b2aef8a7edde5897","tags":"sketch, icon","items_count":4,"snapshots":[{"id":7994471,"created_at":"2014-10-23T17:06:05.099Z","updated_at":"2014-10-23T17:06:25.648Z","last_rev_update":"2014-10-23T17:06:17.879Z","filename":"cover.png","extension":"png","pages_count":null,"width":2400,"height":1800,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/68863/7994471/img_small_5494135.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/68863/7994471/img_medium_5494135.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/68863/7994471/img_large_5494135.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/68863/7994471/img_5494135.png","image_url_jpg":"https://pixelapse.imgix.net/68863/7994471/img_5494135.png?&s=d033277cd718c7f97fac6e1f38e88a15","image_url_square":"https://pixelapse.imgix.net/68863/7994471/img_5494135.png?&s=d033277cd718c7f97fac6e1f38e88a15","preview_ready":true},{"id":7955003,"created_at":"2014-10-21T18:51:06.092Z","updated_at":"2014-10-21T18:54:17.567Z","last_rev_update":"2014-10-21T18:51:35.275Z","filename":"OnmiFocus.sketch","extension":"sketch","pages_count":2,"width":960,"height":760,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/68863/7955003/img_small_5459204.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/68863/7955003/img_medium_5459204.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/68863/7955003/img_large_5459204.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/68863/7955003/img_5459204.png","image_url_jpg":"https://pixelapse.imgix.net/68863/7955003/img_5459204.png?&s=456799de82d11f1cfa3be2f57bc8de83","image_url_square":"https://pixelapse.imgix.net/68863/7955003/img_5459204.png?&s=456799de82d11f1cfa3be2f57bc8de83","preview_ready":true},{"id":7859912,"created_at":"2014-10-18T00:54:50.819Z","updated_at":"2014-10-21T18:53:51.532Z","last_rev_update":"2014-10-21T18:52:18.372Z","filename":"MPlayerX.sketch","extension":"sketch","pages_count":2,"width":1080,"height":880,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/68863/7859912/img_small_5459258.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/68863/7859912/img_medium_5459258.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/68863/7859912/img_large_5459258.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/68863/7859912/img_5459258.png","image_url_jpg":"https://pixelapse.imgix.net/68863/7859912/img_5459258.png?&s=cb55fa9a48fe7ad7abe995c6219e6aae","image_url_square":"https://pixelapse.imgix.net/68863/7859912/img_5459258.png?&s=cb55fa9a48fe7ad7abe995c6219e6aae","preview_ready":true},{"id":7859909,"created_at":"2014-10-18T00:54:48.836Z","updated_at":"2014-10-21T18:51:25.696Z","last_rev_update":"2014-10-18T00:55:08.650Z","filename":"iTerm.sketch","extension":"sketch","pages_count":2,"width":884,"height":684,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/68863/7859909/img_small_5399342.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/68863/7859909/img_medium_5399342.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/68863/7859909/img_large_5399342.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/68863/7859909/img_5399342.png","image_url_jpg":"https://pixelapse.imgix.net/68863/7859909/img_5399342.png?&s=7025f716da5b4799f89616b862495a9f","image_url_square":"https://pixelapse.imgix.net/68863/7859909/img_5399342.png?&s=7025f716da5b4799f89616b862495a9f","preview_ready":true},{"id":7859915,"created_at":"2014-10-18T00:54:51.247Z","updated_at":"2014-10-21T18:51:18.198Z","last_rev_update":"2014-10-18T00:55:10.212Z","filename":"iStatMenus.sketch","extension":"sketch","pages_count":2,"width":920,"height":720,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/68863/7859915/img_small_5399344.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/68863/7859915/img_medium_5399344.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/68863/7859915/img_large_5399344.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/68863/7859915/img_5399344.png","image_url_jpg":"https://pixelapse.imgix.net/68863/7859915/img_5399344.png?&s=45648aaf3cc0e0bf85cbd25cc59d73db","image_url_square":"https://pixelapse.imgix.net/68863/7859915/img_5399344.png?&s=45648aaf3cc0e0bf85cbd25cc59d73db","preview_ready":true}],"user":{"id":68863,"username":"ray_design","first_name":"Ray","last_name":null,"avatar_url":"https://s3.amazonaws.com/img-pixelapse/68863/7860077/img_medium_5399521.png","profile_url":"http://www.pixelapse.com/ray_design"}},{"id":7970981,"revisions_count":0,"comments_count":0,"loves_count":0,"created_at":"2014-10-22T19:39:55.406Z","updated_at":"2014-11-07T23:09:20.815Z","public_datetime":"2014-10-22T19:39:55.485Z","last_rev_update":null,"featured_notes":"","featured_at":"2014-10-28T22:03:10.620Z","description":"A free simple Flat Ui Kit","views_count":0,"is_public":true,"is_root_public":true,"preview":false,"filesystem":"pixelapse","url":"http://www.pixelapse.com/ionutbondoc/projects/Coloristico%20Flat%20Ui%20Kit/overview","filename":"Coloristico Flat Ui Kit","cover_img_url":"https://img-pixelapse.s3.amazonaws.com/69235/7972802/img_5477409.png?AWSAccessKeyId=AKIAJXL2IXYH62T5HXDA&Expires=1479757516&Signature=lBiKsSSQCZSqmPZMVD1d%2FOmAEZw%3D","file_types_count":[{"count":1,"extension":"psd"},{"count":1,"extension":"txt"},{"count":1,"extension":"png"}],"total_items_count":4,"total_files_count":4,"cover_img_url_blur":"https://pixelapse.imgix.net/69235/7972802/img_5477409.png?blur=60&fm=jpg&q=85&s=b50b045b8330bd9069d1854054ce4a36","cover_img_url_800":"https://pixelapse.imgix.net/69235/7972802/img_5477409.png?w=800&s=b9146164f4e7376ac7cfd0435fa793d7","cover_img_url_800_blur":"https://pixelapse.imgix.net/69235/7972802/img_5477409.png?w=800&blur=60&fm=jpg&q=85&s=91b571f56cae6e6a74e8ffb159a59baa","cover_img_url_400":"https://pixelapse.imgix.net/69235/7972802/img_5477409.png?w=400&s=25244c8a49f55dae191fbd26c7d5ee86","cover_img_url_400_blur":"https://pixelapse.imgix.net/69235/7972802/img_5477409.png?w=400&blur=60&fm=jpg&q=85&s=29ae1af3c9ccb760b7a190cc32c90be5","tags":"ui kit","items_count":4,"snapshots":[{"id":7972802,"created_at":"2014-10-23T01:52:13.773Z","updated_at":"2014-10-23T01:52:27.858Z","last_rev_update":"2014-10-23T01:52:19.129Z","filename":"cover.png","extension":"png","pages_count":null,"width":2400,"height":1800,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69235/7972802/img_small_5477409.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69235/7972802/img_medium_5477409.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69235/7972802/img_large_5477409.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69235/7972802/img_5477409.png","image_url_jpg":"https://pixelapse.imgix.net/69235/7972802/img_5477409.png?&s=eb2680e7ec45cfde5351d5b5c2d71fe0","image_url_square":"https://pixelapse.imgix.net/69235/7972802/img_5477409.png?&s=eb2680e7ec45cfde5351d5b5c2d71fe0","preview_ready":true},{"id":7971050,"created_at":"2014-10-22T19:48:41.618Z","updated_at":"2014-10-22T19:48:58.609Z","last_rev_update":"2014-10-22T19:48:55.364Z","filename":"Coloristico_Flat_Ui_Kit.psd","extension":"psd","pages_count":null,"width":1280,"height":1575,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69235/7971050/img_small_5474629.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69235/7971050/img_medium_5474629.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69235/7971050/img_large_5474629.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69235/7971050/img_5474629.png","image_url_jpg":"https://pixelapse.imgix.net/69235/7971050/img_5474629.png?&s=371f65f55ff9e7883d3084a2351bbf3a","image_url_square":"https://pixelapse.imgix.net/69235/7971050/img_5474629.png?&s=371f65f55ff9e7883d3084a2351bbf3a","preview_ready":true}],"user":{"id":69235,"username":"ionutbondoc","first_name":"Ionut Bondoc ( ÃÂ¢Ã¢â¬âÃÂºIB )","last_name":"","avatar_url":"https://s3.amazonaws.com/img-pixelapse/69235/7971005/img_medium_5474521.png","profile_url":"http://www.pixelapse.com/ionutbondoc"}},{"id":7970999,"revisions_count":0,"comments_count":0,"loves_count":0,"created_at":"2014-10-22T19:41:06.262Z","updated_at":"2014-11-07T23:16:02.272Z","public_datetime":"2014-10-22T19:41:06.305Z","last_rev_update":null,"featured_notes":"","featured_at":"2014-10-28T22:03:01.999Z","description":"Download 3 Free PSD Icons.","views_count":0,"is_public":true,"is_root_public":true,"preview":false,"filesystem":"pixelapse","url":"http://www.pixelapse.com/ionutbondoc/projects/Flat%20PSD%20Icons/overview","filename":"Flat PSD Icons","cover_img_url":"https://img-pixelapse.s3.amazonaws.com/69235/7972808/img_5477411.png?AWSAccessKeyId=AKIAJXL2IXYH62T5HXDA&Expires=1479757516&Signature=22I%2B1IyYkGJfnsMVOj2wUgHc3Nw%3D","file_types_count":[{"count":1,"extension":"psd"},{"count":1,"extension":"png"}],"total_items_count":3,"total_files_count":3,"cover_img_url_blur":"https://pixelapse.imgix.net/69235/7972808/img_5477411.png?blur=60&fm=jpg&q=85&s=f2f0f984cd4d364d219f16c0b1b924fb","cover_img_url_800":"https://pixelapse.imgix.net/69235/7972808/img_5477411.png?w=800&s=6a794254fd824c927eb284a8da722d02","cover_img_url_800_blur":"https://pixelapse.imgix.net/69235/7972808/img_5477411.png?w=800&blur=60&fm=jpg&q=85&s=6a438e431d1e186f639c912c79491ef4","cover_img_url_400":"https://pixelapse.imgix.net/69235/7972808/img_5477411.png?w=400&s=61d61224a317bd0d15cf9446ad8060c3","cover_img_url_400_blur":"https://pixelapse.imgix.net/69235/7972808/img_5477411.png?w=400&blur=60&fm=jpg&q=85&s=2f8b74fa254f720f3271ae07d01d39b4","tags":"flat, icons","items_count":3,"snapshots":[{"id":7972808,"created_at":"2014-10-23T01:52:14.890Z","updated_at":"2014-10-23T01:52:33.608Z","last_rev_update":"2014-10-23T01:52:20.619Z","filename":"cover.png","extension":"png","pages_count":null,"width":2400,"height":1800,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69235/7972808/img_small_5477411.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69235/7972808/img_medium_5477411.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69235/7972808/img_large_5477411.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69235/7972808/img_5477411.png","image_url_jpg":"https://pixelapse.imgix.net/69235/7972808/img_5477411.png?&s=d781354a119e2bd5621530f07d69d3f3","image_url_square":"https://pixelapse.imgix.net/69235/7972808/img_5477411.png?&s=d781354a119e2bd5621530f07d69d3f3","preview_ready":true},{"id":7971074,"created_at":"2014-10-22T19:50:35.288Z","updated_at":"2014-10-22T19:50:46.901Z","last_rev_update":"2014-10-22T19:50:44.143Z","filename":"3Free_Flat_Icons.psd","extension":"psd","pages_count":null,"width":800,"height":600,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69235/7971074/img_small_5474645.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69235/7971074/img_medium_5474645.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69235/7971074/img_large_5474645.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69235/7971074/img_5474645.png","image_url_jpg":"https://pixelapse.imgix.net/69235/7971074/img_5474645.png?&s=6822dbacb5859e7a1da65dc109e02264","image_url_square":"https://pixelapse.imgix.net/69235/7971074/img_5474645.png?&s=6822dbacb5859e7a1da65dc109e02264","preview_ready":true}],"user":{"id":69235,"username":"ionutbondoc","first_name":"Ionut Bondoc ( ÃÂ¢Ã¢â¬âÃÂºIB )","last_name":"","avatar_url":"https://s3.amazonaws.com/img-pixelapse/69235/7971005/img_medium_5474521.png","profile_url":"http://www.pixelapse.com/ionutbondoc"}},{"id":7971125,"revisions_count":0,"comments_count":0,"loves_count":0,"created_at":"2014-10-22T20:06:24.763Z","updated_at":"2014-11-07T23:16:02.510Z","public_datetime":"2014-10-22T20:06:24.835Z","last_rev_update":null,"featured_notes":"","featured_at":"2014-10-28T22:02:53.531Z","description":"A minimal iPhone 6 mockup","views_count":0,"is_public":true,"is_root_public":true,"preview":false,"filesystem":"pixelapse","url":"http://www.pixelapse.com/srioz/projects/iPhone%206%20Mockup/overview","filename":"iPhone 6 Mockup","cover_img_url":"https://img-pixelapse.s3.amazonaws.com/69238/7972829/img_5477482.png?AWSAccessKeyId=AKIAJXL2IXYH62T5HXDA&Expires=1479757516&Signature=d8mYG%2B8HLKOYA2pNOEHnHPK2MaE%3D","file_types_count":[{"count":1,"extension":"psd"},{"count":1,"extension":"png"}],"total_items_count":3,"total_files_count":3,"cover_img_url_blur":"https://pixelapse.imgix.net/69238/7972829/img_5477482.png?blur=60&fm=jpg&q=85&s=9d8cf203a89065c6da4af2b14b5b547d","cover_img_url_800":"https://pixelapse.imgix.net/69238/7972829/img_5477482.png?w=800&s=3f6047a89751753764661c80f0784a68","cover_img_url_800_blur":"https://pixelapse.imgix.net/69238/7972829/img_5477482.png?w=800&blur=60&fm=jpg&q=85&s=5615bd078fa108045b8bf04447a826db","cover_img_url_400":"https://pixelapse.imgix.net/69238/7972829/img_5477482.png?w=400&s=e087256af27c5ba48eb7af3683a2a0b2","cover_img_url_400_blur":"https://pixelapse.imgix.net/69238/7972829/img_5477482.png?w=400&blur=60&fm=jpg&q=85&s=7a3c84129876d89f75bf07c40bf1641a","tags":"iphone 6","items_count":3,"snapshots":[{"id":7972829,"created_at":"2014-10-23T01:59:55.646Z","updated_at":"2014-10-23T02:00:07.619Z","last_rev_update":"2014-10-23T01:59:59.985Z","filename":"cover.png","extension":"png","pages_count":null,"width":2400,"height":1800,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69238/7972829/img_small_5477482.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69238/7972829/img_medium_5477482.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69238/7972829/img_large_5477482.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69238/7972829/img_5477482.png","image_url_jpg":"https://pixelapse.imgix.net/69238/7972829/img_5477482.png?&s=f21e194bac3c795775ebdc3a19c9f3b1","image_url_square":"https://pixelapse.imgix.net/69238/7972829/img_5477482.png?&s=f21e194bac3c795775ebdc3a19c9f3b1","preview_ready":true},{"id":7971140,"created_at":"2014-10-22T20:08:43.052Z","updated_at":"2014-10-22T20:09:59.740Z","last_rev_update":"2014-10-22T20:09:46.182Z","filename":"iphone_6_mockup.psd","extension":"psd","pages_count":null,"width":1800,"height":2200,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69238/7971140/img_small_5474740.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69238/7971140/img_medium_5474740.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69238/7971140/img_large_5474740.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69238/7971140/img_5474740.png","image_url_jpg":"https://pixelapse.imgix.net/69238/7971140/img_5474740.png?&s=ef4bee64262f7fdba02da665a4109558","image_url_square":"https://pixelapse.imgix.net/69238/7971140/img_5474740.png?&s=ef4bee64262f7fdba02da665a4109558","preview_ready":true}],"user":{"id":69238,"username":"srioz","first_name":"Martin David","last_name":"","avatar_url":"https://s3.amazonaws.com/img-pixelapse/69238/7971122/img_medium_5474727.png","profile_url":"http://www.pixelapse.com/srioz"}},{"id":8034323,"revisions_count":0,"comments_count":0,"loves_count":0,"created_at":"2014-10-24T19:56:59.356Z","updated_at":"2014-11-07T23:16:02.981Z","public_datetime":"2014-10-24T19:56:59.574Z","last_rev_update":null,"featured_notes":"","featured_at":"2014-10-28T22:02:43.328Z","description":"Today i've made a mockup stationary for use, I thought that was going to share it with you","views_count":0,"is_public":true,"is_root_public":true,"preview":false,"filesystem":"pixelapse","url":"http://www.pixelapse.com/juantran/projects/Identity%20Mockup/overview","filename":"Identity Mockup","cover_img_url":"https://img-pixelapse.s3.amazonaws.com/69430/8036978/img_5528020.png?AWSAccessKeyId=AKIAJXL2IXYH62T5HXDA&Expires=1479757516&Signature=Aufyi8IDLlFfp5U8StzB%2FkCvSwQ%3D","file_types_count":[{"count":1,"extension":"psd"},{"count":1,"extension":"png"}],"total_items_count":3,"total_files_count":3,"cover_img_url_blur":"https://pixelapse.imgix.net/69430/8036978/img_5528020.png?blur=60&fm=jpg&q=85&s=ea1bd833e394cbe509b1aea35692c1d5","cover_img_url_800":"https://pixelapse.imgix.net/69430/8036978/img_5528020.png?w=800&s=9b072fa643cd2b748103699285c1cad9","cover_img_url_800_blur":"https://pixelapse.imgix.net/69430/8036978/img_5528020.png?w=800&blur=60&fm=jpg&q=85&s=5960055e98169576dd08fe5c8a1c79ac","cover_img_url_400":"https://pixelapse.imgix.net/69430/8036978/img_5528020.png?w=400&s=e51a39f1de9c2f77664e4f37ec419e4e","cover_img_url_400_blur":"https://pixelapse.imgix.net/69430/8036978/img_5528020.png?w=400&blur=60&fm=jpg&q=85&s=d74bbb8911f05a977439ef3ef1835c85","tags":"stationary","items_count":3,"snapshots":[{"id":8036978,"created_at":"2014-10-25T00:01:18.636Z","updated_at":"2014-10-25T00:14:19.725Z","last_rev_update":"2014-10-25T00:14:10.163Z","filename":"cover.png","extension":"png","pages_count":null,"width":2400,"height":1800,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69430/8036978/img_small_5528020.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69430/8036978/img_medium_5528020.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69430/8036978/img_large_5528020.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69430/8036978/img_5528020.png","image_url_jpg":"https://pixelapse.imgix.net/69430/8036978/img_5528020.png?&s=7efd128d93a8e9e0f8d6ae3fc7c4a115","image_url_square":"https://pixelapse.imgix.net/69430/8036978/img_5528020.png?&s=7efd128d93a8e9e0f8d6ae3fc7c4a115","preview_ready":true},{"id":8034329,"created_at":"2014-10-24T19:57:43.069Z","updated_at":"2014-10-24T19:59:26.038Z","last_rev_update":"2014-10-24T19:59:05.866Z","filename":"mockup by juantran.psd","extension":"psd","pages_count":null,"width":4500,"height":3000,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69430/8034329/img_small_5526207.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69430/8034329/img_medium_5526207.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69430/8034329/img_large_5526207.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69430/8034329/img_5526207.png","image_url_jpg":"https://pixelapse.imgix.net/69430/8034329/img_5526207.png?&s=3ecf9aa14968c4b7134581c5c2ffa4a0","image_url_square":"https://pixelapse.imgix.net/69430/8034329/img_5526207.png?&s=3ecf9aa14968c4b7134581c5c2ffa4a0","preview_ready":true}],"user":{"id":69430,"username":"juantran","first_name":"Juan Tran","last_name":null,"avatar_url":"https://s3.amazonaws.com/img-pixelapse/69430/8034356/img_medium_5526229.png","profile_url":"http://www.pixelapse.com/juantran"}},{"id":8034470,"revisions_count":0,"comments_count":0,"loves_count":0,"created_at":"2014-10-24T20:26:21.705Z","updated_at":"2014-11-07T23:16:03.382Z","public_datetime":"2014-10-24T20:26:21.782Z","last_rev_update":null,"featured_notes":"","featured_at":"2014-10-28T22:02:37.929Z","description":"I did a redesign for Twitter just for fun in free time. ","views_count":0,"is_public":true,"is_root_public":true,"preview":false,"filesystem":"pixelapse","url":"http://www.pixelapse.com/yigitpinarbasi/projects/Twitter%20Redesign/overview","filename":"Twitter Redesign","cover_img_url":"https://img-pixelapse.s3.amazonaws.com/69433/8036981/img_5527988.png?AWSAccessKeyId=AKIAJXL2IXYH62T5HXDA&Expires=1479757516&Signature=BBSX5bdJR%2FlQtCEaKycLc5EZqWc%3D","file_types_count":[{"count":1,"extension":"psd"},{"count":1,"extension":"png"}],"total_items_count":3,"total_files_count":3,"cover_img_url_blur":"https://pixelapse.imgix.net/69433/8036981/img_5527988.png?blur=60&fm=jpg&q=85&s=d127efcbf2a2772a5ae8cbcd9ba4ceb4","cover_img_url_800":"https://pixelapse.imgix.net/69433/8036981/img_5527988.png?w=800&s=991589ea18a3eefe182637b63d754749","cover_img_url_800_blur":"https://pixelapse.imgix.net/69433/8036981/img_5527988.png?w=800&blur=60&fm=jpg&q=85&s=bf5ccdb2f25714fb5aab654591794ef9","cover_img_url_400":"https://pixelapse.imgix.net/69433/8036981/img_5527988.png?w=400&s=f090b584f072341c371cb16eebb184e5","cover_img_url_400_blur":"https://pixelapse.imgix.net/69433/8036981/img_5527988.png?w=400&blur=60&fm=jpg&q=85&s=ccfadc8349b491f49d75e01b8883f3eb","tags":"redesign, mobile","items_count":3,"snapshots":[{"id":8036981,"created_at":"2014-10-25T00:01:24.036Z","updated_at":"2014-10-25T00:03:07.276Z","last_rev_update":"2014-10-25T00:01:32.931Z","filename":"cover.png","extension":"png","pages_count":null,"width":2400,"height":1800,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69433/8036981/img_small_5527988.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69433/8036981/img_medium_5527988.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69433/8036981/img_large_5527988.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69433/8036981/img_5527988.png","image_url_jpg":"https://pixelapse.imgix.net/69433/8036981/img_5527988.png?&s=030fad04891d2afadb9c8002bcb5bbba","image_url_square":"https://pixelapse.imgix.net/69433/8036981/img_5527988.png?&s=030fad04891d2afadb9c8002bcb5bbba","preview_ready":true},{"id":8034536,"created_at":"2014-10-24T20:37:04.932Z","updated_at":"2014-10-24T20:37:13.858Z","last_rev_update":"2014-10-24T20:37:11.559Z","filename":"redesign-twitter-profile-psd.psd","extension":"psd","pages_count":null,"width":640,"height":1136,"image_url_small":"https://s3.amazonaws.com/img-pixelapse/69433/8034536/img_small_5526368.png","image_url_medium":"https://s3.amazonaws.com/img-pixelapse/69433/8034536/img_medium_5526368.png","image_url_large":"https://s3.amazonaws.com/img-pixelapse/69433/8034536/img_large_5526368.png","image_url_full":"https://s3.amazonaws.com/img-pixelapse/69433/8034536/img_5526368.png","image_url_jpg":"https://pixelapse.imgix.net/69433/8034536/img_5526368.png?&s=75b5f222be1c0452f9a82e2434a52810","image_url_square":"https://pixelapse.imgix.net/69433/8034536/img_5526368.png?&s=75b5f222be1c0452f9a82e2434a52810","preview_ready":true}],"user":{"id":69433,"username":"yigitpinarbasi","first_name":"YiÃâÃÂ¸it PÃâÃÂ±narbaÃâ¦ÃÂ¸ÃâÃÂ±","last_name":"","avatar_url":"https://secure.gravatar.com/avatar/72020b69201158455aff5eb7f95ae13f?s=200&d=https://s3.amazonaws.com/pixelapse-assets/pixelapse-avatar-medium.png","profile_url":"http://www.pixelapse.com/yigitpinarbasi"}}]};
      var show_all = false;
  </script>
    <script src="https://d340syr2dan8gj.cloudfront.net/assets/app/gallery/connect-26ef0c356bb1648c500d3ed04b4abf59.js"></script>
  <script src="https://d340syr2dan8gj.cloudfront.net/assets/app/gallery/projects-d0b430d1c27d700d0ac676ace73772be.js"></script>
  <script>
    setTimeout(function() {
      $.get("/api/gallery/random.json", function(data) {
        console.log(data);
        if (typeof(data.cover_img_url_400) != "undefined") {
          log(data.cover_img_url_400);
          $(".random-project").html("<a href='"+data.url+"' title='<small>Random featured open design:</small><br>"+data.user.username + "/" + data.filename+"'><img src='"+data.cover_img_url_400+"' /></a>");
          $(".random-project a").tooltip({"html": true});
        }
      });
    }, 500);
  </script>


  <script type='text/javascript'>

        // User not signed in

      analytics_track("/explore");
  </script>

  <script src="<c:url value='/js/md5.min.js'/>"></script>

</body>
</html>

