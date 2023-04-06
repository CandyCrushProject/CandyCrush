<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
h5 {
	float: left;
}

.btnGrp {
	float: right;
	padding: 20px 0 15px 0;
}

form {
	clear: both;
}

.addBtn {
	background-color: #0d6efd;
}

table {
	text-align: center;
}
</style>
</head>
<body>
	<!-- 검색폼 영역 -->
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">생산계획페이지</h5>
			<div class="btnGrp">
				<button id="orderSheetBtn" type="button" class="btn btn-primary"
					data-bs-toggle="modal" data-bs-target="#orderSheet">주문서</button>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#createPlan">계획등록</button>
			</div>
			<!-- Multi Columns Form -->
			<form class="row g-3">
				<div class="col-md-6">
					<label for="inputEmail5" class="form-label">Email</label> <input
						type="email" class="form-control" id="inputEmail5">
				</div>
				<div class="col-md-6">
					<label for="inputPassword5" class="form-label">Password</label> <input
						type="password" class="form-control" id="inputPassword5">
				</div>
				<div class="col-md-6">
					<label for="inputEmail5" class="form-label">Email</label> <input
						type="email" class="form-control" id="inputEmail5">
				</div>
				<div class="col-md-6">
					<label for="inputPassword5" class="form-label">Password</label> <input
						type="password" class="form-control" id="inputPassword5">
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary">Submit</button>
					<button type="reset" class="btn btn-secondary">Reset</button>
				</div>
			</form>
			<!-- End Multi Columns Form -->

		</div>
	</div>

	<!-- 테이블 영역 -->
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">생산계획조회</h5>
			<div class="btnGrp">
				<button id="deleteList" type="button" class="btn btn-primary">계획취소</button>
				<button id="updateList" type="button" class="btn btn-primary">계획수정</button>
			</div>
			<!-- Table with hoverable rows -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col"><input type="checkbox"></th>
						<th scope="col">생산계획일자</th>
						<th scope="col">생산계획명</th>
						<th scope="col">주문번호</th>
						<th scope="col">제품명</th>
						<th scope="col">주문수량</th>
						<th scope="col">현재상황</th>
						<th scope="col">납기일자</th>
						<th scope="col">생산시작예정일자</th>
						<th scope="col">생산종료일자</th>
					</tr>
				</thead>
				<tbody id="proPlanChk">
					<c:forEach var="item" items="${ProPlans}">
						<tr>
							<td id="hiddenPlanCd" hidden=true>${item.planCd }</td>
							<td hidden=true>${item.edctsCd }</td>
							<td><input type="checkbox"></td>
							<td><fmt:formatDate value="${item.planDt }"
									pattern="yyyy-MM-dd" /></td>
							<td>${item.planName }</td>
							<td>${item.orderNo }</td>
							<td>${item.prdtNm }</td>
							<td>${item.orderCnt }</td>
							<td>${item.nowSt }</td>
							<td><fmt:formatDate value="${item.paprdDt }"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${item.wkToDt }"
									pattern="yyyy-MM-dd" /></td>
							<c:choose>
								<c:when test="${empty item.wkFrDt}">
									<td>-</td>
								</c:when>
								<c:otherwise>
									<td><fmt:formatDate value="${item.wkFrDt}"
											pattern="yyyy-MM-dd" /></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class='pull-right'>
				<nav aria-label="Page navigation example">
				<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li class="page-item"><a class="page-link"
							href="${pageMaker.startPage -1}">Prev</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li class="page-item"
							${pageMaker.cri.pageNum == num ? "active":"" }><a class="page-link"
							href="${num }">${num }</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li class="page-item"><a class="page-link"
							href="${pageMaker.endPage +1}">next</a></li>
					</c:if>
				</ul>
				</nav>
			</div>
			<!-- 해당 페이지 클릭시 페이지번호와 가져올 데이터 개수(default 10개) -->
			<form action="${pageContext.request.contextPath }/productionPlan"
				id='actionForm' method='get'>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amout" value="${pageMaker.cri.amount }">
			</form>
			<!-- End Table with hoverable rows -->

		</div>
	</div>

	<!-- 모달창 -->
	<!-- 주문서 조회 -->
	<div class="modal fade" id="orderSheet" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">미지시 주문서 조회</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">주문코드</th>
								<th scope="col">거래처</th>
								<th scope="col">제품명</th>
								<th scope="col">주문수량</th>
								<th scope="col">주문일자</th>
								<th scope="col">납기일자</th>
								<th scope="col">등록</th>
							</tr>
						</thead>
						<tbody id=ordSheetTable>
						</tbody>
					</table>
					<!-- End Multi Columns Form -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 생산계획 작성 -->
	<div class="modal fade" id="createPlan" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">새로운 생산계획 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="planForm" name="newPlan" action="newPlanInsert"
						method="POST" onsubmit="return false" class="row g-3">
						<h5 class="modal-title">주문서 정보</h5>
						<div class="col-md-6">
							<label class="form-label">주문번호</label> <input type="text"
								class="form-control" id="orderNo" name="orderNo" value="PLN9000"
								readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">제품명</label> <input type="text"
								class="form-control" name="prdtNm" id="prdtNm" value="">
							<input type="hidden" class="form-control" id="edctsCd"
								name="edctsCd" readonly>
						</div>
						<div class="col-md-12">
							<label class="form-label">거래처명</label> <input type="text"
								class="form-control" id="vendNm" value="" readonly> <input
								type="hidden" class="form-control" value="" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">주문일자</label> <input type="date"
								class="form-control" id="orderDt" value="" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">납기일자</label> <input type="date"
								class="form-control" id="paprdDt" name="paprdDt" value="">
						</div>
						<div class="col-md-6">
							<label class="form-label">주문수량</label> <input type="text"
								class="form-control" id="orderCnt" name="orderCnt" value="">
						</div>
						<hr>
						<h5 class="modal-title">생산계획</h5>
						<input type="hidden" class="form-control" name="nowSt" value="미지시"
							readonly>
						<div class="col-md-6">
							<label class="form-label">생산계획코드</label> <input type="text"
								class="form-control" name="planCd" value="${nextPlanCd }"
								readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">생산계획명</label> <input type="text"
								name="planName" class="form-control">
						</div>
						<div class="col-md-6">
							<label class="form-label">생산계획일자</label> <input type="date"
								class="form-control"  id="currentDate" readonly>
						</div>
						<div class="col-md-6">
							<label class="form-label">생산시작 예정일</label> <input type="date"
								name="wkToDt" class="form-control">
						</div>
						<div class="col-md-6">
							<label class="form-label">BOM선택</label> <select id="bomSelect"
								name="bomCd" class="form-select"
								aria-label="Default select example">
								<option disabled selected>BOM선택</option>
								<c:forEach var="item" items="${bomInfo}">
									<option data-cd="${item.edctsCd }" value="${item.bomCd}">${item.bomCd}/
										${item.standard}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-6">
							<label class="form-label">우선순위</label> <select name="prefRank"
								class="form-select" aria-label="Default select example">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</div>
						<hr>
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">자재명(단위)</th>
									<th scope="col">자재소모량</th>
									<th scope="col">자재유형</th>
									<th scope="col">투입공정</th>
								</tr>
							</thead>
							<tbody id="rscTable">

							</tbody>
						</table>
					</form>
					<hr>
					<!-- End Multi Columns Form -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="newPlanSubmit" type="button" class="btn btn-primary">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal Dialog Scrollable-->
