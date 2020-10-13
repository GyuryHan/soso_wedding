function scroll_follow( id )
	{
	  $(window).scroll(function( )  //스크롤이 움직일때마다 이벤트 발생
	  { 
	      var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
	      $( id ).stop().animate({top:position+"px"}, 0.01); //해당 오브젝트 위치값 재설정
	   });
	}
	 scroll_follow( "#scroll" );
	 
	 
	 
	