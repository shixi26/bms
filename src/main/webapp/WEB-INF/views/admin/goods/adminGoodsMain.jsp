<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
#pagingArea {
	width: fit-content;
	margin: auto;
}
</style>
<script>

	function search_member_list(fixedSearchPeriod){
	    location.href = "${contextPath}/admin/goods/adminGoodsMain.do?fixedSearchPeriod=" + fixedSearchPeriod;
	}


	function fn_enable_detail_search(r_search) {

		var frm_delivery_list= document.frm_delivery_list;

		t_beginYear   = frm_delivery_list.beginYear;
		t_beginMonth  = frm_delivery_list.beginMonth;
		t_beginDay    = frm_delivery_list.beginDay;
		t_endYear     = frm_delivery_list.endYear;
		t_endMonth    = frm_delivery_list.endMonth;
		t_endDay      = frm_delivery_list.endDay;
		s_search_type = frm_delivery_list.s_search_type;
		t_search_word = frm_delivery_list.t_search_word;
		btn_search    = frm_delivery_list.btn_search;

		if (r_search.value == 'detail_search'){
			t_beginYear.disabled   = false;
			t_beginMonth.disabled  = false;
			t_beginDay.disabled    = false;
			t_endYear.disabled     = false;
			t_endMonth.disabled    = false;
			t_endDay.disabled      = false;
			s_search_type.disabled = false;
			t_search_word.disabled = false;
			btn_search.disabled    = false;

		}
		else {
			t_beginYear.disabled   = true;
			t_beginMonth.disabled  = true;
			t_beginDay.disabled    = true;
			t_endYear.disabled     = true;
			t_endMonth.disabled    = true;
			t_endDay.disabled      = true;
			s_search_type.disabled = true;
			t_search_word.disabled = true;
			btn_search.disabled    = true;
		}

	}

	function fn_detail_search() {

		var frm_delivery_list = document.frm_delivery_list;

		beginYear   = frm_delivery_list.beginYear.value;
		beginMonth  = frm_delivery_list.beginMonth.value;
		beginDay    = frm_delivery_list.beginDay.value;
		endYear     = frm_delivery_list.endYear.value;
		endMonth    = frm_delivery_list.endMonth.value;
		endDay      = frm_delivery_list.endDay.value;
		search_type = frm_delivery_list.s_search_type.value;
		search_word = frm_delivery_list.t_search_word.value;

		if (beginYear < 10) 	beginYear = "0" + beginYear;
		if (beginMonth < 10) 	beginMonth = "0" + beginMonth;
		if (beginDay < 10) 		beginDay = "0" + beginDay;
		if (endYear < 10) 		endYear = "0" + endYear;
		if (endMonth < 10) 		endMonth = "0" + endMonth;
		if (endDay < 10) 		endDay = "0" + endDay;

		var url = "${contextPath}/admin/goods/adminGoodsMain.do?";
			url += "beginDate="+ beginYear + "-" + beginMonth + "-" + beginDay;
			url += "&endDate=" + endYear + "-" + endMonth + "-" + endDay;
			url += "&searchType=" + search_type;
			url += "&searchWord=" + search_word;

		location.href = url;

	}

	function fnExcelReport(id, title) {
		var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
		tab_text = tab_text + '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
		tab_text = tab_text + '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
		tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
		tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
		tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
		tab_text = tab_text + "<table border='1px'>";

		var exportTable = $('#' + id).clone();
		exportTable.find('input').each(function (index, elem) { $(elem).remove(); });
		tab_text = tab_text + exportTable.html();
		tab_text = tab_text + '</table></body></html>';
		var data_type = 'data:application/vnd.ms-excel';
		var ua = window.navigator.userAgent;
		var msie = ua.indexOf("MSIE ");
		var fileName = title + '.xls';
		//Explorer 환경에서 다운로드
		if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
		if (window.navigator.msSaveBlob) {
		var blob = new Blob([tab_text], {
		type: "application/csv;charset=utf-8;"
		});
		navigator.msSaveBlob(blob, fileName);
		}
		} else {
		var blob2 = new Blob([tab_text], {
		type: "application/csv;charset=utf-8;"
		});
		var filename = fileName;
		var elem = window.document.createElement('a');
		elem.href = window.URL.createObjectURL(blob2);
		elem.download = filename;
		document.body.appendChild(elem);
		elem.click();
		document.body.removeChild(elem);
		}
		}


