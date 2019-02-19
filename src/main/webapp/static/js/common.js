//定义块级作用域
(function(m, $) {
	m.loading = {
		show : function() {
			$("#loadingToast").show();
		},
		hide : function() {
			$("#loadingToast").hide();
		}
	};
	m.appendBreadcrumb = function(hash, name) {
		var breadcrumbs = $('.breadcrumb');
		var last = breadcrumbs.find('> li:last-child');
		last.removeClass('active');
		last.html('<a href="' + hash + '">' + last.text() + '<a/>')
		$('<li class="active">' + name + '</li>').insertAfter(last);
	}
	m.lastBreadcrumb = function(name) {
		var breadcrumbs = $('.breadcrumb');
		var last = breadcrumbs.find('> li:last-child');
		last.text(name);
	}
	m.itemAllAttr = function(obj) {
		if (obj != null) {
			if (obj instanceof Array) {
				for (var i = 0; i < obj.length; i++) {
					itemAllAttr(obj[i])
				}
			} else {
				for ( var attr in obj) {
					if (obj[attr] == null) {
						obj[attr] = "";
					}
				}
			}
		}
		return obj;
	};
	// 加载数据
	m.loadData = function(url, param, fn) {
		$.ajax({
			type : "post",
			cache : false,
			async : true,
			dataType : "json",
			url : url,
			data : param,
			async : false,
			success : function(result) {
				if (result.success) {
					fn(result.data)
				} else {
					bootbox.alert(result.message);
				}
			}
		})
	};
	m.createIndex = function(value, row, index) {
		var pageSize = $(row.tableSelector).bootstrapTable("getOptions").pageSize;
		var pageNumber = $(row.tableSelector).bootstrapTable("getOptions").pageNumber;
		if(pageSize=="All"){
			pageSize = 1;
		}
		return index + 1 + pageSize * (pageNumber - 1);
	};
	
	m.paizhao = {
			imgId : null,
			inputId : null,
			callback : null,
			init : function(imgId, inputId, callback) {
				var me = this;
				me.imgId = imgId;
				me.inputId = inputId;
				me.callback = callback;
				plus.nativeUI.actionSheet({
					cancel : "取消",
					buttons : [ {
						title : "拍照"
					}, {
						title : "从相册中选择"
					} ]
				}, function(e) {// 1 是拍照 2 从相册中选择
					switch (e.index) {
					case 1:
						me.clickCamera();
						break;
					case 2:
						me.clickGallery();
						break;
					}
				});
			},
			// 从相册取
			clickGallery : function() {
				var me = this;
				plus.gallery.pick(function(p) {
					me.showImg(p);
				});
			},
			// 拍照
			clickCamera : function() {
				var me = this;
				plus.camera.getCamera().captureImage(function(p) {
					plus.io.resolveLocalFileSystemURL(p, function(entry) {
						me.showImg(entry.toLocalURL());
					}, function(e) {
						mui.toast("读取拍照文件错误：" + e.message);
					});
				});
			},
			// 根据照片路径转成base64格式
			showImg : function(imgUrl) {
				var me = this;
				// 根据路径读取到文件
				plus.io.resolveLocalFileSystemURL(imgUrl, function(entry) {
					entry.file(function(file) {
						var fileReader = new plus.io.FileReader();
						fileReader.readAsDataURL(file);
						fileReader.onloadend = function(e) {
							$("#" + me.imgId).attr("src", e.target.result);
							$("#" + me.inputId).val(e.target.result);
							me.callback();
						}
					});
				});
			}
		}
    m.getQueryString = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.href.split("?");
        if (r.length > 1) {
            r = r[1].match(reg);
            if (r != null)return unescape(r[2]);
        } else {
            return null;
        }
        return null;
    };
})(window, jQuery)

// 定义错误码处理页面
$.ajaxSetup({
	//contentType:"application/x-www-form-urlencoded",
	error : function(jqXHR, textStatus, errorMsg, callback) {
		var url = "";
		if (jqXHR.status == '401') {
			bootbox.alert({
			    message: "<span style=''>无权操作!</span>"
			});
			url = "#error/401";
		} else if (jqXHR.status == '500') {
			bootbox.alert({
			    message: "<span style=''>请求遇到异常!</span>"
			});
			url = "#error/500";
		} else if (jqXHR.status == '404') {
			bootbox.alert({
			    message: "<span style=''>请求的页面不存在!</span>"
			});
			url = "#error/404";
		} else {
			bootbox.alert({
			    message: "<span style=''>请求遇到异常!</span>"
			});
			url = "error/error";
		}
		//location.href = url;
	},
	beforeSend : function(e, xhr) {
		// console.log(xhr.data);
		if (xhr.type == "POST") {
			loading.show();
		}
	},
	complete : function(xhr) {
		loading.hide();
	},
});

// 将form表单内容转成json对象
$.fn.serializeToJSON = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (this.value != null) {
			var v = this.value.trim();
			if (v != "") {
				o[this.name] = v;
			}
		}
	})
	return o;
};

