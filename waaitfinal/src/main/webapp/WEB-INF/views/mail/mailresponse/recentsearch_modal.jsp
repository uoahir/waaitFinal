<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<p style="margin: 0px; padding-left: 3px;">최근 검색어</p>
<c:if test="${not empty recentSearch }">
	<c:forEach var="recent" items="${recentSearch }">
		<div class="recentButtonContainer padding-top-5"
			id="recentSearchButtonContainer">
			<button class="recentSearchButton padding-bottom-5"
				onclick="searchMailByRecentSearch(event)">
				<span class="recentSearchType"> 
					<c:if test="${recent.searchType eq 'M.MAILCONTENT' }">[내용]</c:if> 
					<c:if test="${recent.searchType eq 'M.MAILTITLE' }">[타이틀]</c:if>
					<c:if test="${recent.searchType eq 'E.EMPEMAIL' }">[보낸사람]</c:if>
				</span>
				<span class="recentContentSpan">${recent.searchValue }</span>
			</button>
			<button class="searchDeleteButton padding-bottom-5"
				data-searchNo="${recent.recentSearchNo }" onclick="deleteSearchHistory(event)">x</button>
		</div>
	</c:forEach>
</c:if>
<c:if test="${empty recentSearch }">
	<div>
		<p>최근 검색어 없음</p>
	</div>
</c:if>