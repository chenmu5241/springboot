		<%@ page contentType="text/html;charset=UTF-8"%>
		<%@ include file="./util/tlds.jsp"%>
		

		
		
				<div id="navbar" class="navbar navbar-default   ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
					<img src="${ctx }/static/assets/images/logonew.png">
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
                <ul class="nav navbar-nav hidden-xs hidden-sm hidden-md">
			<li ><a href="#home">首页</a></li>
					<c:forEach items="${account.powers }"  var="power1">
						<li><a onclick="toggleSider('${power1.id }')">${power1.name }</a></li>
					</c:forEach>
			</ul>
				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="${ctx}/static/assets/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>欢迎你,</small>
									${account.username }
								</span>
								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-primary dropdown-caret dropdown-close">
								<li>
									<a href="#account/toResetpwd">
										<i class="ace-icon fa fa-user"></i>
										修改密码
									</a>
								</li>
								<li>
									<a href="${ctx }/logout">
										<i class="ace-icon fa fa-power-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>

				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>
		
		<script>
			function toggleSider(id){
				$("[powerid="+id+"]").trigger("click");
			}
		</script>