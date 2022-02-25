<%@ include file="../include/header.jspf"%>
<style>
.id_ok {
	color: #fff;
	display: none;
}

.id_already {
	color: #6A82FB;
	display: none;
}

#contentstitle {
	background-image: url('/css/searchicon.png');
	/* Add a search icon to input */
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 50%; /* Full-width */
	font-size: 16px; /* Increase font-size */
	padding: 12px 20px 12px 40px; /* Add some padding */
	border: 1px solid #ddd; /* Add a grey border */
	margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
	display: none;
	background-color: #DCEBFF;
	width: 300px;
}

#myTable th, #myTable td {
	text-align: left; /* Left-align text */
	padding: 12px; /* Add padding */
}

#myTable tr {
	/* Add a bottom border to all table rows */
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	/* Add a grey background color to the table header and on hover */
	background-color: #f1f1f1;
}
</style>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb__links">
					<a href="../main/home"><i class="fa fa-home"></i> Home</a> <a
						href="./selectmovie">관리자 페이지</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb End -->

<!-- Anime Section Begin -->
<style>
body {
	background-color: lightblue;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {

		$("#submit").on("click", function() {

			if ($("#contentsid").val() == "") {
				alert("CONTENTSID를 입력하세요.");
				$("#contentsid").focus();
				return false;
			}
			var idChkVal = $("#idChk").val();
			if (idChkVal == "N") {
				alert("중복확인 버튼을 눌러주세요.");
				return false;
			}

			if ($("#contentstitle").val() == "") {
				alert("CONTENTSTITLE를 입력하세요.");
				$("#contentstitle").focus();
				return false;
			}
			if ($("#contentssummary").val() == "") {
				alert("CONTENTSSUMMARY를 입력하세요.");
				$("#contentssummary").focus();
				return false;
			}
			if ($("#contentsstart").val() == "") {
				alert("CONTENTSSTART를 입력하세요.");
				$("#contentsstart").focus();
				return false;
			}
			if ($("#contentsseason").val() == "") {
				alert("CONTENTSSEASON를 입력하세요.");
				$("#contentsseason").focus();
				return false;
			}
			if ($("#contentsepisode").val() == "") {
				alert("CONTENTSEPISODE를 입력하세요.");
				$("#contentsepisode").focus();
				return false;
			}
			if ($("#contentsscore").val() == "") {
				alert("CONTENTSSCORE를 입력하세요.");
				$("#contentsscore").focus();
				return false;
			}
			if ($("#contentsduration").val() == "") {
				alert("CONTENTSDURATION를 입력하세요.");
				$("#contentsduration").focus();
				return false;
			} else
				alert("영상물 입력되었습니다.");
		});

	})
	function fn_idChk() {
		$.ajax({
			url : "/movie/idChk",
			type : "post",
			dataType : "json",
			data : {
				"contentsid" : $("#contentsid").val()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");
					$("#idChk").attr("value", "N");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
</script>


<section class="anime-details spad">
	<div class="container-fluid" fontcolor="white">
		<form action="/movie/insertmovie" method="post">

			<div class="row">
			
			<div class="col-md-6">
				<!-- 포이치 테이블시작 -->
				<table id="myTable">
					<tr>
						CONTENTSTITLE
						</br>
						<input type="text" id="contentstitle" name="contentstitle"
							onkeyup="myFunction()" placeholder="영상 이름을 입력하세요.">
							  <button type="button" class="btn btn-primary" onclick="button_click();">접기</button>
					</tr>


					<c:forEach var="movienameservice" items="${movienameservice}">
						<tr>
							<td><font color="black">
									${movienameservice.contentstitle} </font></td>
						</tr>
					</c:forEach>
				</table>
				<!-- 포이치 테이블끝 -->
				<script>
				
				function button_click() {
					var hide;
					hide = document.getElementById("myTable");
					hide.style.display = "none";
					
				}
				
					function myFunction() {
						// Declare variables
						var view;
						view = document.getElementById("myTable");
						view.style.display = "block";

						var input, filter, table, tr, td, i, txtValue;
						input = document.getElementById("contentstitle");
						filter = input.value.toUpperCase();
						table = document.getElementById("myTable");
						tr = table.getElementsByTagName("tr");

						// Loop through all table rows, and hide those who don't match the search query
						for (i = 0; i < tr.length; i++) {
							td = tr[i].getElementsByTagName("td")[0];
							if (td) {
								txtValue = td.textContent || td.innerText;
								if (txtValue.toUpperCase().indexOf(filter) > -1) {
									tr[i].style.display = "";
								} else {
									tr[i].style.display = "none";
								}
							}
						}

						if (input.value == "") {
							table.style.display = "none";
						}

					}
				</script>
				</div>
						<div class="col-md-6">
						CONTENTSSUMMARY</br> 
						
						<textarea name="contentssummary"
						id="contentssummary" rows=3 cols=40 placeholder="줄거리를 입력하세요."></textarea>
						
						</div>
						
			</div>


			<div class="row">
				<div class="col-md-2">
					CONTENTSID</br> <input type="text" name="contentsid" id="contentsid"
						placeholder="NUMBER(4,0)">
					<button class="idChk" type="button" id="idChk"
						onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<div class="col-md-2">
					NATIONCODE</br> <select name="nationcode" id="nationcode">
						<option value="KR" selected>KR</option>
						<option value="US">US</option>
						<option value="GB">GB</option>
						<option value="JP">JP</option>
					</select>
				</div>

				<div class="col-md-2">
					OTTID </br> <select name="ottid" id="ottid">
						<option value="1" selected>Netfilx</option>
						<option value="2">WATCHA</option>
						<option value="3">WAVVE</option>
						<option value="5">DISINEY+</option>
					</select>
				</div>


				<div class="col-md-2">
					GRADEID</br> <select name="gradeid" id="gradeid">
						<option value="19" selected>19</option>
						<option value="15">15</option>
						<option value="12">12</option>
						<option value="7">7</option>
						<option value="ALL">ALL</option>
					</select>
				</div>
				<div class="col-md-2">
					CLASSID</br> <select style="scroll: yes;" name="classid" id="classid"
						size="5">
						<option value="1" selected>드라마</option>
						<option value="2">로맨스</option>
						<option value="3">미스터리</option>
						<option value="4">뮤지컬</option>
						<option value="5">에로</option>
						<option value="6">판타지</option>
						<option value="7">모험</option>
						<option value="8">다큐멘터리</option>
						<option value="9">전쟁</option>
						<option value="10">SF</option>
						<option value="11">서부</option>
						<option value="12">스릴러</option>
						<option value="13">코미디</option>
						<option value="14">애니메이션</option>
						<option value="15">액션</option>
						<option value="16">공포</option>
						<option value="17">느와르</option>
						<option value="18">가족</option>
						<option value="19">범죄</option>
						<option value="20">무협</option>
						<option value="21">예능</option>

					</select>
				</div>

				<div class="col-md-2">
					
				</div>


			</div>
			<div class="row">
				<div class="col-md-2">
					CONTENTSSTART</br>
					<!-- <input type="date" max="9999-12-31" name="contentsstart"
						id="contentsstart" placeholder="DATE" format="yy/mm/dd" max="99-12-31"> -->
					<input type="text" name="contentsstart" id="contentsstart"
						placeholder="날짜 ? yyyy/mm/dd">
				</div>
				<div class="col-md-2">
					CONTENTSSEASON</br> <input type="text" name="contentsseason"
						id="contentsseason" placeholder="시즌이 몇개 ?">
				</div>
				<div class="col-md-2">
					CONTENTSEPISODE</br> <input type="text" name="contentsepisode"
						id="contentsepisode" placeholder="에피소드가 몇개 ?">
				</div>
				<div class="col-md-2">
					CONTENTSSCORE</br> <input type="text" name="contentsscore"
						id="contentsscore" placeholder="평점 ?">
				</div>
				<div class="col-md-2">
					CONTENTSDURATION</br> <input type="text" name="contentsduration"
						id="contentsduration" placeholder="러닝타임 ?">
				</div>
				<div class="col-md-2">
				
				
				</div>
			</div>
			</br>
			
			<button class="btn btn-success" type="submit" id="submit">등록</button>
			
			<a class="btn" id="list_btn" href="./selectmovie"><button type="button" class="btn btn-info" id="list_btn" href="./selectmovie">목록 페이지</button></a>
		</form>
	</div>

</section>
<!-- Anime Section End -->
<%@ include file="../include/footer.jspf"%>
