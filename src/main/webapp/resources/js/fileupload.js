//파일 업로드 스크립트
  $(document).ready(function(){
    //fileCheck 함수 실행
      $("#inputfile").on("change", fileCheck);
    });
  
//첨부파일 로직
  $(function(){
		$('#filebtn').click(function (e){
			e.preventDefault();
			$('#inputfile').click();
		});
	});
	
	
  //파일현재필드 totalCount랑 비교
  var fileCount = 0;
  //업로드 개수 지정
  var totalCount = 3;
  //파일고유넘버
  var fileNum = 0;
  //첨부파일배열
  var content_files = new Array();

  function fileCheck(e) {
    var files = e.target.files;

	//파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);

	//파일 개수 확인 및 제한
    if(fileCount + filesArr.length > totalCount) {
      alert('파일은 최대 ' + totalCount + '개까지 등록 가능합니다.');
      return;
    } else {
      fileCount = fileCount + filesArr.length;
    }
    
	//각 파일 배열담기
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);
        $('#articlefileChange').append(
       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
//       		+ '<font style="font-size:12px">' + f.name + '</font>'
//       		+ ' <img src="https://cdn-icons-png.flaticon.com/512/54/54373.png" alt="삭제" style="width:15px; vertical-align: middle; cursor: pointer;"/>' 
			+ ' <img src="' + e.target.result + '" title="' + f.name + '" width=80px height=80px>'
			+ ' <img src="https://cdn-icons-png.flaticon.com/512/54/54373.png" alt="삭제" class="delBtn">' 
       		+ '<div/>'
		);
        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log(content_files);
    //초기화
    $("#inputfile").val("");
  }

// 파일 부분 삭제
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true;
	$('#' + fileNum).remove();
	fileCount --;
    console.log(content_files);
}

// 기존 파일 view에서 지워지게끔 하기
function exfileDelete(fileNum){
	$('#' + fileNum).remove();
}

// 수정하기 폼 서브밋 로직
function registerAction(){
    let re_no;
    var form = $("form")[0];        
    var formData = new FormData(form);
    for (var x = 0; x < content_files.length; x++) {
		//삭제 안한것만 담는다.
		if(!content_files[x].is_delete){
		formData.append("article_file", content_files[x]);
		}
   	}

// multiple ajax 처리
      $.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "updateReview.wp",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      async: false,
   	      success: function(data){
   	      	alert("수정 완료");
   	      	re_no = data;
   	      },
   	      error: function(xhr, status, error) {
   	    	alert("잠시 후 다시 시도해주시기 바랍니다.");
   	      return false;
   	      }
   	    });
		  location.href="detailReview.wp?re_no="+ re_no;
	}
	
//function updateRe(renum){
//	alert(renum);
//	location.href="detailReview.wp?re_no="+re_no;
//}


// 리뷰작성
	function insertAction(){
	    let w_no;
	    var form = $("form")[2];
	  //  alert($(form).children().children("div.padding-div").eq(1).children().val());
	    console.log(form);
	    var formData = new FormData(form);
	    for (var x = 0; x < content_files.length; x++) {

	      if(!content_files[x].is_delete){
	       formData.append("article_file", content_files[x]);
	      }
	    }

// multiple ajax 처리
     $.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "insertReview.wp",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      async: false,
   	      success: function(data){
   	      	w_no = data;
   	      },
   	      error: function(xhr, status, error) {
   	    	alert("잠시 후 다시 시도해주시기 바랍니다.");
   	      return false;
   	      }
   	    });
	    alert("상품후기가 등록되었습니다.");
		location.href="product.wp?w_no="+ w_no;
	}