</body>
<script>
	//페이징 이동
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		
		$(".page-item a").on("click", function(e) {
			//a 태그 클릭시 이벤트 방지
			e.preventDefault();
			//페이징 버튼의 속성값을 form태그의 input값에 입력
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			//페이징 이동 form 실행
			actionForm.submit();
		})
	})
	/* 메세지 체크 */
	function printAlert(message) {
		if(message == null || message == "") return	;		
		alert(message);
		
	}
	printAlert(`${message}`);

	/* 생산계획일자 오늘 설정 */
	document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

	function formOptionchk(){
		//input값 체크
/* 		let title = document.getElementsByName('title')[0];
		let writer = document.getElementsByName('writer')[0];
		let contents = document.getElementsByName('contents')[0];
		
		if(title.value == "") {
			alert("제목이 입력되지 않았습니다.");
			title.focus();
			return;
		}
		if(writer.value == "") {
			alert("내용이 입력되지 않았습니다.");
			writer.focus();
			return;
		} */
		//form의 name 속성을 사용
		newPlan.submit();
	}
	document.querySelector('#newPlanSubmit')
			.addEventListener('click', formOptionchk);
	
	function getOrderSheet(){
		$.ajax({
			  url: 'getOrderSheet', 
			  type: 'GET', 
			  dataType: 'json',
			  success: function(data) {
			    // 성공적으로 응답 받았을 때 처리할 로직
			    var tbody = $("#ordSheetTable"); // tbody 선택
				  tbody.empty(); // tbody 비우기
				  
				  // 데이터 반복문 처리
				  $.each(data.result, function(index, item) {
				    var row = $("<tr>"); 
				    
				    // td 생성		
				    row.append($("<td>").attr("hidden", true).text(item.edctsCd));
				    row.append($("<td>").attr("hidden", true).text(item.vendCd));
				    row.append($("<th scope='row'>").text(index + 1));
				    row.append($("<td>").text(item.orderNo));
				    row.append($("<td>").text(item.vendNm));
				    row.append($("<td>").text(item.prdtNm));
				    row.append($("<td>").text(item.orderCnt));
				    var orderDt = formatDate(item.orderDt)
				    row.append($("<td>").text(orderDt));
				    var paprdDt = formatDate(item.paprdDt)
				    row.append($("<td>").text(paprdDt));
				    var button = $("<button>", {
				        type: "button",
				        class: "btn btn-primary addBtn",
				        text: "등록",
				        style: "background-color: #0d6efd;"
				    });
				    row.append(button);
				    
				    tbody.append(row); 
				  })
				  // 모달 창 열기
				  $('#orderSheet').modal('show');
			  },
			  error: function(xhr, status, error) {
			    // 요청이 실패했을 때 처리할 로직
			    console.error('요청 실패:', error);
			  }
			});
	}
	
	document.querySelector('#orderSheetBtn')
	.addEventListener('click', getOrderSheet);
	
	/* 주문서정보 -> 생산계획작성 */
	$(document).on("click", ".addBtn", function() {
	    var orderArray = [];
	    var row = $(this).closest("tr");    
	    row.find("td").each(function() {
	        orderArray.push($(this).text());
	    });
	    $("#orderNo").val(orderArray[2]); 
	    $("#prdtNm").val(orderArray[4]);
	    $("#edctsCd").val(orderArray[0]); 
	    $("#vendNm").val(orderArray[3]); 
	    $("#orderDt").val(orderArray[6]);
	    $("#paprdDt").val(orderArray[7]); 
	    $("#orderCnt").val(orderArray[5]);
	    
	 	// 현재 모달창 닫기
	    $('#orderSheet').modal('hide');

	    // 다른 모달창 열기
	    $('#createPlan').modal('show');
	});
	
	// 날짜 포맷 변경 함수
	function formatDate(time) {
	    var date = new Date(time);
	    var year = date.getFullYear();
	    var month = ("0" + (date.getMonth() + 1)).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    var formattedDate = year + "-" + month + "-" + day;
	    return formattedDate;
	}
	
	// bom선택시 이벤트
	$(document).ready(function() {
	  $("#bomSelect").change(function() {
	    // 선택된 옵션의 값을 가져와서 처리
	    var selectedBom = $(this).val();
	    console.log(selectedBom);
		$.ajax({
			  url: 'getBomRscInfo', 
			  type: 'GET', 
			  data: {
				  bomCd : selectedBom
			  },
			  dataType: 'json',
			  success: function(data) {
			    // 성공적으로 응답 받았을 때 처리할 로직
				console.log('요청 성공:', data.BomRscInfo);
			    var tbody = $("#rscTable"); // tbody 선택
				  tbody.empty(); // tbody 비우기
				  
				  // 데이터 반복문 처리
				  $.each(data.BomRscInfo, function(index, item) {
				    var row = $("<tr>"); 
				    
				    // td 생성		
				    row.append($("<th scope='row'>").text(index + 1));
				    row.append($("<td>").text(item.rscNm));
				    row.append($("<td>").text(item.useCnt+"("+item.unit+")"));
				    row.append($("<td>").text(item.rscTyp));
				    row.append($("<td>").text(item.prcsNm));
				    
				    tbody.append(row); 
				    });
				  
			  },
			  error: function(xhr, status, error) {
			    // 요청이 실패했을 때 처리할 로직
			    console.error('요청 실패:', error);
			  }
			});
	  });
	});

	/* 체크박스 연결 */
	// tbody의 체크박스
    const tbodyCheckbox = document.querySelectorAll('#proPlanChk input[type="checkbox"]');
    // thead의 체크박스
    const theadCheckbox = document.querySelector('th input[type="checkbox"]');

    // tbody의 체크박스의 상태를 모니터링하여 thead의 체크박스 상태를 변경
    function updateTheadCheckbox() {
        // tbody의 체크박스 중 하나라도 체크가 안되어 있으면 thead의 체크박스를 체크 해제
        if ([...tbodyCheckbox].some((checkbox) => !checkbox.checked)) {
            theadCheckbox.checked = false;
        } else {
            // tbody의 체크박스가 모두 체크 되어 있으면 thead의 체크박스를 체크
            theadCheckbox.checked = true;
        }
    }

    // tbody의 체크박스를 클릭할 때마다 thead의 체크박스 상태 업데이트
    tbodyCheckbox.forEach((checkbox) => {
        checkbox.addEventListener('click', () => {
            updateTheadCheckbox();
        });
    });

    // thead의 체크박스를 클릭할 때마다 tbody의 체크박스 상태 업데이트
    theadCheckbox.addEventListener('click', () => {
        tbodyCheckbox.forEach((checkbox) => {
            checkbox.checked = theadCheckbox.checked;
        });
    });
    
    //삭제버튼 
	$(document).ready(function() {
	  $("#deleteList").on("click", function() {
		if (!confirm("선택한 항목을 삭제하시겠습니까?")){
			return;
		}
	    var planCdList = [];
	    $("#proPlanChk input[type='checkbox']:checked").each(function() {
	      var planCd = $(this).closest("tr").find("#hiddenPlanCd").text();
	      planCdList.push(planCd);
	    });
	
	    // 스프링 컨트롤러에 Ajax 요청을 보냅니다.
	    $.ajax({
	    	url: "deletePlan",
	        type: "POST",
	        data: JSON.stringify(planCdList), 
	        contentType: "application/json",
	        success: function(data) {
	        	console.log(data);
	        	if(data == "success"){	        		
	            	$("#proPlanChk input[type='checkbox']:checked").closest("tr").remove();
	        	} else {
	        		alert('success까진 옴');
	        	}
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.log(textStatus + ": " + errorThrown);
	        }
	    });
	  });
	});
    
    //수정 
    $(document).ready(function() {
	  $("#updateList").on("click", function() {
	    // 체크된 tr 태그의 td들을 input 태그로 변경
	    $("table").find("tr").each(function() {
	      if ($(this).find("td").eq(2).find("input[type='checkbox']").prop("checked")) {
	        $(this).find("td").eq(4).html("<input type='text' name='planName' value='" + $(this).find("td").eq(4).text() + "'>");
	        $(this).find("td").eq(6).html("<input type='text' name='prdtNm' value='" + $(this).find("td").eq(6).text() + "'>");
	        $(this).find("td").eq(7).html("<input type='text' name='orderCnt' value='" + $(this).find("td").eq(7).text() + "'>");
	        $(this).find("td").eq(9).html("<input type='date' name='orderCnt' value='" + $(this).find("td").eq(9).text() + "'>");
	        $(this).find("td").eq(10).html("<input type='date' name='orderCnt' value='" + $(this).find("td").eq(10).text() + "'>");
	      }
	    });
	  });
	});
</script>
</html>