(function(window,$){
	window.setScrollHeight = function(){
		var hash = "";
		if(location.hash.indexOf("?")>0){
			var hash = location.hash.substring(1,location.hash.indexOf("?"));
		}else{
			hash = location.hash.substring(1);
		}
		localStorage.setItem("scroll_"+hash, $(document).scrollTop());
	}
	
	window.scrollTo(){
		var hash = "";
		if(location.hash.indexOf("?")>0){
			var hash = location.hash.substring(1,location.hash.indexOf("?"));
		}else{
			hash = location.hash.substring(1);
		}
		$(document).scrollTop(localStorage.getItem("scroll_"+hash));
	}
	window.resetScroll(){
		var hash = "";
		if(location.hash.indexOf("?")>0){
			var hash = location.hash.substring(1,location.hash.indexOf("?"));
		}else{
			hash = location.hash.substring(1);
		}
		localStorage.setItem("scroll_"+hash, 0);
	}
}(window,jQuery))