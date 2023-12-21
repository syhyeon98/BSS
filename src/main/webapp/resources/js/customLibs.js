/**
 * 
 */

$.fn.serializeObject = function() {
	let data = {};
	let nameSet = new Set();
	// input의 name이 있는 값의 이름을 nameSet에 담는다 Set의 객체를 만든 이유는 중복을 제거하기위해
	this.find(":input[name]").each((idx, ipt) => { // this is jQuery Object
		nameSet.add(ipt.name);
	});

	// 화살표함수에서 this는 윈도우이기때문에
	let $formThis = this;
	nameSet.forEach(n => {
		let $ipt = $formThis.find(`:input[name=${n}]`); // input type의 name이 n(nameSet을 반복하여)과 같은것 
		let type = $ipt.attr("type"); // type이 checkbox일 때와 radio일때는 다른 방법으로 value값을 찾아야한다
		let value = null
		if (type == "radio") {
			value = $ipt.filter((idx, rdoIpt) => { return rdoIpt.checked; }).val();
		} else if (type == "checkbox") {
			value = $ipt.filter((idx, chkIpt) => chkIpt.checked)
				.get()
				.map(i => i.value); // map이라는 함수는 i(HTMLElement)를 i.value로 대체한다, 
		} else if (type == "number") {
			value = $ipt.val();
			value = parseInt(value);
		}
		else {
			value = $ipt.val(); // value속성 값을 반환(attribute는 String 타입=>String타입을 반환)
		}
		data[n] = value;
	});
	return data;
}


$.timeFormat = function(time) {
	// formatting : 1:59
	if ((time || time == 0) && time >= 0) {
		let minute = Math.trunc(time / 60);
		let second = time % 60;
		return `${new String(minute).padStart(2, '0')}:${new String(second).padStart(2, '0')}`;
	} else {
		throw new Error("시간 데이터는 0이상의 값이 필요함")
	}
};

const speed = 100;

$.fn.timer = function() {
	this.each(function(index, element) { // 여기서 this는 span
		const $element = $(this); // $(this)는 각 element(span)을 제이쿼리형태로 만듬
		const timeout = $element.data("timeout"); // span이 갖고 있는 data-timeout 값 
		if (!timeout || !/^\d+$/.test(timeout)) throw new Error(`타이머(${timeout})는 숫자로 구성`);
		/*타이머의 조건
		1. 타이머 초기값
		2. 1초마다 타이머를 차감
			1) 차감된 값을 유지할 수 있는 프로퍼티
			2) 차감을 시키기 위한 스케쥴링 작업
		3. 차감되는 타이머 값은 매 시점마다 타이머의 영역에 출력.
		4. 타이머의 값은 02:00 과 같은 형태로 출력
		5. optional : 필요하다면 타이머 영역 다음에 메시지 창을 생성함, 해당 메세지는 1분 남은 시점에 랜더링
			1) 메세지 영역 프로퍼티 추가
			2) 메세지 처리를 위한 지연 작업 스케줄링
		*/

		function TimerInfo(timeout, timerArea, msgFlag = false) {
			
			this.timeout = timeout-1;
			this.timerArea = timerArea;
			this.init = function() {
				this.timer = timeout;
				if (msgFlag) {
					this.$messageArea = _makeMessageDiv(this.timerArea);
					this.messageJob = setTimeout((function() {
						this.$messageArea.show();
						console.log(this);
					}).bind(this), (this.timeout - 60) * speed);
				}
			}

			let _makeMessageDiv = function(element) {
				let $messageDiv = $("<div>").addClass("message-area").append(
					$("<p>").html("세션 연장 여부 확인"),
					$("<input>").attr({
						type: "button",
						value: "예"
					}).addClass("controlBtn").data("role", "yesBtn"),
					$("<input>").attr({
						type: "button",
						value: "아니요"
					}).addClass("controlBtn").data("role", "noBtn")
				).on("click", ".controlBtn", function(event) {//디센던트
					let $btn = $(event.target);
					let role = $btn.data("role");
					if (role == "yesBtn") {
						$.ajax({
							url:element.dataset.requestUrl,
							method:"head"
						}).done(()=>{
							// 타이머값도 초기화, 메시지 작업도 초기화
							element._timerInfo.init();
						});
					}
					$btn.parents(".message-area").remove();
					/*delete element._timerInfo.$messageArea;
					delete element._timerInfo.messageJob;*/
				}).hide().insertAfter(element);
				return $messageDiv;
			};

			this.init();

			this.destroy = function() {
				clearInterval(this.timerJob);
				if (this.$messageArea) {
					this.$messageArea.remove();
					clearTimeout(this.messageJob);
				};
				console.log("전 : ", this.timerArea._timerInfo);
				delete this.timerArea._timerInfo;
				console.log("후 : ", this.timerArea._timerInfo);
			};
			this.timerJob = setInterval((function() {
				if (this.timer <= 0) {
					this.destroy();
				} else {
					this.timerArea.innerHTML = $.timeFormat(--this.timer);
				}
			}).bind(this), 1 * speed);
		}
		let msgFlag = $element.data("msgFlag");
		element._timerInfo = new TimerInfo(timeout, element, msgFlag);
		console.log(element._timerInfo);
	});
	return this;
}
/*$(document).ready(function(){});*/

$(function(){
	let $span = $("[data-timeout]").timer();
});