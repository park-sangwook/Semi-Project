<%@page import="java.util.Calendar"%>
<%@page import="com.example.demo.calendar.CalendarEx"%>
<%@page import="com.example.demo.calendar.CalendarDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MEET PLAY SHARE, 메가박스</title>
    <link rel="icon" href="https://www.megabox.co.kr/static/pc/images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <script type="text/javascript" src="${pageContext.request.contextPath }/webjars/axios/1.7.2/dist/axios.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/webjars/jquery/3.7.1/dist/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../static/css/ticketing.css">
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.css" />
    <script defer src="../static/js/ticketing.js"></script>
</head>
<%
	Calendar now = Calendar.getInstance();
	List<MovieDTO> vo = MovieServiceImpl.getInstance().select();
	List<CalendarDTO> calendar = CalendarEx.prn2(now.get(Calendar.YEAR), now.get(Calendar.MONTH), now.get(Calendar.DAY_OF_MONTH));
	pageContext.setAttribute("calendar", calendar);
	String name = request.getParameter("name");
	pageContext.setAttribute("name", name);
	request.setAttribute("vo", vo);
%>
<body>
    <%@ include file="../include/header.jsp" %>
   <main>
        <div class="box">
            <h1>빠른예매</h1>
            <div class="ticketing-container">
                <div class="ticketing-select">
                    <div class="swiper-prev">
                        <div class="material-symbols-outlined">
                            arrow_back_ios
                        </div>
                    </div>
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                        	<c:forEach var="calendar" items="${calendar }">
	                            <div class="swiper-slide calendar">
	                                <p>${calendar.day}&bull;${calendar.dayOfWeek }</p>
	                            </div>                        	
                        	</c:forEach>
                        </div>
                        <!-- <div class="swiper-pagination"></div> -->
                    </div>
                    <div class="swiper-next">
                        <div class="material-symbols-outlined">
                            arrow_forward_ios
                        </div>
                    </div>
                    <div class="date-image">
                        <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-calendar-w20.png" alt="">
                    </div>    
                </div>
                <div class="menu">
                    <div class="movie-menu">
                        <h1>영화</h1>
                        <div class="movie-sub-menu">
                            <div class="sub-top-menu">
                                <div onclick="movieFrist()" class="top-first-menu">
                                    <p>전체</p>
                                </div>
                                <div onclick="movieSecond()" class="top-second-menu">
                                    <p>큐레이션</p>
                                </div>
                            </div>
                            <div class="sub-middle-menu">
                                <div class="middle-first-menu">
                                	<c:forEach var="vo" items="${vo }">
                                		<c:if test="${vo.name==name }">
		                                    <div class="first-menu-item selected">
		                                        <p>${vo.name }</p>
		                                    </div>
                                		</c:if>
                                		<c:if test="${vo.name!=name }">
		                                    <div class="first-menu-item">
		                                        <p>${vo.name }</p>
		                                    </div>
		                                </c:if>
                                	
                                	</c:forEach>
                                </div>
                                <div class="middle-second-menu">
                                    <div class="second-menu-item">
                                        <p>수카바티: 극락축구단</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>데드풀과 울버린</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>리볼버</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>슈퍼배드 4</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>사랑의 하츄핑</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>인사이드 아웃2</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>탈주</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>명탐정 코난: 100만 달러의 펜타그램</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>하이퍼포커스: 투모로우바이투게더 브이알 콘서트</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>행복의 나라</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>빅토리</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>우마무스메 PRETTY DERBY 새로운 시대의 문</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>극장판 프리큐어 올스타즈 F</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>핸섬가이즈</p>
                                    </div>
                                </div>
                            </div>
                            <div class="sub-bottom-menu">
                                <div class="bottom-menu">
                                    <p>모든영화</p>
                                    <p>목록에서 영화를 선택하세요.</p>    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="theater-menu">
                        <h1>극장</h1>
                        <div class="theater-sub-menu">
                            <div class="sub-top-menu">
                                <div onclick="theaterFirst()" class="top-first-menu">
                                    <p>전체</p>
                                </div>
                                <div onclick="theaterSecond()" class="top-second-menu">
                                    <p>특별관</p>
                                </div>
                            </div>
                            <ul class="theater-list">
                                <li>
                                    <h2>서울(20)</h2>
                                    <ul class="theater-location">
                                        <li>강남</li>
                                        <li>강동</li>
                                        <li>군자</li>
                                        <li>더 부티크 목동현대백화점</li>
                                        <li>동대문</li>
                                        <li>마곡</li>
                                        <li>목동</li>
                                        <li>브로드웨이(신사)</li>
                                        <li>상봉</li>
                                        <li>상암월드컵경기장</li>
                                        <li>성수</li>
                                        <li>센트럴</li>
                                        <li>송파파크하비오</li>
                                        <li>신촌</li>
                                        <li>이수</li>
                                        <li>창동</li>
                                        <li>코엑스</li>
                                        <li>화곡</li>
                                    </ul>
                                </li>
                                <li>
                                    <h2>경기(33)</h2>
                                    <ul class="theater-location">
                                        <li>고양스타필드</li>
                                        <li>광명ak플라자</li>
                                        <li>광명소하</li>
                                        <li>금정ak플라자</li>
                                        <li>김포한강신도시</li>
                                        <li>남양주</li>
                                        <li>남양주현대아울렛 스페이스원</li>
                                        <li>`동탄</li>
                                        <li>미사강변</li>
                                        <li>색석벨라시타</li>
                                        <li>별내</li>
                                        <li>부천스타필드시티</li>
                                        <li>분당</li>
                                        <li>수원</li>
                                        <li>수원ak플라자</li>
                                        <li>수원남문</li>
                                        <li>수원스타필드</li>
                                        <li>수원인계</li>
                                        <li>수원호매실</li>
                                        <li>시흥배곧</li>
                                    </ul>
                                </li>
                                <li>
                                    <h2>인천(6)</h2>
                                </li>
                                <li>
                                    <h2>대전/충청/세종(17)</h2>
                                </li>
                                <li>
                                    <h2>부산/대구/경상(26)</h2>
                                </li>
                                <li>
                                    <h2>광주/전라(9)</h2>
                                </li>
                                <li>
                                    <h2>강원(4)</h2>
                                </li>
                                <li>
                                    <h2>제주(3)</h2>
                                </li>
                            </ul>
                            <div class="sub-middleSecond-menu">
                                <div class="middle-first-menu">
                                    <div onclick="theaterDolbyCinema()" class="first-menu-item">
                                        <p>DOLBY CINEMA</p>
                                        <P>(8)</P>
                                    </div>
                                    <div onclick="theaterMega()" class="first-menu-item">
                                        <p>MEGA | MX4D</p>
                                        <P>(2)</P>
                                    </div>
                                    <div onclick="theaterBoutique()" class="first-menu-item">
                                        <p>THE BOUTIQUE</p>
                                        <p>(8)</p>
                                    </div>
                                    <div onclick="theaterDolbyAtmos()" class="first-menu-item">
                                        <p>DOLBY ATMOS</p>
                                        <p>(9)</p>
                                    </div>
                                    <div onclick="theaterComfort()" class="first-menu-item">
                                        <p>COMFORT</p>
                                        <p>(69)</p>
                                    </div>
                                    <div onclick="theaterMegaBoxKids()" class="first-menu-item">
                                        <p>MEGABOX KIDS</p>
                                        <p>(2)</p>
                                    </div>
                                </div>
                                <div class="middle-second-menu">
                                    <div class="dolby-cinema-area">
                                        <div class="second-menu-item">
                                            <p>남양주현대아울렛 스페이스원</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구신세계(동대구)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전신세계 아트앤사이언스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>송도</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원ak플라자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>안성스타필드</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>코엑스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>하남스타필드</p>
                                        </div>
                                    </div>
                                    <div class="mega-mx4d-area">
                                        <div class="second-menu-item">
                                            <p>코엑스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>하남스타필드</p>
                                        </div>
                                    </div>
                                    <div class="the-boutique-area">
                                        <div class="second-menu-item">
                                            <p>대전신세계 아트앤사이언스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>더 부티크 목동현대백화점</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>분당</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>성수</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>센트럴</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>코엑스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>킨텍스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>하남스타필드</p>
                                        </div>
                                    </div>
                                    <div class="dolby-atmos-area">
                                        <div class="second-menu-item">
                                            <p>고양스타필드</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전현대아울렛</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>목동</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>상암월드컵경기장</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>성수</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원스타필드</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>원주혁신</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>충주연수</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>포항</p>
                                        </div>
                                    </div>
                                    <div class="comfort-area">
                                        <div class="second-menu-item">
                                            <p>검단</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>경산하양</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>광명ak플라자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>광명소하</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>광주상무</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>광주하남</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>금정ak플라자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>남양주</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>남양주현대아울렛 스페이스원</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구세븐밸리(칠곡)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구이시아</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구프리미엄만 경관</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전신세계 아트맨사이언스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>더 부티크 목동현대백화점</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>덕천</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>동대문</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>동탄</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>마산(경남대)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>목동</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>목포하당(포르모)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>백석벨라시타</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>별내</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>부산대</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>북대구(칠곡)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>사상</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>삼천포</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>상봉</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>상암월드컵경기장</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>세종청사</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>송도</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원ak플라자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원남문</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원스타필드</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원인계</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원호매실</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>시흥배곧</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>신촌</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>양산</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>양산증산</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>양주</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>용인기흥</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>용인테크노밸리</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>울산</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>원주혁신</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>의정부민락</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>인천논현</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>전주객사</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>전주혁신</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>정관</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>제주삼화</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>제주서귀포</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>제주아라</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>진주(중안)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>창원</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>창원내서</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>천안</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>청라지젤</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>청주사창</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>청주성안길</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>춘천석사</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>충주연수</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>코엑스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>킨텍스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>파주금촌</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>평택비전</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>포항</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>해운대(장산)</p>
                                        </div>
                                    </div>
                                    <div class="megabox-kids-area">
                                        <div class="second-menu-item">
                                            <p>마산(경남대)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>하남스타필드</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="sub-bottom-menu">
                                <div class="bottom-menu">
                                    <p>전체극장</p>
                                    <p>목록에서 극장을 선택하세요.</p>    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="time-menu">
                        <div class="time-menu-top">
                            <h1>시간</h1>
                            <img src="./images/movie-ticketing.png" alt="">
                        </div>                        
                        <div class="time-menu-middle">
                            <div class="swiper-prev">
                                <div class="material-symbols-outlined">
                                    arrow_back_ios
                                </div>
                            </div>
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <p>00</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>01</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>02</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>03</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>04</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>05</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>06</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>07</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>08</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>09</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>10</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>11</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>12</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>13</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>14</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>15</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>16</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>17</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>18</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>19</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>20</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>21</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>22</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>23</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>24</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>25</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>26</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>27</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>28</p>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-next">
                                <div class="material-symbols-outlined">
                                    arrow_forward_ios
                                </div>
                            </div>
                        </div>
                        <div class="time-menu-bottom">
                            <div class="movie-time">
                                <div class="time-show">
                                </div>
                            </div>
                            <div class="bottom-menu">
                                <div class="bottom-main">
                                    <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-movie-time.png" alt="">
                                    <p>영화와 극장을 선택하시면</p>
                                    <p>상영시간표를 비교하여 볼 수 있습니다.</p>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="advertisement">
                <a href="#">
                    <img src="https://mlink-cdn.netinsight.co.kr/2024/07/03/3d602d6e3e576b49a83ece31dacf5b13.jpg" alt="">    
                </a>
            </div>
        </div>
        <div class="home-menu">
            <div class="select-menu">
                <div class="material-symbols-outlined">
                    home
                </div>
                <div class="select1">
                    <a href="#">
                        <div class="material-symbols-outlined">
                            chevron_right
                        </div>
                        <p>예매</p>
                    </a>
                </div>
                <div class="select2">
                    <a href="#">
                        <div class="material-symbols-outlined">
                            chevron_right
                        </div>
                        <p>빠른예매</p>
                    </a>
                </div>
            </div>
        </div>
        <input type="hidden" id="ticketing_id" value="${sessionScope.name }"/>
    </main>
    <%@ include file="../include/footer.jsp" %>
</body>
</html>