<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	var fileName = $(location).attr('href').split('/');
	var pageCheck = fileName[4].split('.');
	
	if(pageCheck[0] == "concert_list"){
		$("#menu01").css({
			"background-color" : "#000",
			"color" : "#FFF''
		});
		
		$("#menu02").css('background','#F8F8F8').css('color','#777');
		$("#menu03").css('background','#F8F8F8').css('color','#777');
	}else if(pageCheck[0] == "concert_list_indie"){
		$("#menu01").css('background','#F8F8F8');
		$("#menu01 a").css('color', '#000');
		$("#menu02").css('background','#000').css('color','#FFF');
		$("#menu03").css('background','#F8F8F8').css('color','#777');
	}
});
</script>    
    
		<div class="col-sm-3 col-md-2 affix-sidebar">
			<div class="sidebar-nav">
				<div class="navbar navbar-default" role="navigation">
					
					<div class="navbar-collapse collapse sidebar-navbar-collapse">
						<ul class="nav navbar-nav" id="sidenav01">
							<li class="active">
								<a href="concert_list.tk"><img src="images/traffickers_icon3.jpg"; ></a>
							</li>							
							<li id="menu01">
								<a href="concert_list.tk" style="font-size: 15px">
									<span class="glyphicon glyphicon-star-empty"></span>&nbsp; 공연 관리</a>
							</li>
							<li id="menu02">
								<a href="concert_list_indie.tk" style="font-size: 15px">
									<span class="glyphicon glyphicon-music"></span>&nbsp;인디 관리 <span class="badge pull-right">42</span>
								</a>
							</li>
							<li id="menu03">
								<a href="memberList.tk" style="font-size: 15px">
									<span class="glyphicon glyphicon-user"></span>&nbsp;회원 관리
								</a>
							</li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>    
    
    
        
    
    
    
    
