<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메일 메인</h1>
	<button onclick="location.assign('${path }/mail/writemail.do')">메일쓰기</button>
	
	<c:if test="${not empty mails }">
		<table>
			<tr>
				<th>보낸 사람</th>
				<th>제목<th>
				<th>받은 날짜<th>
			</tr>
		</table>
	</c:if>
	<input type="text" placeholder="차단할 이메일 주소 입력" name='spamDomain'>
	<input type="text" placeholder="차단할 이메일 주소 입력" name='spamDomain'>
	<input type="text" placeholder="차단할 이메일 주소 입력" name='spamDomain'>
	<button onclick="addSpamDomain()">스팸도메인추가</button><br>
	<input type="text" placeholder="차단해제할 도메인" name="domainAddress">
	<input type="text" placeholder="차단해제할 도메인" name="domainAddress">
	<input type="text" placeholder="차단해제할 도메인" name="domainAddress">
	<button onclick="deleteSpamDomain()">스팸 도메인 삭제</button><br>
	<button onclick="joinSpamMailBox()">스팸메일함</button><br>
	<button onclick="location.assign('${path }/mail/temporarysavemailbox.do')">임시보관함</button><br>
	<button onclick="deleteMail()">메일 삭제</button>
	<div id="resultContainer">
		<c:if test="${not empty mails }">
			<table>
				<tr>
					<th>보낸 사람</th>
					<th>제목</th>
					<th>받은 날짜</th>
					<th>읽음 상태</th>
				</tr>
				<c:forEach var="mail" items="${mails }">
					<tr class="mailListTr" id="${mail.mailNo }">
						<td>
							<input type="checkbox" name="checkMail" id="${mail.mailNo }" onclick="buttonAble()">
							${mail.senderMailAddress }
						</td>
						<td>
							<a href="javascript:goMailDetail(${mail.mailNo })">${mail.mailTitle }</a>
						</td>
						<td>${mail.mailWriteDate }</td>
						<td>${mail.mailReadStatus }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="pageBarContainer">
				${pageBar }
			</div>
		</c:if>
		<button onclick="addMailToMyMailBox()">선택한 메일 내 메일함으로 이동</button>
		<button onclick="deleteMyMailBox()">내 메일함 삭제</button>
		<h1>내 메일함</h1>
		<ul id="myMailBoxList">
			<c:if test="${not empty myMailBoxes }">
				<c:forEach var="mailBox" items="${myMailBoxes }">
					<li>
						<input type="checkbox" name="checkMyMailBox" value="${mailBox.myMailBoxNo }">
						<a href="${path }/mail/detailmymailbox.do?myMailBoxNo=${mailBox.myMailBoxNo }">${mailBox.myMailBoxName }</a>
					</li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
	<button onclick="addFavorite()" id="addFavoriteButton" disabled>즐겨찾기</button>
	<button onclick="location.assign('${path }/mail/myfavoritemailbox.do')">즐겨찾기 메일함</button>
	<div id="resultContainer">
	
	</div>
	<div id="myMailBoxContainer">
		<input type="text" name="myMailBoxName" placeholder="내 메일함 이름">
	</div>
	<button onclick="location.assign('${path }/mail/jointrashmailbox.do')">휴지통</button>
	<div id="userBox">
		
	</div>
	<script>
		const addSpamDomain = () => {
			const spamDomain = document.querySelectorAll("input[name='spamDomain']");
			let spamDomainString = "";
			
			for(let i = 0; i < spamDomain.length; i++) {
				if(spamDomain.length - 1 == i) {
					spamDomainString += spamDomain[i].value;
				} else {
					spamDomainString += spamDomain[i].value + ",";				
				}
			}
			
			console.log("spamDomainString : " + spamDomainString);
			fetch('${path }/mail/settingspamdomain.do', {
				method : 'POST',
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded;charset=UTF-8'
				},
				body : "spamDomain=" + spamDomainString
			})			
		}
		
		const joinSpamMailBox = () => {
			fetch("${path}/mail/joinspammail.do")
			.then(response => response.text())
			.then(data => {
				document.getElementById("resultContainer").innerHTML = data;
			});
		}
		
		//내 메일함 추가
		document.querySelector("input[name='myMailBoxName']").addEventListener("blur", e => {
			const wantBoxName = e.target.value;
			if(e.target.value == "") {
				return;
			}
			console.log("wantBoxName : " + wantBoxName);
			fetch("${path}/mail/enrollmymailbox.do?wantBoxName=" + wantBoxName)
			.then(response => response.json())
			.then(data => {
				console.log(data.errorMsg);
				if(data.errorMsg === undefined) {
					const $li = document.createElement("li");
					$li.innerHTML = "<input type='checkbox' name='checkMyMailBox' value='data.myMailBoxNo'>" +
											"<a href='${path }/mail/detailmymailbox.do?myMailBoxNo=" + data.myMailBoxNo + "'>" + data.myBoxName + "</a>"
					document.getElementById("myMailBoxList").appendChild($li);
				} else {
					alert(data.errorMsg);
				}
			});
		})
		
		const deleteSpamDomain = () => {
			const domainAddress = document.querySelectorAll("input[name='domainAddress']");
			let domainAddressStr = "";
			
			for(let i = 0; i < domainAddress.length; i++) {
				if(domainAddress.length - 1 == i) {
					domainAddressStr += domainAddress[i].value;
				} else {
					domainAddressStr += domainAddress[i].value + ",";				
				}
			}
			
			console.log("domainAddressStr : " + domainAddressStr);
			fetch('${path }/mail/deletespamdomain.do', {
				method : 'POST',
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded;charset=UTF-8'
				},
				body : "domainAddresses=" + domainAddressStr
			})
		}
		
		const goMailDetail = (mailNo) => {
			location.assign("${path }/mail/maildetail.do?mailNo=" + mailNo);
		}
		/* document.querySelectorAll(".mailListTr").forEach(e => {
			e.addEventListener("click", e => {
				const mailPkNo = e.target.parentElement.id;
				location.assign("${path }/mail/maildetail.do?mailNo=" + mailPkNo);
			})
		}); */
		
		const addFavorite = () => {
			const mailCheckBox = document.querySelectorAll("input[type='checkbox']");
			let checkedCount = 0;
			let mailNoStr = "";
			
			mailCheckBox.forEach(e => {
				if(e.checked) {
					checkedCount++;
				}
			})
			
			let count = 1;
			mailCheckBox.forEach(e => {
				if(e.checked) {
					if(count == checkedCount) {
						mailNoStr += e.id;
					} else {
						mailNoStr += e.id + ",";						
					}
					count++;
				}
			})
			
			console.log(mailNoStr);
			
			fetch("${path}/mail/addfavorite.do?mailNo=" + mailNoStr)
			.then(response => response.text())
			.then(data => {
				if(data == 1) {
					alert("즐겨찾기 추가");
				} else {
					alert("실패");
				}
			});
		}
		
		const buttonAble = () => {
			let count = 0;
			document.querySelectorAll("input[name='checkMail']").forEach(e => {
				if(e.checked) count++;
				
				if(count == 0) document.getElementById("addFavoriteButton").disabled = true;
				else document.getElementById("addFavoriteButton").disabled = false;
			})
		}
		
		const addMailToMyMailBox = () => {
			let checkedCount = 0;
			document.querySelectorAll("input[name='checkMail']").forEach(e => {
				if(e.checked) checkedCount++;
			});

			let mailNoStr = "";
			let count = 1;
			document.querySelectorAll("input[name='checkMail']").forEach(e => {
				if(e.checked) {
					if(count == checkedCount) {
						mailNoStr += e.id;
					} else {
						mailNoStr += e.id + ",";						
					}
					count++;
				}
			});
			
			let myMailBoxNo = "";
			document.querySelectorAll("input[name='checkMyMailBox']").forEach(e => {
				if(e.checked) myMailBoxNo = e.value;
			})
			
			console.log("mailNoStr : " + mailNoStr + " myMailBoxNo : " + myMailBoxNo);
			fetch("${path }/mail/addmailmymailbox.do", {
				method : 'POST',
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded;charset=UTF-8'
				},
				body : "mailNoStr=" + mailNoStr + "&myMailBoxNo=" + myMailBoxNo
			})
		}
		
		const deleteMail = () => {
			let checkedCount = 0;
			document.querySelectorAll("input[name='checkMail']").forEach(e => {
				if(e.checked) checkedCount++;
			});

			let mailNoStr = "";
			let count = 1;
			document.querySelectorAll("input[name='checkMail']").forEach(e => {
				if(e.checked) {
					if(count == checkedCount) {
						mailNoStr += e.id;
					} else {
						mailNoStr += e.id + ",";						
					}
					count++;
				}
			});
			
			fetch("${path }/mail/deletemail.do", {
				method : "POST",
				headers : {
					"content-type" : "application/x-www-form-urlencoded;charset=utf-8"
				},
				body : "mailNoStr=" + mailNoStr
			})
		}
		
		const deleteMyMailBox = () => {
			document.querySelectorAll("input[name='checkMyMailBox']").forEach(e => {
				if(e.checked) {
					fetch("${path }/mail/deletemymailbox.do", {
						method : "POST",
						headers : {
							"content-type" : "application/x-www-form-urlencoded;charset=utf-8"
						},
						body : "myMailBoxNo=" + e.value
					})
				}
			})
		}
	</script>
</body>
</html>