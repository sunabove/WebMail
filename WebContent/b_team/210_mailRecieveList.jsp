<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="./js/210_mailRecieveList.js"></script>
<title>받은편지함</title>
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">
<link rel="stylesheet" href="./css/210_mailRecieveList.css">

<script>
  window.console = window.console || function(t) {};
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
</head>
<body>
	<main id="main">
	  <div class="overlay"></div>
	  <header class="header">
	    <div class="search-box">
	      <input placeholder="Search..."><span class="icon glyphicon glyphicon-search"></span>
	    </div>
	    <h1 class="page-title"><a class="sidebar-toggle-btn trigger-toggle-sidebar"><span class="line"></span><span class="line"></span><span class="line"></span><span class="line line-angle1"></span><span class="line line-angle2"></span></a>받은메일함(21 건)</h1>
	  </header>
	  <div class="action-bar">
	  	<p class="mail-sender">보낸이</p>
	  	<p class="mail-title">제목</p>
	  	<p class="mail-date">시간</p>
	  </div>
	  <div id="main-nano-wrapper" class="nano">
	    <div class="nano-content">
	      <ul class="message-list">
	        <li class="unread">
	          <div class="col col-1">
	            <p class="title">Lucas Kriebel (via Twitter)</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Lucas Kriebel (@LucasKriebel) has sent you a direct message on Twitter! &nbsp;&ndash;&nbsp; <span class="teaser">@LucasKriebel - Very cool :) Nicklas, You have a new direct message.</span></div>
	            <div class="date">11:49 am</div>
	          </div>
	        </li>
	        <li class="green-dot unread">
	          <div class="col col-1">
	            <p class="title">Conceptboard</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Please complete your Conceptboard signup &nbsp;&ndash;&nbsp; <span class="teaser">You recently created a Conceptboard account, but you have not yet confirmed your email. Your email is used for notifications about board activity, invites, as well as account related tasks (like password retrieval).</span></div>
	            <div class="date">11:45 am</div>
	          </div>
	        </li>
	        <li>
	          <div class="col col-1">
	            <p class="title">Randy, me (5)</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Last pic over my village &nbsp;&ndash;&nbsp; <span class="teaser">Yeah i'd like that! Do you remember the video you showed me of your train ride between Colombo and Kandy? The one with the mountain view? I would love to see that one again!</span></div>
	            <div class="date">5:01 am</div>
	          </div>
	        </li>
	        <li class="blue-dot">
	          <div class="col col-1">
	            <p class="title">Andrew Zimmer</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Mochila Beta: Subscription Confirmed &nbsp;&ndash;&nbsp; <span class="teaser">You've been confirmed! Welcome to the ruling class of the inbox. For your records, here is a copy of the information you submitted to us...</span></div>
	            <div class="date">Mar 8</div>
	          </div>
	        </li>
	        <li class="unread">
	          <div class="col col-1">
	            <p class="title">Infinity HR</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Sveriges Hetaste sommarjobb &nbsp;&ndash;&nbsp; <span class="teaser">Hej Nicklas Sandell! Vi vill bjuda in dig till "First tour 2014", ett rekryteringsevent som erbjuder jobb på 16 semesterorter i Sverige.</span></div>
	            <div class="date">Mar 8</div>
	          </div>
	        </li>
	        <li>
	          <div class="col col-1">
	            <p class="title">Web Support Dennis</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Re: New mail settings &nbsp;&ndash;&nbsp; <span class="teaser">Will you answer him asap?</span></div>
	            <div class="date">Mar 7</div>
	          </div>
	        </li>
	        <li>
	          <div class="col col-1">
	            <p class="title">me, Peter (2)</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Off on Thursday &nbsp;&ndash;&nbsp; <span class="teaser">Eff that place, you might as well stay here with us instead! Sent from my iPhone 4 &gt; 4 mar 2014 at 5:55 pm</span></div>
	            <div class="date">Mar 4</div>
	          </div>
	        </li>
	        <li class="orange-dot">
	          <div class="col col-1">
	            <p class="title">Medium</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">This Week's Top Stories &nbsp;&ndash;&nbsp; <span class="teaser">Our top pick for you on Medium this week The Man Who Destroyed America’s Ego</span></div>
	            <div class="date">Feb 28</div>
	          </div>
	        </li>
	        <li class="blue-dot">
	          <div class="col col-1">
	            <p class="title">Death to Stock</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Montly High-Res Photos &nbsp;&ndash;&nbsp; <span class="teaser">To create this month's pack, we hosted a party with local musician Jared Mahone here in Columbus, Ohio.</span></div>
	            <div class="date">Feb 28</div>
	          </div>
	        </li>
	        <li>
	          <div class="col col-1">
	            <p class="title">Revibe</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Weekend on Revibe &nbsp;&ndash;&nbsp; <span class="teaser">Today's Friday and we thought maybe you want some music inspiration for the weekend. Here are some trending tracks and playlists we think you should give a listen!</span></div>
	            <div class="date">Feb 27</div>
	          </div>
	        </li>
	        <li>
	          <div class="col col-1">
	            <p class="title">Erik, me (5)</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Regarding our meeting &nbsp;&ndash;&nbsp; <span class="teaser">That's great, see you on Thursday!</span></div>
	            <div class="date">Feb 24</div>
	          </div>
	        </li>
	        <li>
	          <div class="col col-1">
	            <p class="title">KanbanFlow</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Task assigned: Clone ARP's website &nbsp;&ndash;&nbsp; <span class="teaser">You have been assigned a task by Alex@Work on the board Web.</span></div>
	            <div class="date">Feb 24</div>
	          </div>
	        </li>
	        <li class="blue-dot">
	          <div class="col col-1">
	            <p class="title">Tobias Berggren</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Let's go fishing! &nbsp;&ndash;&nbsp; <span class="teaser">Hey, You wanna join me and Fred at the lake tomorrow? It'll be awesome.</span></div>
	            <div class="date">Feb 23</div>
	          </div>
	        </li>
	        <li>
	          <div class="col col-1">
	            <p class="title">Charukaw, me (7)</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Hey man &nbsp;&ndash;&nbsp; <span class="teaser">Nah man sorry i don't. Should i get it?</span></div>
	            <div class="date">Feb 23</div>
	          </div>
	        </li>
	        <li class="unread">
	          <div class="col col-1">
	            <p class="title">me, Peter (5)</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Home again! &nbsp;&ndash;&nbsp; <span class="teaser">That's just perfect! See you tomorrow.</span></div>
	            <div class="date">Feb 21</div>
	          </div>
	        </li>
	        <li class="green-dot">
	          <div class="col col-1">
	            <p class="title">Stack Exchange</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">1 new items in your Stackexchange inbox &nbsp;&ndash;&nbsp; <span class="teaser">The following items were added to your Stack Exchange global inbox since you last checked it.</span></div>
	            <div class="date">Feb 21</div>
	          </div>
	        </li>
	        <li>
	          <div class="col col-1">
	            <p class="title">Google Drive Team</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">You can now use your storage in Google Drive &nbsp;&ndash;&nbsp; <span class="teaser">Hey Nicklas Sandell! Thank you for purchasing extra storage space in Google Drive.</span></div>
	            <div class="date">Feb 20</div>
	          </div>
	        </li>
	        <li class="unread">
	          <div class="col col-1">
	            <p class="title">me, Susanna (11)</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Train/Bus &nbsp;&ndash;&nbsp; <span class="teaser">Yes ok, great! I'm not stuck in Stockholm anymore, we're making progress.</span></div>
	            <div class="date">Feb 19</div>
	          </div>
	        </li>
	        <li>
	          <div class="col col-1">
	            <p class="title">Peter, me (3)</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Hello &nbsp;&ndash;&nbsp; <span class="teaser">Trip home from Colombo has been arranged, then Jenna will come get me from Stockholm. :)</span></div>
	            <div class="date">Mar. 6</div>
	          </div>
	        </li>
	        <li>
	          <div class="col col-1">
	            <p class="title">me, Susanna (7)</p>
	          </div>
	          <div class="col col-2">
	            <div class="subject">Since you asked... and i'm inconceivably bored at the train station &nbsp;&ndash;&nbsp; <span class="teaser">Alright thanks. I'll have to re-book that somehow, i'll get back to you.</span></div>
	            <div class="date">Mar. 6</div>
	          </div>
	        </li>
	      </ul>
	      <div class="footer">
	      	<a href="#" class="load-more-link"><%="<<" %>&nbsp;&nbsp;</a>
	      	<a href="#" class="load-more-link"><%="<" %>&nbsp;&nbsp;</a>
	      <%
	      	for(int i=0;i<10;i++) {
     	  %>
     	  		<a href="#" class="load-more-link"><%=i+1 %>&nbsp;&nbsp;</a>
     	  <%
	      	}
	      %>
	      	<a href="#" class="load-more-link"><%=">" %>&nbsp;&nbsp;</a>
	      	<a href="#" class="load-more-link"><%=">>" %>&nbsp;&nbsp;</a>
	      </div>
	    </div>
	  </div>
	</main>
</body>
</html>

