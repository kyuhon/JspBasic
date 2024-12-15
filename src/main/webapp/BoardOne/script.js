/*패턴검색을 진행할 것*/
function writeSave(){
	
	const namePattern = /^[a-zA-Z가-힣]{2,}$/;
	const passPattern = /^[0-9]{3,8}$/;
	
 if(document.writeForm.writer.value.trim() === ""){
  alert("작성자를 입력하십시요.");
  document.writeForm.writer.focus();
  return false;
 }
 /*return false 니까 submit 하지말라*/
 if (!namePattern.test(document.writeForm.writer.value.trim())) {
     alert("작성자는 한글 또는 영문자로 2글자 이상 입력해야 합니다.");
     document.writeForm.writer.focus();
     return false;
   }
 if(document.writeForm.subject.value==""){
  alert("제목을 입력하십시요.");
  document.writeForm.subject.focus();
  return false;
 }
 if(document.writeForm.content.value==""){
  alert("내용을 입력하십시요.");
  document.writeForm.content.focus();
  return false;
 }
        
if(document.writeForm.pass.value==""){
  alert(" 비밀번호를 입력하십시요.");
  document.writeForm.pass.focus();
  return false;
 }
 if (!passPattern.test(document.writeForm.pass.value)) {
    alert("비밀번호는 숫자 3~8자리로 입력해야 합니다.");
    document.writeForm.pass.focus();
    return false;
  }
 return true;
 }  
 
 // 삭제 패턴검색을 진행할 것
 function deleteSave(){
	const passPattern = /^[0-9]{3,8}$/;
	
  if(document.delForm.pass.value==''){
  alert("비밀번호를 입력하십시요.");
  document.delForm.pass.focus();
  return false;
  }
	if (!passPattern.test(document.delForm.pass.value)) {
	   alert("비밀번호는 숫자 3~8자리로 입력해야 합니다.");
	   document.delForm.pass.focus();
	   return false;
	 }
	return true;
  }