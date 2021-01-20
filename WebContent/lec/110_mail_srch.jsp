<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../template/jsp_common.jsp" />

<!doctype html>
<!--[if lte IE 9]>
<html lang="ko" class="oldie">
<![endif]-->
<!--[if gt IE 9]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="7hvWEp4qyKw2AQ6sV27e9es2U8cWbRUPsnKvmgyA8/x95C0tk5LJ1jS9s87ksxhaZPAhWM+kyQkYOEDLBeS8bg==" />
<meta name="viewport" content="width=device-width">

<title>CodePen - Responsive Mail UI</title>
<link rel="stylesheet" media="screen" href="https://cpwebassets.codepen.io/assets/fullpage/fullpage-4de243a40619a967c0bf13b95e1ac6f8de89d943b7fc8710de33f681fe287604.css" />
<link rel="stylesheet" media="all" href="https://cpwebassets.codepen.io/assets/global/global-031b289c73bf4e4d154ba7eb2675a0ae1333ced942cdba9a66c6f032629b8038.css" />
<link rel="stylesheet" media="screen" href="https://cpwebassets.codepen.io/assets/packs/css/everypage-f7f2049f.css" />
<link rel="stylesheet" media="all" href="https://cpwebassets.codepen.io/assets/page/page-4b32bcb381ab5382aabfb7053e21dfb332d0f40e9ec157b472146c969c557c8f.css" />
<link rel="stylesheet" media="all" href="https://cpwebassets.codepen.io/assets/editor/editor-015c75898c7ab367a1025f035c8f22de78df17f226256a039c29d4e66da97e2e.css" />
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,400italic,700,700italic,900,900italic&display=swap" rel="stylesheet" />
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@CodePen">
<meta name="twitter:title" content="Responsive Mail UI">
<meta name="twitter:description" content="Credit for design goes to Vivek Venkatraman: http://dribbble.com/shots/1455744-Email-Concept/  Check it out in full view to see it&#39;s responsiveness. It...">
<meta name="twitter:image" content="https://assets.codepen.io/22043/internal/screenshots/pens/cqlGk.default.png?fit=cover&amp;format=auto&amp;ha=true&amp;height=540&amp;quality=75&amp;v=2&amp;version=1394646539&amp;width=960">
<meta name="twitter:creator" content="@nicklassandell">
<meta property="og:image" content="https://assets.codepen.io/22043/internal/screenshots/pens/cqlGk.default.png?fit=cover&amp;format=auto&amp;ha=true&amp;height=540&amp;quality=75&amp;v=2&amp;version=1394646539&amp;width=960" itemprop="thumbnailUrl">
<meta property="og:title" content="Responsive Mail UI">
<meta property="og:url" content="https://codepen.io/nicklassandell/details/cqlGk">
<meta property="og:site_name" content="CodePen">
<meta property="og:description" content="Credit for design goes to Vivek Venkatraman: http://dribbble.com/shots/1455744-Email-Concept/  Check it out in full view to see it&#39;s responsiveness. It...">
<link rel="alternate" type="application/json+oembed" href="https://codepen.io/api/oembed?url=https%3A%2F%2Fcodepen.io%2Fnicklassandell%2Fpen%2FcqlGk&format=json" title="Responsive Mail UI" />
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
<script nonce="/vKyFueHVmY=">
  /* Firefox needs this to prevent FOUT */
