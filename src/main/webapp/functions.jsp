<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	// 폼 유효성 검사 함수
	function validateForm() {
	  // 입력 필드 값 가져오기
	  const name = document.getElementById("floatingName").value.trim();
	  const email = document.getElementById("floatingEmail").value.trim();
	  const phone = document.getElementById("floatingPhone").value.trim();
	  const password = document.querySelector("input[name='password']").value.trim();
	  const gender = document.querySelector("input[name='gender']:checked");
	  const hobbies = document.querySelectorAll("input[name='hobbies']:checked");

	  // 이름 검사
	  if (name === "") {
	    alert("이름을 입력해주세요.");
	    return false;
	  }

	  // 이메일 형식 검사
	  const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 이메일 정규 표현식
	  if (!emailPattern.test(email)) {
	    alert("유효한 이메일 주소를 입력해주세요.");
	    return false;
	  }

	  // 전화번호 검사 (숫자만 허용, 10~11자리)
	  const phonePattern = /^[0-9]{10,11}$/;
	  if (!phonePattern.test(phone)) {
	    alert("전화번호는 숫자만 입력해야 하며 10~11자리를 입력해주세요.");
	    return false;
	  }

	  // 비밀번호 길이 검사
	  if (password.length < 6) {
	    alert("비밀번호는 최소 6자 이상이어야 합니다.");
	    return false;
	  }

	  // 성별 선택 검사
	  if (!gender) {
	    alert("성별을 선택해주세요.");
	    return false;
	  }

	  // 취미 선택 검사
	  if (hobbies.length === 0) {
	    alert("적어도 하나의 취미를 선택해주세요.");
	    return false;
	  }

	  // 모든 유효성 검사 통과 시 true 반환 (폼 제출 허용)
	  return true;
	}

	// 폼 초기화 함수 (선택적 기능)
	function resetForm() {
	  document.getElementById("floatingName").value = "";
	  document.getElementById("floatingEmail").value = "";
	  document.getElementById("floatingPhone").value = "";
	  document.querySelector("input[name='password']").value = "";

	  // 라디오 버튼 및 체크박스 초기화
	  const genderOptions = document.querySelectorAll("input[name='gender']");
	  genderOptions.forEach(option => option.checked = false);

	  const hobbyOptions = document.querySelectorAll("input[name='hobbies']");
	  hobbyOptions.forEach(option => option.checked = false);

	  alert("폼이 초기화되었습니다.");
	}

	// 페이지 로드 시 이벤트 리스너 추가
	document.addEventListener("DOMContentLoaded", function () {
	  const form = document.querySelector("form");
	  if (form) {
	    form.onsubmit = validateForm;
	  }

	  const resetButton = document.createElement("button");
	  resetButton.type = "button";
	  resetButton.textContent = "Reset Form";
	  resetButton.className = "btn btn-secondary mt-3";
	  resetButton.onclick = resetForm;

	  form.appendChild(resetButton);
	});

    </script>
		

</body>
</html>