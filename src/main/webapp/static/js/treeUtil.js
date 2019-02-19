		var treeTempArray = [];
		/**
		 * treeObj:树对象
		 * inputselector:查询输入框，例 #name
		 * treeId:生成树的div的id
		 * setting:生成ztree树的setting
		 */
		function filterTreeNods(treeObj,inputselector,treeId,setting){
			treeTempArray = [];
			var filterStr = $(inputselector).val();
			var nodes = treeObj.getNodes();
			var endNodes=[];
			treeDigui(nodes,endNodes);
			for(var i=0; i<endNodes.length; i++){
				var one = endNodes[i];
				var name = one.name;
				if(name.indexOf(filterStr)>=0){//包含字符
					pushToArray(one,endNodes);
				}
			}
			//treeTempArray就是要显示的几个节点
			for(var i=0; i<endNodes.length; i++){
				var one = endNodes[i];
				var flag = iscontaintNode(one,treeTempArray)//数组中是否存在该节点
				var node =treeObj.getNodeByTId(one.tId);
				delete endNodes[i].nocheck;
				delete endNodes[i].isParent;
				delete endNodes[i].zAsync;
				delete endNodes[i].isLastNode;
				delete endNodes[i].isAjaxing;
				delete endNodes[i].checked;
				delete endNodes[i].checkedOld;
				delete endNodes[i].chkDisabled;
				delete endNodes[i].nocheck;
				delete endNodes[i].halfCheck;
				delete endNodes[i].check_Child_State;
				delete endNodes[i].check_Focus;
				if(!flag){
					endNodes[i].isHidden=true;
				}else{
					endNodes[i].isHidden=false;
				}
			}
			treeObj=$.fn.zTree.init($(treeId), setting, endNodes);
		}
		
		//是否包含
		function iscontaintNode(one,treeTempArray){
			var flag = false;
			for(var j=0; j<treeTempArray.length; j++){
				if(treeTempArray[j].tId ==one.tId){
					flag=true;
				}
			}
			return flag;
		}
		//递归得到节点
		function treeDigui(nodes, endNodes){
			for(var i=0; i<nodes.length; i++){//循环顶层节点
 				var node = nodes[i];
				var children = node.children;
				if(node.children){
					treeDigui(children, endNodes)
					node.children=null;
					endNodes.push(node);
				}else{
					endNodes.push(node);
				}
			}
		}
		
		//过滤有效数据
		function pushToArray(one,endNodes){
			var flag = false;//判断数组中是否已经包含改数据
			var tId = one.tId;
			var parentTId = one.parentTId;
			var flag= iscontaintNode(one,treeTempArray);
			if(!flag){//如果不包含
				treeTempArray.push(one);
			}
			if(parentTId==null){
				return;
			}else{
				for(var i=0; i<endNodes.length; i++){
					var tempP = endNodes[i];
					if(tempP.tId==parentTId){
						pushToArray(tempP,endNodes);
					}
				} 
			} 
		}