</script>
</head>
<body>
	<h3>상품 조회</h3>
	<form name="frm_delivery_list" method="post">
		<table>
			<tbody>
				<tr>
					<td><input type="radio" name="r_search_option"
						value="simple_search" checked
						onClick="fn_enable_detail_search(this)" /> 간단조회
						&nbsp;&nbsp;&nbsp; <input type="radio" name="r_search_option"
						value="detail_search" onClick="fn_enable_detail_search(this)" />
						상세조회 &nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>오늘 일자 &nbsp;&nbsp; <select name="curYear" disabled>
							<c:forEach var="i" begin="0" end="5">
								<c:choose>
									<c:when test="${endYear==endYear-i}">
										<option value="${endYear}" selected>${endYear}</option>
									</c:when>
									<c:otherwise>
										<option value="${endYear-i }">${endYear-i }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>년 <select name="curMonth" disabled>
							<c:forEach var="i" begin="1" end="12">
								<c:choose>
									<c:when test="${endMonth==i}">
										<option value="${i}" selected>${i}</option>
									</c:when>
									<c:otherwise>
										<option value="${i}">${i}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>월 <select name="curDay" disabled>
							<c:forEach var="i" begin="1" end="31">
								<c:choose>
									<c:when test="${endDay==i}">
										<option value="${i}" selected>${i}</option>
									</c:when>
									<c:otherwise>
										<option value="${i}">${i}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>일 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <a
						href="javascript:search_member_list('today')"> <img
							src="${contextPath}/resources/image/btn_search_one_day.jpg"></a>
						<a href="javascript:search_member_list('one_week')"> <img
							src="${contextPath}/resources/image/btn_search_1_week.jpg"></a>
						<a href="javascript:search_member_list('two_week')"> <img
							src="${contextPath}/resources/image/btn_search_2_week.jpg"></a>
						<a href="javascript:search_member_list('one_month')"> <img
							src="${contextPath}/resources/image/btn_search_1_month.jpg"></a>
						<a href="javascript:search_member_list('two_month')"> <img
							src="${contextPath}/resources/image/btn_search_2_month.jpg"></a>
						<a href="javascript:search_member_list('three_month')"> <img
							src="${contextPath}/resources/image/btn_search_3_month.jpg"></a>
						<a href="javascript:search_member_list('four_month')"> <img
							src="${contextPath}/resources/image/btn_search_4_month.jpg"></a>
						&nbsp;조회
					</td>
				</tr>
				<tr>
					<td>조회 기간 &nbsp;&nbsp; <select name="beginYear" disabled>
							<c:forEach var="i" begin="0" end="5">
								<c:choose>
									<c:when test="${beginYear == beginYear-i}">
										<option value="${beginYear-i}" selected>${beginYear-i}</option>
									</c:when>
									<c:otherwise>
										<option value="${beginYear-i}">${beginYear-i}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>년 <select name="beginMonth" disabled>
							<c:forEach var="i" begin="1" end="12">
								<c:choose>
									<c:when test="${beginMonth == i}">
										<option value="${i }" selected>${i}</option>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${i <10}">
												<option value="${i}">0${i}</option>
											</c:when>
											<c:otherwise>
												<option value="${i}">${i}</option>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>월 <select name="beginDay" disabled>
							<c:forEach var="i" begin="1" end="31">
								<c:choose>
									<c:when test="${beginDay==i }">
										<option value="${i}" selected>${i}</option>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${i <10}">
												<option value="${i}">0${i}</option>
											</c:when>
											<c:otherwise>
												<option value="${i}">${i}</option>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>일 &nbsp; ~ <select name="endYear" disabled>
							<c:forEach var="i" begin="0" end="5">
								<c:choose>
									<c:when test="${endYear==endYear-i }">
										<option value="${2021-i}" selected>${2021-i }</option>
									</c:when>
									<c:otherwise>
										<option value="${2021-i}">${2021-i}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>년 <select name="endMonth" disabled>
							<c:forEach var="i" begin="1" end="12">
								<c:choose>
									<c:when test="${endMonth==i}">
										<option value="${i}" selected>${i}</option>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${i <10}">
												<option value="${i}">0${i}</option>
											</c:when>
											<c:otherwise>
												<option value="${i}">${i}</option>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>월 <select name="endDay" disabled>
							<c:forEach var="i" begin="1" end="31">
								<c:choose>
									<c:when test="${endDay==i}">
										<option value="${i}" selected>${i}</option>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${i<10}">
												<option value="${i}">0${i}</option>
											</c:when>
											<c:otherwise>
												<option value="${i}">${i}</option>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>일
					</td>
				</tr>
				<tr>
					<td><select id="s_search_type" name="s_search_type" disabled>
							<option value="all" selected>전체</option>
							<option value="goodsId">상품번호</option>
							<option value="goodsTitle">상품이름</option>
							<option value="goodsWriter">저자</option>
							<option value="goodsPublisher">출판사</option>
					</select> <input type="text" size="30" id="t_search_word" disabled /> <input
						type="button" value="조회" id="btn_search"
						onclick="fn_detail_search()" disabled /></td>
				</tr>
			</tbody>
		</table>
		<div class="clear"></div>
	</form>
	<div align="right">
		<button class="btn btn-outline-primary btn-sm" type="button"
			onclick="fnExcelReport('table','title');">엑셀다운</button>
	</div>
	<!-- 리스트영역 -->
	<table class="list_view" id="table">
		<tbody align="center">
			<tr style="background: #8e00ff; color: #fff; height: 50px;">
				<td>상품번호</td>
				<td>상품이름</td>
				<td>저자</td>
				<td>출판사</td>
				<td>상품가격</td>
				<td>입고일자</td>
				<td>출판일</td>
			</tr>
			<c:choose>
				<c:when test="${empty newGoodsList }">
					<tr>
						<td colspan="8" class="fixed"><strong>조회된 상품이 없습니다.</strong></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="goods" items="${newGoodsList}">
						<tr>
							<td><strong>${goods.goodsId} </strong></td>
							<td><a
								href="${contextPath}/admin/goods/modifyGoodsForm.do?goodsId=${goods.goodsId}">
									<strong>${goods.goodsTitle} </strong>
							</a></td>
							<td><strong>${goods.goodsWriter}</strong></td>
							<td><strong>${goods.goodsPublisher}</strong></td>
							<td><strong>${goods.goodsPrice}</strong></td>
							<td><strong><fmt:formatDate
										value="${goods.goodsCredate}" pattern="yyyy-MM-dd" /></strong></td>
							<td><strong><fmt:formatDate
										value="${goods.goodsPublishedDate}" pattern="yyyy-MM-dd" /> </strong></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br>

	<!-- 페이징 -->
	<div id="pagingArea">
		<ul class="pagination">

			<!-- 이전 페이지 버튼 -->
			<li class="page-item ${pi.currentPage == 1 ? 'disabled' : ''}">
				<a class="page-link"
				href="${pi.currentPage > 1 ? 'adminGoodsMain.do?currentPage=' + (pi.currentPage - 1) : '#'}"
				aria-label="이전 페이지"> &laquo; </a>
			</li>

			<!-- 페이지 번호 -->
			<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				<li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a
					class="page-link" href="adminGoodsMain.do?currentPage=${p}">
						${p} </a></li>
			</c:forEach>

			<!-- 다음 페이지 버튼 -->
			<li
				class="page-item ${pi.currentPage == pi.maxPage ? 'disabled' : ''}">
				<a class="page-link"
				href="${pi.currentPage < pi.maxPage ? 'adminGoodsMain.do?currentPage=' + (pi.currentPage + 1) : '#'}"
				aria-label="다음 페이지"> &raquo; </a>
			</li>

		</ul>
	</div>






	<br>
	<div align="right">
		<input class="btn btn-indigo btn-sm" type="button"
			onclick="location.href='${contextPath}/admin/goods/addNewGoodsForm.do'"
			value="상품 등록">
	</div>
</body>
</html>