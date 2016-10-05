<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="home.title"/></title>
    <!--<link href="http://vjs.zencdn.net/5.10.7/video-js.css" rel="stylesheet">-->
    
    <title><fmt:message key="home.title"/></title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta name="menu" content="Playback"/>
</head>
<body>


<section>
	<div class="roll">

		<c:if test="${empty recordId}">
			
			<h1 class="on-air">
		    	<fmt:message key="vr.chooseCamera"/>
		    </h1>
	
			<c:forEach var="record" items="${records}">
				${record.id} - ${record.creationDate}
				</br>
				<c:forEach var="recordCamera" items="${record.recordCameras}">
					&nbsp;&nbsp;<a href="/videoPlayback?recordId=${record.id}&cameraId=${recordCamera.cameraId}">${recordCamera.cameraId} - ${recordCamera.creationDate}</a></br>
				</c:forEach>
			
			</c:forEach>
		</c:if>
		
		<c:if test="${not empty recordId}">
			
			<h1 class="on-air">
		    	<fmt:message key="vr.camera"/> ID ${cameraId}
		    </h1>
			
			<div class="main-content">
				<video id="videoContainer" width="100%" controls> 
					<source src="/videoPlayback/playVideo?recordId=${recordId}&cameraId=${cameraId}" type="video/mp4">
				</video>
	        </div>
		    <div class="add-content">
		        <div class="bordered-block action-history">
		            <h2><fmt:message key="vr.archive.actionsHistory"/></h2>
		            <ul>
			            <c:forEach var="subtitle" items="${subtitles}">
				            <li>
			                    <p class="time-mark blue" onClick="printHumanReadableTime(${subtitle.startTime.time/1000});"><span></span>${subtitle.startTime.time/1000}</p>
			                    <a href="javascript:moveToPoint(${subtitle.startTime.time}/1000);">${subtitle.fullText}</a>
		                    </li>
						</c:forEach>
		            </ul>
		        </div>
		    </div>
			
			<script>
				
				function moveToPoint(point){
					var mediaElement = document.getElementById("videoContainer");
					mediaElement.pause(); 
					mediaElement.currentTime = point;
					mediaElement.play();
				}
				
				function printHumanReadableTime(totalSec){
					totalSec = Math.round(totalSec);
					var hours = parseInt( totalSec / 3600 ) % 24;
					var minutes = parseInt( totalSec / 60 ) % 60;
					var seconds = totalSec % 60;
					var result = (hours < 10 ? "0" + hours : hours) + "-" + (minutes < 10 ? "0" + minutes : minutes) + "-" + (seconds  < 10 ? "0" + seconds : seconds);
					alert(result);
				}

			</script>

		</c:if>
		
	        
	    
	</div>
</section>
	
</body>