var bootStrapTable = {
		table : {},// json对象
		params : {},// 表单参数
		initTable : function(tableSelector, url,otherOptions) {
			this.params = {};// 制空参数
			// 默认显示分页
			var pagination = true;
			var myTable = this;
			
	/*	    $.ajaxSetup({  
		        contentType : 'application/json'  //这里会导致ajax请求参数无法传递到后台的问题
		    });  */
			var dafaultOptions = {
					url : url, // 请求后台的URL（*）
					method : 'post', // 请求方式（*）
					contentType: "application/json",
					toolbar : '#toolbar', // 工具按钮用哪个容器
					striped : true, // 是否显示行间隔色
					cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
					queryParamsType : null,
					queryParams : function(params) {
						$.extend(true, params, bootStrapTable.params);
						this.params=myTable.formatParams(params);
						return myTable.formatParams(params);
					},
					formatLoadingMessage:function(){//数据加载中的提示隐藏，使用异步加载的默认提示方式
						return "";
					},
					contentType : "application/x-www-form-urlencoded",
					pagination : true, // 是否显示分页（*）
					sortable : true, // 是否启用排序
					sortName : "update_time",
					clickToSelect : false,// 点选行自动选中
					sortOrder : "desc", // 排序方式
					sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
					pageNumber : 1, // 初始化加载第一页，默认第一页
					pageSize : 10, // 每页的记录行数（*）
//					pageList : [ 5, 10, 20, 50, 100, 'All' ], // 可供选择的每页的行数（*）
					pageList : [ 5, 10, 20, 50, 100], // 可供选择的每页的行数（*）
					search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
					strictSearch : false,
					showColumns : false, // 是否显示所有的列
					showRefresh : false, // 是否显示刷新按钮
					minimumCountColumns : 2, // 最少允许的列数
					uniqueId : "id", // 每一行的唯一标识，一般为主键列
					showToggle : false, // 是否显示详细视图和列表视图的切换按钮
					cardView : false, // 是否显示详细视图
					detailView : false,
					paginationPreText : "上一页",
					paginationNextText : "下一页",
					responseHandler : function(r) {
						var result = {};
						//解决删除数据页面不能自动跳到上一页的问题
						if(r.success){
							if(r.data.length==0 && r.total>0){
								$(tableSelector).bootstrapTable('selectPage',r.pages)
								return false;
							} 
							result.total = r.total;
							result.rows = r.data;
							for(var i=0; i<result.rows.length;i++){
								result.rows[i].tableSelector=tableSelector;
							}
						}else {
							bootbox.alert(r.message);
						}
						return result;
					}
				};
			
			var options =$.extend(dafaultOptions,otherOptions);//扩展方法
			myTable.table = $(tableSelector);
			$(tableSelector).bootstrapTable(options);
			return this;
		},
		search : function(param) {// 传递form表单的selector类似#form/.form/form或者直接json对象
			var myTable = this;
			if ($.type(param) == "string") {
				myTable.params = $(param).serializeToJSON();
				myTable.table.bootstrapTable("refresh", {
					pageNumber : 1,
					query : myTable.params
				});
			} else {
				myTable.params = param;
				myTable.table.bootstrapTable("refresh", {
					pageNumber : 1,
					query : myTable.params
				});
			}
		},
		refresh:function(){
			var myTable = this;
			myTable.table.bootstrapTable("refresh", {
				query : myTable.params
			});
		},
		remove : function(requestUrl, ids, showMsg) {
			var myTable = this;
			if (ids instanceof Array) {
				ids = ids.join(",");
			}
			bootbox.confirm("确定要删除吗？", function(r) {
				if (r) {
					$.ajax({
						type : "post",
						cache : false,
						async : true,
						dataType : "json",
						url : requestUrl,
						data : {
							ids : ids
						},
						success : function(data) {
							if (data.success) {
								myTable.table.bootstrapTable("refresh", {
									query : myTable.params
								});
								if(showMsg){
	                                bootbox.alert(data.message);
								}
							} else {
								bootbox.alert(data.message);
							}
						}
					})
				}
			})
		},
		formatDate : function(value) {
			return dateUtil.dateToStr(dateUtil.longToDate(value), "yyyy-MM-dd");
		},
	    formatDateTime: function (value) {
	        if (value == null || value == undefined || value == "") {
	            return null;
	        } else {
	            return dateUtil.dateToStr(dateUtil.longToDate(value), "yyyy-MM-dd HH:mm");
	        }
	    },
		formatParams : function(params) {
			var sortName = params.sortName;
			for (var i = 0; i < sortName.length; i++) {
				var c = sortName.charAt(i);
				if (c >= 'A' && c <= 'Z') {
					str1 = sortName.substring(0, i);
					str2 = "_" + c.toLowerCase();
					str3 = sortName.substring(i + 1, sortName.length);
					sortName = str1 + str2 + str3;
				}
			}
			params.sortName = sortName;
			return params;
		}
	}

// 模板格式化日期方法
//template.helper('dateFormat',dateUtil.dateToStr);


