  $(document).ready(function(){
    //fileCheck 함수 실행
      $("#inputfile").on("change", fileCheck);
    });
  
  $(function(){
		$('#filebtn').click(function (e){
			e.preventDefault();
			$('#inputfile').click();
		});
	});


  var fileCount = 0;
  var totalCount = 3;
  var fileNum = 0;
  var content_files = new Array();

  function fileCheck(e) {
    var files = e.target.files;

    var filesArr = Array.prototype.slice.call(files);

    if(fileCount + filesArr.length > totalCount) {
      $.alert('파일은 최대 ' + totalCount + '개까지 업로드할 수 있습니다.');
      return;
    } else {
      fileCount = fileCount + filesArr.length;
    }

    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);
        $('#articlefileChange').append(
       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
       		+ '<font style="font-size:12px">' + f.name + '</font>'  
       		+ '<img src="/resources/img/dash-square.svg" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
       		+ '<div/>'
		);
        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log(content_files);
    $("#input_file").val("");
  }


function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true;
	$('#' + fileNum).remove();
	fileCount --;
    console.log(content_files);
}


function registerAction(){
		
    var form = $("form")[0];        
     var formData = new FormData(form);
      for (var x = 0; x < content_files.length; x++) {

        if(!content_files[x].is_delete){
           formData.append("article_file", content_files[x]);
        }
      }


      $.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "updateReview.wp",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      success: function (data) {
   	    	if(JSON.parse(data)['result'] == "OK"){
   	    		alert("파일업로드 성공");
			    } else
				  alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
   	      },
   	      error: function (xhr, status, error) {
   	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
   	      return false;
   	      }
   	    });
   	    return false;
	}