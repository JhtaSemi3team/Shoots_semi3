<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../user/top.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/writeform.js"></script>

 <style>
  h1{font-size:1.5em; text-align:center; color:#1a92b9}
  .container{width:60%}
  label{font-weight:bold}
  #upfile{display:none}
  img{width:20px;}
 </style>

<title>게시판 글쓰기</title>


</head>
<body>
<div class="container">
  <form action="add" method="post" enctype="multipart/form-data" name="writeform">
  	<h1>게시판 글쓰기</h1>
  
  	<div class="form-group">
  		<label for="category" ></label>
  		<input type="radio" name="category" id ="A" value="A" required><span>자유게시판</span>
		<input type="radio" name="category" id ="B" value="B" required><span>중고게시판</span>
  	</div>
  	
  	<!-- 작성자 -->
  	<input name="writer" id ="writer" value="${idx}" 
				type="hidden" class="form-control" readOnly>
  
  	<div class="form-group">
  		<label for="title">제목</label>
  		<input name="title" id="title" type="text" maxlength="100" class="form-control" placeholder="제목을 입력해주세요" required>
  	</div>
  
  	<div class="form-group">
  		<label for="content">내용</label>
  		<textarea name="content" id="content" rows="20" class="form-control" placeholder="내용을 입력하세요." required></textarea>
  	</div>
  	
  	
  	
  	
  	<!-- 가격 입력 (중고게시판일 경우에만 보이게 설정) -->
  	<div class="form-group fade active show" id="price">
  		<label for="priceInput">가격</label>
  		<input name="price" id="priceInput" type="text" class="form-control" placeholder="가격을 입력해주세요" ></input >
  	</div>
  	
  
  	<div class="form-group">
  		<label>
  		파일첨부
  		 <img src="${pageContext.request.contextPath}/img/attach.png" alt="파일첨부">
  		 <input type="file" id="upfile" name="post_file" >
  		</label>
		 <span id="filevalue" >${post_file}</span>
		 <img src="${pageContext.request.contextPath}/img/remove.png"
			alt="파일삭제" width="10px" class="remove">
  	</div>
  
  	<div class="form-group">
  		<button type=reset class="btn btn-danger" onClick="history.go(-1)">취소</button>
  		<button type=submit class="btn btn-primary">등록</button>
  	</div>
  	
  </form>
 </div>
 
 
 
 
 
     <!-- 자바스크립트로 라디오 버튼 선택 시 가격 입력란 보이기/숨기기 처리 -->
    <script>
        // DOM 로딩 후 실행
        document.addEventListener("DOMContentLoaded", function() {
            // 라디오 버튼 이벤트 리스너 등록
            document.querySelectorAll("input[name='category']").forEach(function(radio) {
                radio.addEventListener("change", function() {
                    togglePriceField();
                });
            });

            // 페이지 로드 시 카테고리 값에 따라 가격 입력란 상태 설정
            togglePriceField();
            
            
         // 폼 제출 시 유효성 검사
            document.querySelector("form[name='writeform']").addEventListener("submit", function (event) {
                if (!validateForm()) {
                    event.preventDefault(); // 유효성 검사 실패 시 폼 제출 중단
                }
            });
        });

        function togglePriceField() {
            const B = document.getElementById("B").checked;
            const priceField = document.getElementById("price");
            
            // 중고게시판(B) 선택 시 가격 입력란 보이기, 아니면 숨기기
            if (B) {
                priceField.style.display = "block";
            } else {
                priceField.style.display = "none";
            }
        }
        
        
     
    
    function validateForm() {
        const B = document.getElementById("B").checked;
        const priceInput = document.getElementById("priceInput");

        // 중고게시판(B) 선택 시 가격 필수 입력 확인
        if (B) {
            if (priceInput.value.trim() === "") {
                alert("중고게시판에서는 가격을 입력해야 합니다.");
                priceInput.focus();
                return false;
            }

            // 가격이 숫자인지 확인
            if (isNaN(priceInput.value.trim())) {
                alert("가격은 숫자만 입력 가능합니다.");
                priceInput.focus();
                return false;
            }
        }

        return true; // 유효성 검사 통과
    }
        
     
     
     
        
    </script>
    
  
 
</body>
</html>