</script>
</head>
<body class="fullpage logged-in sidebar-false">
	<header id="main-header" class="main-header"></header>
	<div class="oldie-header">
		<a href="https://codepen.io/nicklassandell/pen/cqlGk">Edit Pen</a>
	</div>
	<div id="result-iframe-wrap" role="main">
		<iframe id="result" src="https://cdpn.io/nicklassandell/fullpage/cqlGk" sandbox="allow-downloads allow-forms allow-modals allow-pointer-lock allow-popups allow-presentation allow-same-origin allow-scripts allow-top-navigation-by-user-activation"
			allow="accelerometer; camera; encrypted-media; geolocation; gyroscope; microphone; midi" allowTransparency="true" allowpaymentrequest="true" allowfullscreen="true" class="result-iframe"></iframe>
	</div>
	<div id="full-view-ad"></div>
	<input type="hidden" id="init-data"
		value="{&quot;__browser&quot;:{&quot;device&quot;:&quot;unknown_device&quot;,&quot;mobile&quot;:false,&quot;name&quot;:&quot;chrome&quot;,&quot;platform&quot;:&quot;pc&quot;,&quot;version&quot;:&quot;87&quot;},&quot;__constants&quot;:{&quot;gridIframeSandboxAttributes&quot;:&quot;allow-forms allow-modals allow-pointer-lock allow-presentation allow-same-origin allow-scripts&quot;},&quot;__CPDATA&quot;:{&quot;domain_iframe&quot;:&quot;https://cdpn.io&quot;,&quot;environment&quot;:&quot;production&quot;,&quot;host&quot;:&quot;codepen.io&quot;,&quot;iframe_allow&quot;:&quot;accelerometer; camera; encrypted-media; geolocation; gyroscope; microphone; midi&quot;,&quot;iframe_sandbox&quot;:&quot;allow-downloads allow-forms allow-modals allow-pointer-lock allow-popups allow-presentation allow-same-origin allow-scripts allow-top-navigation-by-user-activation&quot;},&quot;__svg_sprite&quot;:&quot;/svgs/compiled/svgs.40016ff2.svg&quot;,&quot;__user&quot;:{&quot;anon&quot;:true,&quot;base_url&quot;:&quot;/anon/&quot;,&quot;current_team_id&quot;:0,&quot;current_team_hashid&quot;:&quot;YdEzGn&quot;,&quot;hashid&quot;:&quot;VoDkNZ&quot;,&quot;id&quot;:1,&quot;itemType&quot;:&quot;user&quot;,&quot;name&quot;:&quot;Captain Anonymous&quot;,&quot;owner_id&quot;:&quot;VoDkNZYdEzGn&quot;,&quot;paid&quot;:false,&quot;tier&quot;:0,&quot;username&quot;:&quot;anon&quot;,&quot;created_at&quot;:null,&quot;email_verified&quot;:null,&quot;collections_count&quot;:0,&quot;collections_private_count&quot;:0,&quot;followers_count&quot;:0,&quot;followings_count&quot;:0,&quot;pens_count&quot;:0,&quot;pens_private_count&quot;:0,&quot;projects_count&quot;:0,&quot;projects_private_count&quot;:0},&quot;__firebase&quot;:{&quot;config&quot;:{&quot;apiKey&quot;:&quot;AIzaSyBgLAe7N_MdFpuVofMkcQLGwwhUu5tuxls&quot;,&quot;authDomain&quot;:&quot;codepen-store-production.firebaseapp.com&quot;,&quot;databaseURL&quot;:&quot;https://codepen-store-production.firebaseio.com&quot;,&quot;disabled&quot;:false,&quot;projectId&quot;:&quot;codepen-store-production&quot;},&quot;token&quot;:&quot;eyJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsImNsYWltcyI6eyJvd25lcklkIjoiVm9Ea05aWWRFekduIiwiYWRtaW4iOmZhbHNlfSwiZXhwIjoxNjExMTEyMTU5LCJpYXQiOjE2MTExMDg1NTksImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLThva3lsQGNvZGVwZW4tc3RvcmUtcHJvZHVjdGlvbi5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsInN1YiI6ImZpcmViYXNlLWFkbWluc2RrLThva3lsQGNvZGVwZW4tc3RvcmUtcHJvZHVjdGlvbi5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsInVpZCI6IlZvRGtOWiJ9.spcFSM4bkuKx0p80QXbo2aRCYNh9z5M91yejQrr3txqnr5Fk05lCsMIo1PGhF1rRSEiiWrkDJQZ3WxlP3_INHiM80Lhl7YJkZ4LB65axbB7uMJehGa0-Rejb58VzZZ18Hx8wqhtIrw7n__bg__l13A1q_3MAnIUE4KHHdzNdrkjKJj3-GBSLl-84HSOJMMk5jzrdOr0en86S1MqcsLkDvDKw7GHDJuP8dlgXl9SEbJzftRrtDBs6CUuagKCfLFOsXI-bQq-BdxSMJK-Fn9LYkSkB2LQdKitg6S1oYZ4YoIPi7swU6N7Ve_btv1aGhWmOCgScisjzYIvd6HPWhBK4dg&quot;},&quot;__graphql&quot;:{&quot;data&quot;:{&quot;sessionUser&quot;:{&quot;id&quot;:&quot;VoDkNZ&quot;,&quot;name&quot;:&quot;Captain Anonymous&quot;,&quot;avatar80&quot;:&quot;https://gravatar.com/avatar/b15e0cf27861794b6faa31065e8f9950?d=https%3A%2F%2Fassets.codepen.io%2Finternal%2Favatars%2Fusers%2Fdefault.png&amp;fit=crop&amp;format=auto&amp;height=80&amp;version=0&amp;width=80&quot;,&quot;avatar512&quot;:&quot;https://gravatar.com/avatar/b15e0cf27861794b6faa31065e8f9950?d=https%3A%2F%2Fassets.codepen.io%2Finternal%2Favatars%2Fusers%2Fdefault.png&amp;fit=crop&amp;format=auto&amp;height=512&amp;version=0&amp;width=512&quot;,&quot;currentContext&quot;:{&quot;id&quot;:&quot;VoDkNZ&quot;,&quot;baseUrl&quot;:&quot;/anon&quot;,&quot;title&quot;:&quot;Captain Anonymous&quot;,&quot;name&quot;:&quot;Captain Anonymous&quot;,&quot;avatar80&quot;:&quot;https://gravatar.com/avatar/b15e0cf27861794b6faa31065e8f9950?d=https%3A%2F%2Fassets.codepen.io%2Finternal%2Favatars%2Fusers%2Fdefault.png&amp;fit=crop&amp;format=auto&amp;height=80&amp;version=0&amp;width=80&quot;,&quot;avatar512&quot;:&quot;https://gravatar.com/avatar/b15e0cf27861794b6faa31065e8f9950?d=https%3A%2F%2Fassets.codepen.io%2Finternal%2Favatars%2Fusers%2Fdefault.png&amp;fit=crop&amp;format=auto&amp;height=512&amp;version=0&amp;width=512&quot;,&quot;username&quot;:&quot;anon&quot;,&quot;contextType&quot;:&quot;USER&quot;,&quot;teamAdmin&quot;:false,&quot;projectLimitations&quot;:{&quot;id&quot;:&quot;VoDkNZ&quot;,&quot;projects&quot;:0,&quot;usedProjects&quot;:0,&quot;__typename&quot;:&quot;ProjectLimitations&quot;},&quot;privateByDefault&quot;:false,&quot;__typename&quot;:&quot;User&quot;},&quot;currentTeamId&quot;:null,&quot;baseUrl&quot;:&quot;/anon&quot;,&quot;username&quot;:&quot;anon&quot;,&quot;admin&quot;:false,&quot;anon&quot;:true,&quot;pro&quot;:false,&quot;verified&quot;:null,&quot;teams&quot;:[],&quot;permissions&quot;:{&quot;id&quot;:&quot;1&quot;,&quot;canCreatePrivate&quot;:false,&quot;canUploadAssets&quot;:false,&quot;__typename&quot;:&quot;UserPermissions&quot;},&quot;__typename&quot;:&quot;User&quot;}}},&quot;__item&quot;:&quot;{\&quot;id\&quot;:1271669,\&quot;hashid\&quot;:\&quot;rNamqz\&quot;,\&quot;itemType\&quot;:\&quot;pen\&quot;,\&quot;owner_id\&quot;:\&quot;DqYNXDYdEzGn\&quot;,\&quot;user_id\&quot;:22043,\&quot;slug_hash\&quot;:\&quot;cqlGk\&quot;,\&quot;private\&quot;:false,\&quot;slug_hash_private\&quot;:\&quot;b7a0bd7c856ebe5d413659ff08deea72\&quot;}&quot;,&quot;__profiled&quot;:{&quot;base_url&quot;:&quot;/nicklassandell&quot;,&quot;hashid&quot;:&quot;DqYNXD&quot;,&quot;id&quot;:22043,&quot;name&quot;:&quot;Nicklas Sandell&quot;,&quot;type&quot;:&quot;user&quot;,&quot;username&quot;:&quot;nicklassandell&quot;},&quot;__pageType&quot;:&quot;full&quot;}">
	<div id="popup-overlay" class="overlay popup-overlay"></div>
	<div id="modal-overlay" class="overlay modal-overlay"></div>
	<script src="https://cpwebassets.codepen.io/assets/common/everypage-b61528ae2ce1c44a980ce1895a316ea4da923be416a7deb9e5de27b6f8de81e1.js"></script>
	<script src="https://cpwebassets.codepen.io/assets/common/analytics_and_notifications-afa6925cbcff840929f2b7c543587d5f9d7a461af81ee7ca80631c8e37ac42f2.js"></script>
	<script nonce="/vKyFueHVmY=">
		LUX = (function() {
			var a = ("undefined" !== typeof (LUX)
					&& "undefined" !== typeof (LUX.gaMarks) ? LUX.gaMarks : []);
			var d = ("undefined" !== typeof (LUX)
					&& "undefined" !== typeof (LUX.gaMeasures) ? LUX.gaMeasures
					: []);
			var j = "LUX_start";
			var k = window.performance;
			var l = ("undefined" !== typeof (LUX) && LUX.ns ? LUX.ns
					: (Date.now ? Date.now() : +(new Date())));
			if (k && k.timing && k.timing.navigationStart) {
				l = k.timing.navigationStart
			}
			function f() {
				if (k && k.now) {
					return k.now()
				}
				var o = Date.now ? Date.now() : +(new Date());
				return o - l
			}
			function b(n) {
				if (k) {
					if (k.mark) {
						return k.mark(n)
					} else {
						if (k.webkitMark) {
							return k.webkitMark(n)
						}
					}
				}
				a.push({
					name : n,
					entryType : "mark",
					startTime : f(),
					duration : 0
				});
				return
			}
			function m(p, t, n) {
				if ("undefined" === typeof (t) && h(j)) {
					t = j
				}
				if (k) {
					if (k.measure) {
						if (t) {
							if (n) {
								return k.measure(p, t, n)
							} else {
								return k.measure(p, t)
							}
						} else {
							return k.measure(p)
						}
					} else {
						if (k.webkitMeasure) {
							return k.webkitMeasure(p, t, n)
						}
					}
				}
				var r = 0, o = f();
				if (t) {
					var s = h(t);
					if (s) {
						r = s.startTime
					} else {
						if (k && k.timing && k.timing[t]) {
							r = k.timing[t] - k.timing.navigationStart
						} else {
							return
						}
					}
				}
				if (n) {
					var q = h(n);
					if (q) {
						o = q.startTime
					} else {
						if (k && k.timing && k.timing[n]) {
							o = k.timing[n] - k.timing.navigationStart
						} else {
							return
						}
					}
				}
				d.push({
					name : p,
					entryType : "measure",
					startTime : r,
					duration : (o - r)
				});
				return
			}
			function h(n) {
				return c(n, g())
			}
			function c(p, o) {
				for (i = o.length - 1; i >= 0; i--) {
					var n = o[i];
					if (p === n.name) {
						return n
					}
				}
				return undefined
			}
			function g() {
				if (k) {
					if (k.getEntriesByType) {
						return k.getEntriesByType("mark")
					} else {
						if (k.webkitGetEntriesByType) {
							return k.webkitGetEntriesByType("mark")
						}
					}
				}
				return a
			}
			return {
				mark : b,
				measure : m,
				gaMarks : a,
				gaMeasures : d
			}
		})();
		LUX.ns = (Date.now ? Date.now() : +(new Date()));
		LUX.ac = [];
		LUX.cmd = function(a) {
			LUX.ac.push(a)
		};
		LUX.init = function() {
			LUX.cmd([ "init" ])
		};
		LUX.send = function() {
			LUX.cmd([ "send" ])
		};
		LUX.addData = function(a, b) {
			LUX.cmd([ "addData", a, b ])
		};
		LUX_ae = [];
		window.addEventListener("error", function(a) {
			LUX_ae.push(a)
		});
		LUX_al = [];
		if ("function" === typeof (PerformanceObserver)
				&& "function" === typeof (PerformanceLongTaskTiming)) {
			var LongTaskObserver = new PerformanceObserver(function(c) {
				var b = c.getEntries();
				for (var a = 0; a < b.length; a++) {
					var d = b[a];
					LUX_al.push(d)
				}
			});
			try {
				LongTaskObserver.observe({
					type : [ "longtask" ]
				})
			} catch (e) {
			}
		};
	</script>
	<script src="https://cdn.speedcurve.com/js/lux.js?id=410041" async defer crossorigin="anonymous"></script>
	<script src="https://cpwebassets.codepen.io/assets/packs/js/vendor-23db6644fb6932e6ca9f.chunk.js"></script>
	<script src="https://cpwebassets.codepen.io/assets/packs/js/2-56b9048a92715122b7fc.chunk.js"></script>
	<script src="https://cpwebassets.codepen.io/assets/packs/js/everypage-7713aff38c12e2be765c.js"></script>
	<script src="https://cpwebassets.codepen.io/assets/editor/full/full_page_renderer-68d817ddab07bc9760b7fbc5f2d6796c23ed348c67db2aeb96ecee1dadf9e71d.js"></script>
</body>
</html>
