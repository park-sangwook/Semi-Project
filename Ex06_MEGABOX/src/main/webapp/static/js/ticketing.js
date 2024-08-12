const homeMenuEl = document.querySelector('main .home-menu');
window.addEventListener('scroll', _.throttle(() => {

    if (window.scrollY < 100) {
        gsap.to(homeMenuEl, {duration: 0, opacity: 0, display: 'none'});
    } else {
        gsap.to(homeMenuEl, {duration: 0, opacity: 1, display: 'block'});
    }
}));


const swiperTicketing = new Swiper('.ticketing-select .swiper-container', {
    slidesPerView: 14,
    spaceBetween: 0,
    centeredSlides: false,
    loop: false,
    navigation: {
        prevEl: '.ticketing-select .swiper-prev',
        nextEl: '.ticketing-select .swiper-next',
    },
    pagination: false, // pagination 비활성화
});


const swiperTime = new Swiper('.time-menu .swiper-container', {
    slidesPerView: 11,
    spaceBetween: 0,
    centeredSlides: false,
    loop: false,
    navigation: {
        prevEl: '.time-menu .swiper-prev',
        nextEl: '.time-menu .swiper-next',
    },
    pagination: false, // pagination 비활성화
});

const firstMenuItem = document.querySelectorAll(".first-menu-item p");
let firstMenuItemIdx=0;
let locationName='강남';
let movieName;
firstMenuItem.forEach((item,index)=>{
	item.addEventListener("click",function(){
		firstMenuItem[firstMenuItemIdx].classList.remove("selected");
		this.classList.add("selected");
		movieName=this.textContent;
		firstMenuItemIdx=index;
		getData(movieName,locationName);
	})
})

let day=new Date().getDate();
let month = new Date().getMonth()+1;
let calendarDate=String(month).padStart(2,"0")+'-'+String(day).padStart(2,"0");
const calendarDiv = document.querySelectorAll(".swiper-slide.calendar");
let calendarIdx=0;
calendarDiv.forEach((item,index)=>{
	if(index==0){
		calendarDiv[0].classList.add("selected");		
	}
	item.addEventListener("click",function(){
		calendarDiv[calendarIdx].classList.remove("selected");
		this.classList.add("selected");
		day=(this.children[0].textContent.slice(0,2));
		calendarDate=String(month).padStart(2,"0")+'-'+String(day).padStart(2,"0");
		calendarIdx=index;
		getData(movieName,locationName);
	})
})
const theaterList = document.querySelectorAll(".theater-list>li");
let theaterListIdx=0;
theaterList.forEach((item,index)=>{
	item.addEventListener("click",function(){
		theaterList[theaterListIdx].children[0].classList.remove("selected");
		theaterList[theaterListIdx].children[1].style.display='none';
		this.children[0].classList.add("selected");
		this.children[1].style.display='block';
		theaterListIdx=index;
		theaterLocation(theaterListIdx);
	})
})
function getData(movieName,locationName){
	let total = $("<div></div>");
	console.log("movieName ",movieName);
	axios.get(`selectTicketing.jsp?name=`+(movieName!='null' && movieName!='undefined'?movieName:null)+`&locationName=${locationName}&startTime=${calendarDate}`)
	.then(response=>{
		const data = (response.data);
		console.log(data);
		data.forEach(it=>{
			let div = $("<div class='time-show'></div>");
			const start = new Date(it.start_time);
			const start_time=String(start.getHours()).padStart(2,"0")+":"+String(start.getMinutes()).padStart(2,"0");
			const end = new Date(it.end_time);
			const end_time=String(end.getHours()).padStart(2,"0")+":"+String(end.getMinutes()).padStart(2,"0");
			let time = $("<div class='time'><p>"+start_time+"</p><p>~"+String(end.getHours()).padStart(2,"0")+":"+String(end.getMinutes()).padStart(2,"0")+"</p></div>");
			
			const obj = {};
			obj.movieName=it.name;
			obj.startTime=start_time;
			obj.endTime=end_time;
			obj.roomLocation=it.room_location;
			obj.location=it.location_name;
			let info = $("<div class='info' onclick='selectFunction(\""+id+"\","+JSON.stringify(obj)+")'><p>"+it.name+"</p><p>2D</p></div>");
			let area = $("<div class='area'><p>"+locationName+"</p><p>"+it.room_location+"</p></div>");
			div.append(time);
			div.append(info);
			div.append(area);
			total.append(div);
		})
		$(".movie-time").html(total);
	})
	.catch(error=>console.log(error));
}
function theaterLocation(idx){
	let theaterLocationIdx=0;
	let div = theaterList[idx].querySelectorAll(" ul>li");
	div.forEach((item,index)=>{
		item.addEventListener("click",function(e){
			e.stopPropagation();
			locationName = this.textContent;
			div[theaterLocationIdx].classList.remove("selected");
			this.classList.add("selected");
			theaterLocationIdx=index;
			getData(movieName,locationName);
			
		})
	})
}

////////////// 시간
function selectFunction(name,obj){
	console.log(name);
	if(name==null || name.length==0){
		alert("로그인후 이용가능합니다.");
		return false;
	}
	sessionStorage.setItem("startTime",obj.startTime);
	sessionStorage.setItem("endTime",obj.endTime);
	sessionStorage.setItem("movieName",obj.movieName);
	sessionStorage.setItem("roomLocation",obj.roomLocation);
	sessionStorage.setItem("location",obj.location);
	location.href="select.jsp";
}

document.addEventListener("DOMContentLoaded",function(){
	let div = document.querySelector(".first-menu-item p.selected");
	if(div!=null){
		sessionStorage.setItem("movieName",div.children[0].textContent);		
	}
})





const secondMenuItem = document.querySelectorAll(".second-menu-item");
secondMenuItem.forEach(item=>{
	item.addEventListener("click",function(){
		if(this.classList.contains("selected")){
			const location = this.children[0].textContent;
			const movieName = (document.querySelector(".first-menu-item.selected>p").textContent);
			let total = $("<div></div>");
			const id = document.querySelector("#ticketing_id").value;
			axios.get(`selectTicketing.jsp?name=${movieName}&locationName=${location}`)
			.then(response=>{
				const data = (response.data);
				console.log(data);
				data.forEach(it=>{
					let div = $("<div class='time-show'></div>");
					const start = new Date(it.start_time);
					const start_time=String(start.getHours()).padStart(2,"0")+":"+String(start.getMinutes()).padStart(2,"0");
					const end = new Date(it.end_time);
					const end_time=String(end.getHours()).padStart(2,"0")+":"+String(end.getMinutes()).padStart(2,"0");
					let time = $("<div class='time'><p>"+start_time+"</p><p>~"+String(end.getHours()).padStart(2,"0")+":"+String(end.getMinutes()).padStart(2,"0")+"</p></div>");
					const obj = {};
					obj.movieName=movieName;
					obj.startTime=start_time;
					obj.endTime=end_time;
					obj.roomLocation=it.room_location;
					obj.location=location;
					let info = $("<div class='info' onclick='selectFunction(\""+id+"\","+JSON.stringify(obj)+")'><p>"+location+"</p><p>2D</p></div>");
					let area = $("<div class='area'><p>"+location+"</p><p>"+it.room_location+"</p></div>");
					div.append(time);
					div.append(info);
					div.append(area);
					total.append(div);
				})
				$(".movie-time").html(total);
			})
			.catch(error=>console.log(error));
		}else{
				$(".movie-time").html("");			
		}
	})
})