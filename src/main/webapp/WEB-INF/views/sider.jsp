<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="./util/tlds.jsp"%>
	<div id="sidebar" class="sidebar   responsive     ace-save-state">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>
				
			<ul class="nav nav-list">
				<c:forEach items="${account.powers }"  var="power1">
						<c:if test="${power1.children.size() == 0 }">
								<li class="">
										<a data-url="${ fn:split(power1.url, ';')[0] }" href="#${ fn:split(power1.url, ';')[0] }">
											<i class="menu-icon fa ${power1.icon }"></i>
											<span class="menu-text">${power1.name }</span>
										</a>
										<b class="arrow"></b>
								</li>
						</c:if>
						<c:if test="${power1.children.size()>0 }">
							<li class="">
								<a href="javascript:void(0)" class="dropdown-toggle" powerId="${power1.id }">
										<i class="menu-icon fa ${power1.icon }"></i>
											<span class="menu-text">
												${power1.name }
											</span>
											<b class="arrow fa fa-angle-down"></b>
										</a>
									<b class="arrow"></b>
							<ul class="submenu">
							
								<c:forEach items="${power1.children}"  var="power2">
									<c:if test="${power2.children.size() == 0 }">
											<li class="">
												<a data-url="${ fn:split(power2.url, ';')[0] }" href="#${ fn:split(power2.url, ';')[0] }">
													<i class="menu-icon fa fa-caret-right"></i>
													${power2.name }
												</a>
												<b class="arrow"></b>
											</li>
									</c:if>
									<c:if test="${power2.children.size()>0}">
										<li class="">
											<a href="#" class="dropdown-toggle" powerId="${power2.id }">
												<i class="menu-icon fa fa-caret-right"></i>
												${power2.name }
												<b class="arrow fa fa-angle-down"></b>
											</a>
											<b class="arrow"></b>
											<ul class="submenu">
												<c:forEach items="${power2.children}"  var="power3">
														<li class="">
															<a data-url="${fn:split(power3.url, ';')[0] }" href="#${ fn:split(power3.url, ';')[0] }">
																<i class="menu-icon fa  green"></i>
																${power3.name }
															</a>
															<b class="arrow"></b>
														</li>
												</c:forEach>
											</ul>
										</li>
									</c:if>
								</c:forEach>
								</ul>
							</li>
						</c:if>
					</c:forEach>

				</ul><!-- /.nav-list -->
				
				
				<%-- <ul class="nav nav-list" >
					<li>
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa  fa-desktop"></i>
							<span class="menu-text">
								系统管理
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a data-url="account/toList" href="#account/toList">
									<i class="menu-icon fa fa-caret-right"></i>
									账号管理
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a data-url="role/toList" href="#role/toList">
									<i class="menu-icon fa fa-caret-right"></i>
									角色管理
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a data-url="power/toList" href="#power/toList">
									<i class="menu-icon fa fa-caret-right"></i>
									权限管理
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a data-url="settingsDict/toList" href="#settingsDict/toList">
									<i class="menu-icon fa fa-caret-right"></i>
									字典管理
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a data-url="sysLog/toList" href="#sysLog/toList">
									<i class="menu-icon fa fa-caret-right"></i>
									操作日志
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					
					
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-cog"></i>
							<span class="menu-text">
								系统设置
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a data-url="settingsConfig/toList" href="#settingsConfig/toList">
									<i class="menu-icon fa fa-caret-right"></i>
									系统配置
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-book"></i>
							<span class="menu-text">
								文章管理
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a data-url="lucence/toLucenceList" href="#lucence/toLucenceList">
									<i class="menu-icon fa fa-caret-right"></i>
									文章管理
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-cogs"></i>
							<span class="menu-text">
								流程管理
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a data-url="flow/deployManage" href="#flow/deployManage">
									<i class="menu-icon fa fa-caret-right"></i>
									流程部署
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a data-url="main2" href="#main2">
									<i class="menu-icon fa fa-caret-right"></i>
									我的任务
								</a>
								<b class="arrow"></b>
							</li>
							<shiro:hasPermission name="root:oa:list">
							<li class="">
								<a data-url="main2" href="#main2">
									<i class="menu-icon fa fa-caret-right"></i>
									我的申请
								</a>
								<b class="arrow"></b>
							</li>
							</shiro:hasPermission>
							<li class="">
								<a data-url="main2" href="#main2">
									<i class="menu-icon fa fa-caret-right"></i>
									审核历史
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-cogs"></i>
							<span class="menu-text">
								示例部分
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a data-url="demo/suofang" href="#demo/suofang">
									<i class="menu-icon fa fa-caret-right"></i>
									mui图片缩放功能
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a data-url="demo/paizhao" href="#demo/paizhao">
									<i class="menu-icon fa fa-caret-right"></i>
									手机版拍照
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a data-url="demo/ajax" href="#demo/ajax">
									<i class="menu-icon fa fa-caret-right"></i>
									复杂参数异步请求
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a data-url="demo/niceValidate" href="#demo/niceValidate">
									<i class="menu-icon fa fa-caret-right"></i>
									nice_validate文档
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-cogs"></i>
							<span class="menu-text">
								微信后台
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a data-url="demo/suofang" href="#demo/suofang">
									<i class="menu-icon fa fa-caret-right"></i>
									mui图片缩放功能
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
				</ul><!-- /.nav-list --> --%>
				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
				<!-- /section:basics/sidebar.layout.minimize -->
			</div>
			