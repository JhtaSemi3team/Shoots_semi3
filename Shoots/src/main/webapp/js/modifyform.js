$(function(){
	function show(){
	//file name 있는/없는 경우 remove 보이게/안보이게
	$('.remove').css('display' , $('#filevalue').text() ? 'inline-block' : 'none')
	.css({'position' : 'relative', 'top' : '-5px'});
	}
	
	show();
	
	$('.remove').click(function(){
		$('#filevalue').text('');
		$(this).css('display', 'none');// or $('.remove').toggle();
	});
	
	let check = 0;
	
	$("form[name=modifyform]").submit(function(){
		const $board_subject = $('#board_subject');
		if($board_subject.val().trim() == ""){
			alert("subject 입력.");
			$board_subject.focus();
			return false;
		}
		
		const $board_content = $('#board_content');
		if($board_content.val().trim() == ""){
			alert("content 입력.");
			$board_content.focus();
			return false;
		}
		
		const $board_pass = $('#board_pass');
		if($board_pass.val().trim() == ""){
			alert("password 입력.");
			$board_pass.focus();
			return false;
		}
		
		if(check == 0){
			const value = $('#filevalue').text();
			const html = `<input type='hidden' value='${value}' name='check'>`;
			console.log(html);
			$(this).append(html);
		}
		
	});//submit click event
	
	$("#upfile").change(function(){
		check++;
		const maxSizeInBytes = 5 * 1024 * 1024;
		const file = this.files[0];
		if(file.size > maxSizeInBytes){
			alert("파일용량 <= 5MB 이어야함.");
			$(this).val('');
		}else
			$('#filevalue').text(file.name);
		
		show();
	});
	
});