<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/js/jquery-3.3.1.min.js"></script>

<style>
textarea {
	width: 400px;
	height: 100px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #1E90FF;
	border-radius: 5px;
	font-size: 16px;
	resize: both;
}



#myInput {
	/* Add a search icon to input */
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 35%; /* Full-width */
	font-size: 16px; /* Increase font-size */
	padding: 12px 20px 12px 40px; /* Add some padding */
	border: 1px solid #ddd; /* Add a grey border */
	margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
	margin-left: auto; 
	margin-right: auto;
	border-collapse: collapse; /* Collapse borders */
	width: 35%; /* Full-width */
	border: 1px solid #ddd; /* Add a grey border */
	font-size: 18px; /* Increase font-size */
	
	display: none;
	
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

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg"
	data-setbg="../resources/img/normal-breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="normal__breadcrumb__text">
					<h2>선호 항목 입력</h2>
					<p>선호하는 감독을 선택해주세요.</p>
				</div>
			</div>
		</div>
	</div>
	" ' '' "
</section>
<!-- Normal Breadcrumb End -->

<!-- Signup Section Begin -->
<section class="signup spad">

	<div class="blog__details__title">
		<h2>선호하는 감독을 선택하세요.</h2>
		</br>
		<h5>
			<font color="white"> <textarea id="genreresult"
					name="genretext" rows="5" cols="33">여기에 감독이 표시됩니다.</textarea>
				</br> </br> </br>

				<table id="myTable">
					<tr>
						<input type="text" id="myInput" onkeyup="myFunction()"
							placeholder="Search for director..">
					</tr>
					<tr class="header">
						<th style="width: 80%;"><span style="color: black;">
						감독명
						</span></th>
						<th style="width: 80%;">
							<button class="btn btn-secondary" id="hidetable"
								onclick="button2_click();">close</button>

						</th>

					</tr>

					<c:forEach var="directorservice" items="${directorservice}">
						<tr>
							<td><font color="white">
									${directorservice.directorname} </font></td>
							<td><input type="checkbox" name="chBox" class="chBox"
								id="${directorservice.directorname}" onclick='getGenreValue()'
								data-genrevalue="genre"
								data-directorname="${directorservice.directorname}"></td>
						</tr>
					</c:forEach>
				</table>
			</font>
		</h5>
		<div class="insert">
			<button type="button" class="btn btn-primary"
				data-directorname="${genreserive.directorname}" id="directorsubmit">등록</button>

			<script>
  $("#directorsubmit").click(function(){
	  
	  
	  
	  
	  var chkbox = document.getElementsByName("chBox");

		var chkCnt = 0;

		for (var i = 0; i < chkbox.length; i++) {

			if (chkbox[i].checked) {

				chkCnt++;

			}

		}

		if (chkCnt < 1) {

			alert("1명 이상의 감독을 선택해주세요.");

			obj.checked = false;

			return false;
	
		}  
	  
	  
	  
   var confirm_val = confirm("감독을 등록하시겠습니까?");
   if(confirm_val) {
	   var checkArr = new Array();
	   $("input[class='chBox']:checked").each(function(){
		    checkArr.push($(this).attr("data-directorname"));
		   });
               
    $.ajax({
     url : "/member/insertfavorite",
     type : "post",
     data : { chbox : checkArr , subject : "director", usernum : ${login.usernum} },
     success : function(result){
      if(result == 1) {     
    	  alert("회원가입이 완료되었습니다!")
       location.href = "/main/home";
      } else {
       alert("등록 실패");
      }
     }
    });
   } 
  });
 </script>
		</div>
	</div>






</section>

<script>
function button2_click() {
	var hide;
	hide = document.getElementById("myTable");
	hide.style.display = "none";
	
}

function search_onfocus() {
	var view;
	view = document.getElementById("myTable");
	view.style.display = "block";
	
}



function getGenreValue()  {
    // 선택된 목록 가져오기
    const query = 'input[data-genrevalue="genre"]:checked';
    const selectedEls = 
        document.querySelectorAll(query);

    // 선택된 목록에서 value 찾기

    let genreresult = '';
    selectedEls.forEach((el) => {
    	genreresult += el.id + ' ';
    });
    // 출력

    document.getElementById('genreresult').innerText

      = genreresult;

  }

function myFunction() {
	  // Declare variables
	  var view;
	view = document.getElementById("myTable");
	view.style.display = "block";
	  
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput");
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
	  
	  if(input.value==""){
		 table.style.display="none";
	 }
	
	}
</script>
<!-- Signup Section End -->
<%@ include file="../include/footer.jspf"%>