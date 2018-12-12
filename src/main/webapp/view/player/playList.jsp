<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="spring.indiestream.domain.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Music Player</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link rel="stylesheet" href="${initParam.root}css/playListStyle.css">
</head>
<body>
	<section id="art">
	<div class="player">
		<img>
	</div>
	<div class="wide">

	</div>
	</section>

	<section id="playlist">
  <table id="playlist" class="no-select">
    <thead>
      <th>&nbsp;</th>
      <th>Title</th>
      <th>Artist</th>
      <th>Genre</th>
      <th><span class="fa fa-clock-o"></span></th>
    </thead>
    <tbody></tbody>
  </table>
</section>
<section>
<footer id="interactions">
  <div class="tracking-wrap">
    <span class="song-current-time">--:--</span>
    <input class="tracking-slider range" type="range" min="0" value="0" step="1">
    <span class="song-length">--:--</span>
  </div>
  
  <div class="controls-bar">
    <section id="controls">
      <span class="fa fa-random shuffle"></span>
      <span class="fa fa-fast-backward previous"></span>
      <span class="fa fa-play play-pause"></span>
      <span class="fa fa-fast-forward next"></span>
      <span class="fa fa-repeat repeat on"></span>
    </section>
    
    <div id="volume">
      <span class="fa fa-volume-down"></span>
      <input class="volume-slider range" type="range" max="1" min="0" step="0.01" value="0.8">
      <span class="fa fa-volume-up"></span>
    </div>
  </div>
</footer>
</section>
	<!-- footer End -->
	<audio id="player"></audio>
	<input type="hidden" id="listSize" value="${list.size()}">
	<c:forEach items="${list}" var="list" varStatus="index">
		<input type="hidden" id="song${index.index}title" value="${list.soundTitle}"/>
		<input type="hidden" id="song${index.index}writer" value="${list.soundWriter}"/>
		<input type="hidden" id="song${index.index}photo" value="${list.soundPhoto}"/>
		<input type="hidden" id="song${index.index}url" value="${list.soundUrl}"/>
		<input type="hidden" id="song${index.index}genre" value="${list.soundGenre}"/>
		<audio id="duration${index.index}" src="${initPara.root}upload_audio/${list.soundUrl}" style="display:none;"></audio>
	</c:forEach>
	<script src="${initParam.root}js/playList.js"></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.4/lodash.min.js'></script>
</body>
</html>