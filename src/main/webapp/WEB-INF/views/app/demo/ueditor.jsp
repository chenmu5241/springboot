<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div>
    <h1>完整demo</h1>
    <script id="editor" type="text/plain" style="width:1024px;height:200px;"></script>
</div>
<div id="btns">
    <div>
        <button onclick="getAllHtml()">获得整个html的内容</button>
        <button onclick="getContent()">获得内容</button>
        <button onclick="setContent()">写入内容</button>
        <button onclick="setContent(true)">追加内容</button>
        <button onclick="getContentTxt()">获得纯文本</button>
        <button onclick="getPlainTxt()">获得带格式的纯文本</button>
        <button onclick="hasContent()">判断是否有内容</button>
        <button onclick="setFocus()">使编辑器获得焦点</button>
        <button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
        <button onmousedown="setblur(event)" >编辑器失去焦点</button>

    </div>
    <div>
        <button onclick="getText()">获得当前选中的文本</button>
        <button onclick="insertHtml()">插入给定的内容</button>
        <button id="enable" onclick="setEnabled()">可以编辑</button>
        <button onclick="setDisabled()">不可编辑</button>
        <button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
        <button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
        <button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
    </div>

    <div>
        <button onclick="getLocalData()" >获取草稿箱内容</button>
        <button onclick="clearLocalData()" >清空草稿箱</button>
    </div>

</div>
<div>
    <button onclick="createEditor()">
    创建编辑器</button>
    <button onclick="deleteEditor()">
    删除编辑器</button>
</div>
<div class="row">
<div class="col-md-9 ue-docs-main" role="main">
            <div id="show"><h1>前端配置项说明</h1>

<p>UEditor 的配置项分为两类：<strong>前端配置项</strong> 和 <strong>后端配置项</strong></p>

<p>后端配置项具体看这个文档L：<a class="mardwodnlink" href="#undefined">后端配置项说明</a></p>

<p>本文档介绍如何通过设置前端配置项，定制编辑器的特性，配置方法主要通过修改ueditor.config.js，另外在编辑器实例化的时候也可以传入配置参数
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="kwd">var</span><span class="pln"> ue </span><span class="pun">=</span><span class="pln"> UE</span><span class="pun">.</span><span class="pln">getEditor</span><span class="pun">(</span><span class="str">'container'</span><span class="pun">,</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    toolbars</span><span class="pun">:</span><span class="pln"> </span><span class="pun">[</span><span class="pln">
        </span><span class="pun">[</span><span class="str">'fullscreen'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'source'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'undo'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'redo'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'bold'</span><span class="pun">]</span><span class="pln">
    </span><span class="pun">],</span><span class="pln">
    autoHeightEnabled</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">true</span><span class="pun">,</span><span class="pln">
    autoFloatEnabled</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">true</span><span class="pln">
</span><span class="pun">});</span></pre><p></p>
可选内容<br>
toolbars:[  
            ['fullscreen', 'source', '|', 'undo', 'redo', '|',  
                'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',  
                'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',  
                'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',  
                'directionalityltr', 'directionalityrtl', 'indent', '|',  
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',  
                'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',  
                'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe','insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',  
                'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',  
                'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',  
                'print', 'preview', 'searchreplace', 'help', 'drafts']  
        ]  

<h2>读取配置项</h2>

<p>读取配置项可以通过getOpt方法读取
</p><pre class="prettyprint prettyprinted"><span class="kwd">var</span><span class="pln"> lang </span><span class="pun">=</span><span class="pln"> ue</span><span class="pun">.</span><span class="pln">getOpt</span><span class="pun">(</span><span class="str">'lang'</span><span class="pun">);</span><span class="pln"> </span><span class="com">//默认返回：zh-cn</span></pre><p></p>

<h2>前端配置项说明</h2>

<blockquote><p>以下的"URL"是ueditor.config.js文件所在目录</p></blockquote>

<ul><li><p><strong>UEDITOR_HOME_URL</strong> {Path String} [默认值：根据config文件路径自动获取] // 为编辑器实例添加一个路径，这个不能被注释</p></li><li><p><strong>serverUrl</strong> {Path String} [默认值：URL + "php/controller.php"] // 服务器统一请求接口路径</p></li><li><p><strong>toolbars</strong> {2d Array} //工具栏上的所有的功能按钮和下拉框，可以在new编辑器的实例时选择自己需要的从新定义</p></li><li><p><strong>labelMap</strong> {Object} [默认：从lang包的labelMap项获取] //参数格式是键值对，键名对应toolbar参数的项：{"bold": "加粗"} ]，当鼠标放在工具栏上时显示的tooltip提示，留空支持自动多语言配置，否则以配置值为准</p></li><li><p><strong>lang</strong> {String} [默认值："zh-cn"] //lang值也可以通过自动获取 (navigator.language||navigator.browserLanguage ||navigator.userLanguage).toLowerCase()，语言配置项，默认是zh-cn。有需要的话也可以使用如下这样的方式来自动多语言切换，当然，前提条件是lang文件夹下存在对应的语言文件：</p></li><li><p><strong>langPath</strong> {Path String} [默认值：URL +"lang/"] //语言包文件存放目录</p></li><li><p><strong>theme</strong> {String} [默认值：'default'] //主题配置项，默认是default。有需要的话也可以使用如下这样的方式来自动多主题切换，当然，前提条件是themes文件夹下存在对应的主题文件：</p></li><li><p><strong>themePath</strong> {Path String} [默认值：URL +"themes/"] //现有如下皮肤：default</p></li><li><p><strong>zIndex</strong> {Number} [默认值：900] //编辑器在页面上的z-index层级的基数，默认是900</p></li><li><p><strong>charset</strong> {String} [默认值："utf-8"] //针对getAllHtml方法，会在对应的head标签中增加该编码设置。</p></li><li><p><strong>customDomain</strong> {Boolean} [默认值：false] //若实例化编辑器的页面手动修改的domain，此处需要设置为true</p></li><li><p><strong>isShow</strong> {Boolean} [默认值：true] //默认显示编辑器</p></li><li><p><strong>textarea</strong> {String} [默认值：'editorValue'] // 提交表单时，服务器获取编辑器提交内容的所用的参数，多实例时可以给容器name属性，会将name给定的值最为每个实例的键值，不用每次实例化的时候都设置这个值</p></li><li><p><strong>initialContent</strong> {String} [默认值：'欢迎使用ueditor!'] //初始化编辑器的内容，也可以通过textarea/script给值，看官网例子</p></li><li><p><strong>autoClearinitialContent</strong> {Boolean} [默认值：true] //是否自动清除编辑器初始内容，注意：如果focus属性设置为true，这个也为真，那么编辑器一上来就会触发导致初始化的内容看不到了</p></li><li><p><strong>focus</strong> {Boolean} [默认值：false] //初始化时，是否让编辑器获得焦点true或false</p></li><li><p><strong>initialStyle</strong> {String} [默认值：'p{line-height:1em}']//编辑器层级的基数，可以用来改变字体等 //如果自定义，最好给p标签如下的行高，要不输入中文时，会有跳动感</p></li><li><p><strong>iframeCssUrl</strong> {Path String} [默认值：URL + '/themes/iframe.css'] //给编辑器内部引入一个css文件</p></li><li><p><strong>indentValue</strong> {String} [默认值：'2em'] //首行缩进距离，默认是2em</p></li><li><p><strong>initialFrameWidth</strong> {Number} [默认值：1000]  //初始化编辑器宽度，默认1000</p></li><li><p><strong>initialFrameHeight</strong> {Number} [默认值：320] //初始化编辑器高度，默认320</p></li><li><p><strong>readonly</strong> {Boolean} [默认值：false] //编辑器初始化结束后，编辑区域是否是只读的，默认是false</p></li><li><p><strong>autoClearEmptyNode</strong> {Boolean} [默认值：true] //getContent时，是否删除空的inlineElement节点（包括嵌套的情况）</p></li><li><p><strong>enableAutoSave</strong> {Boolean} [默认值：true] //启用自动保存</p></li><li><p><strong>saveInterval</strong> {Number} [默认值：500] //自动保存间隔时间，单位ms</p></li><li><p><strong>imageScaleEnabled</strong> {Boolean} [默认值：true] //启用图片拉伸缩放</p></li><li><p><strong>fullscreen</strong> {Boolean} [默认值：false] //是否开启初始化时即全屏，默认关闭</p></li><li><p><strong>imagePopup</strong> {Boolean} [默认值：true]      //图片操作的浮层开关，默认打开</p></li><li><p><strong>autoSyncData</strong> {Boolean} [默认值：true] //自动同步编辑器要提交的数据</p></li><li><p><strong>emotionLocalization</strong> {Boolean} [默认值：false] //是否开启表情本地化，默认关闭。若要开启请确保emotion文件夹下包含官网提供的images表情文件夹</p></li><li><p><strong>retainOnlyLabelPasted</strong> {Boolean} [默认值：false]  //粘贴只保留标签，去除标签所有属性</p></li><li><p><strong>pasteplain</strong> {Boolean} [默认值：false]  //是否默认为纯文本粘贴。false为不使用纯文本粘贴，true为使用纯文本粘贴</p></li><li><p><strong>filterTxtRules</strong> {Object} //纯文本粘贴模式下的过滤规则
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="com">//默认值：</span><span class="pln">
</span><span class="kwd">function</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    </span><span class="kwd">function</span><span class="pln"> transP</span><span class="pun">(</span><span class="pln">node</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
        node</span><span class="pun">.</span><span class="pln">tagName </span><span class="pun">=</span><span class="pln"> </span><span class="str">'p'</span><span class="pun">;</span><span class="pln">
        node</span><span class="pun">.</span><span class="pln">setStyle</span><span class="pun">();</span><span class="pln">
    </span><span class="pun">}</span><span class="pln">
    </span><span class="kwd">return</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
        </span><span class="com">//直接删除及其字节点内容</span><span class="pln">
        </span><span class="str">'-'</span><span class="pun">:</span><span class="pln"> </span><span class="str">'script style object iframe embed input select'</span><span class="pun">,</span><span class="pln">
        </span><span class="str">'p'</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
            $</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{}</span><span class="pln">
        </span><span class="pun">},</span><span class="pln">
        </span><span class="str">'br'</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
            $</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{}</span><span class="pln">
        </span><span class="pun">},</span><span class="pln">
        </span><span class="str">'div'</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
            </span><span class="str">'$'</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{}</span><span class="pln">
        </span><span class="pun">},</span><span class="pln">
        </span><span class="str">'li'</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
            </span><span class="str">'$'</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{}</span><span class="pln">
        </span><span class="pun">},</span><span class="pln">
        </span><span class="str">'caption'</span><span class="pun">:</span><span class="pln"> transP</span><span class="pun">,</span><span class="pln">
        </span><span class="str">'th'</span><span class="pun">:</span><span class="pln"> transP</span><span class="pun">,</span><span class="pln">
        </span><span class="str">'tr'</span><span class="pun">:</span><span class="pln"> transP</span><span class="pun">,</span><span class="pln">
        </span><span class="str">'h1'</span><span class="pun">:</span><span class="pln"> transP</span><span class="pun">,</span><span class="pln">
        </span><span class="str">'h2'</span><span class="pun">:</span><span class="pln"> transP</span><span class="pun">,</span><span class="pln">
        </span><span class="str">'h3'</span><span class="pun">:</span><span class="pln"> transP</span><span class="pun">,</span><span class="pln">
        </span><span class="str">'h4'</span><span class="pun">:</span><span class="pln"> transP</span><span class="pun">,</span><span class="pln">
        </span><span class="str">'h5'</span><span class="pun">:</span><span class="pln"> transP</span><span class="pun">,</span><span class="pln">
        </span><span class="str">'h6'</span><span class="pun">:</span><span class="pln"> transP</span><span class="pun">,</span><span class="pln">
        </span><span class="str">'td'</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">(</span><span class="pln">node</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
            </span><span class="com">//没有内容的td直接删掉</span><span class="pln">
            </span><span class="kwd">var</span><span class="pln"> txt </span><span class="pun">=</span><span class="pln"> </span><span class="pun">!!</span><span class="pln"> node</span><span class="pun">.</span><span class="pln">innerText</span><span class="pun">();</span><span class="pln">
            </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(</span><span class="pln">txt</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
                node</span><span class="pun">.</span><span class="pln">parentNode</span><span class="pun">.</span><span class="pln">insertAfter</span><span class="pun">(</span><span class="pln">UE</span><span class="pun">.</span><span class="pln">uNode</span><span class="pun">.</span><span class="pln">createText</span><span class="pun">(</span><span class="str">' &nbsp; &nbsp;'</span><span class="pun">),</span><span class="pln"> node</span><span class="pun">);</span><span class="pln">
            </span><span class="pun">}</span><span class="pln">
            node</span><span class="pun">.</span><span class="pln">parentNode</span><span class="pun">.</span><span class="pln">removeChild</span><span class="pun">(</span><span class="pln">node</span><span class="pun">,</span><span class="pln"> node</span><span class="pun">.</span><span class="pln">innerText</span><span class="pun">())</span><span class="pln">
        </span><span class="pun">}</span><span class="pln">
    </span><span class="pun">}</span><span class="pln">
</span><span class="pun">}()</span></pre><p></p></li><li><p><strong>allHtmlEnabled</strong> [默认值：false] //提交到后台的数据是否包含整个html字符串</p></li><li><p><strong>insertorderedlist</strong> //有序列表的下拉配置，值留空时支持多语言自动识别，若配置值，则以此值为准
</p><pre class="prettyprint prettyprinted"><span class="com">//默认值：</span><span class="pln">
</span><span class="pun">{</span><span class="pln">
</span><span class="com">//自定的样式</span><span class="pln">
</span><span class="str">'num'</span><span class="pun">:</span><span class="pln"> </span><span class="str">'1,2,3...'</span><span class="pun">,</span><span class="pln">
</span><span class="str">'num1'</span><span class="pun">:</span><span class="pln"> </span><span class="str">'1),2),3)...'</span><span class="pun">,</span><span class="pln">
</span><span class="str">'num2'</span><span class="pun">:</span><span class="pln"> </span><span class="str">'(1),(2),(3)...'</span><span class="pun">,</span><span class="pln">
</span><span class="str">'cn'</span><span class="pun">:</span><span class="pln"> </span><span class="str">'一,二,三....'</span><span class="pun">,</span><span class="pln">
</span><span class="str">'cn1'</span><span class="pun">:</span><span class="pln"> </span><span class="str">'一),二),三)....'</span><span class="pun">,</span><span class="pln">
</span><span class="str">'cn2'</span><span class="pun">:</span><span class="pln"> </span><span class="str">'(一),(二),(三)....'</span><span class="pun">,</span><span class="pln">
</span><span class="com">//系统自带</span><span class="pln">
</span><span class="str">'decimal'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pln"> </span><span class="pun">,</span><span class="pln"> </span><span class="str">'1,2,3...'</span><span class="pln">
</span><span class="str">'lower-alpha'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pln"> </span><span class="pun">,</span><span class="pln"> </span><span class="com">// 'a,b,c...'</span><span class="pln">
</span><span class="str">'lower-roman'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pln"> </span><span class="pun">,</span><span class="pln"> </span><span class="com">//'i,ii,iii...'</span><span class="pln">
</span><span class="str">'upper-alpha'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pln"> </span><span class="pun">,</span><span class="pln"> </span><span class="com">//'A,B,C'</span><span class="pln">
</span><span class="str">'upper-roman'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pln"> </span><span class="com">//'I,II,III...'</span><span class="pln">
</span><span class="pun">}</span></pre><p></p></li><li><p><strong>insertunorderedlist</strong> //无序列表的下拉配置，值留空时支持多语言自动识别，若配置值，则以此值为准
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="pun">{</span><span class="pln"> </span><span class="com">//自定的样式</span><span class="pln">
    </span><span class="str">'dash'</span><span class="pun">:</span><span class="pln"> </span><span class="str">'— 破折号'</span><span class="pun">,</span><span class="pln"> </span><span class="com">//-破折号</span><span class="pln">
    </span><span class="str">'dot'</span><span class="pun">:</span><span class="pln"> </span><span class="str">' 。 小圆圈'</span><span class="pun">,</span><span class="pln"> </span><span class="com">//系统自带</span><span class="pln">
    </span><span class="str">'circle'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln"> </span><span class="com">// '○ 小圆圈'</span><span class="pln">
    </span><span class="str">'disc'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln"> </span><span class="com">// '● 小圆点'</span><span class="pln">
    </span><span class="str">'square'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pln"> </span><span class="com">//'■ 小方块'</span><span class="pln">
</span><span class="pun">}]</span></pre>`<p></p></li><li><p><strong>listDefaultPaddingLeft</strong> [默认值：'30'//默认的左边缩进的基数倍</p></li><li><strong>listiconpath</strong> [默认值：'http://bs.baidu.com/listicon/']//自定义标号的路径</li><li><p><strong>maxListLevel</strong> [默认值：3] //限制可以tab的级数， 设置-1为不限制</p></li><li><p><strong>autoTransWordToList</strong> [默认值：false]  //禁止word中粘贴进来的列表自动变成列表标签</p></li><li><p><strong>fontfamily</strong> //字体设置 label留空支持多语言自动切换，若配置，则以配置值为准
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="com">//默认值：</span><span class="pln">
</span><span class="pun">[{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'songti'</span><span class="pun">,</span><span class="pln">
    val</span><span class="pun">:</span><span class="pln"> </span><span class="str">'宋体,SimSun'</span><span class="pln">
</span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'kaiti'</span><span class="pun">,</span><span class="pln">
    val</span><span class="pun">:</span><span class="pln"> </span><span class="str">'楷体,楷体_GB2312, SimKai'</span><span class="pln">
</span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'yahei'</span><span class="pun">,</span><span class="pln">
    val</span><span class="pun">:</span><span class="pln"> </span><span class="str">'微软雅黑,Microsoft YaHei'</span><span class="pln">
</span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'heiti'</span><span class="pun">,</span><span class="pln">
    val</span><span class="pun">:</span><span class="pln"> </span><span class="str">'黑体, SimHei'</span><span class="pln">
</span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'lishu'</span><span class="pun">,</span><span class="pln">
    val</span><span class="pun">:</span><span class="pln"> </span><span class="str">'隶书, SimLi'</span><span class="pln">
</span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'andaleMono'</span><span class="pun">,</span><span class="pln">
    val</span><span class="pun">:</span><span class="pln"> </span><span class="str">'andale mono'</span><span class="pln">
</span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'arial'</span><span class="pun">,</span><span class="pln">
    val</span><span class="pun">:</span><span class="pln"> </span><span class="str">'arial, helvetica,sans-serif'</span><span class="pln">
</span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'arialBlack'</span><span class="pun">,</span><span class="pln">
    val</span><span class="pun">:</span><span class="pln"> </span><span class="str">'arial black,avant garde'</span><span class="pln">
</span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'comicSansMs'</span><span class="pun">,</span><span class="pln">
    val</span><span class="pun">:</span><span class="pln"> </span><span class="str">'comic sans ms'</span><span class="pln">
</span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'impact'</span><span class="pun">,</span><span class="pln">
    val</span><span class="pun">:</span><span class="pln"> </span><span class="str">'impact,chicago'</span><span class="pln">
</span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'timesNewRoman'</span><span class="pun">,</span><span class="pln">
    val</span><span class="pun">:</span><span class="pln"> </span><span class="str">'times new roman'</span><span class="pln">
</span><span class="pun">}]</span></pre><p></p></li><li><p><strong>fontsize</strong> {Array} //字号
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="com">//默认值：</span><span class="pln">
</span><span class="pun">[</span><span class="lit">10</span><span class="pun">,</span><span class="pln"> </span><span class="lit">11</span><span class="pun">,</span><span class="pln"> </span><span class="lit">12</span><span class="pun">,</span><span class="pln"> </span><span class="lit">14</span><span class="pun">,</span><span class="pln"> </span><span class="lit">16</span><span class="pun">,</span><span class="pln"> </span><span class="lit">18</span><span class="pun">,</span><span class="pln"> </span><span class="lit">20</span><span class="pun">,</span><span class="pln"> </span><span class="lit">24</span><span class="pun">,</span><span class="pln"> </span><span class="lit">36</span><span class="pun">]</span></pre><p></p></li><li><p><strong>paragraph</strong> {Object} //段落格式 值留空时支持多语言自动识别，若配置，则以配置值为准
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="com">//默认值：</span><span class="pln">
</span><span class="pun">{</span><span class="pln">
    </span><span class="str">'p'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    </span><span class="str">'h1'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    </span><span class="str">'h2'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    </span><span class="str">'h3'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    </span><span class="str">'h4'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    </span><span class="str">'h5'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
    </span><span class="str">'h6'</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pln">
</span><span class="pun">}</span></pre><p></p></li><li><p><strong>rowspacingtop</strong> {Array} //段间距 值和显示的名字相同
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="com">//默认值：</span><span class="pln">
</span><span class="pun">[</span><span class="str">'5'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'10'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'15'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'20'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'25'</span><span class="pun">]</span></pre><p></p></li><li><p><strong>rowspacingbottom</strong> //段间距 值和显示的名字相同
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="com">//默认值：</span><span class="pln">
</span><span class="pun">[</span><span class="str">'5'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'10'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'15'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'20'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'25'</span><span class="pun">]</span></pre><p></p></li><li><p><strong>lineheight</strong> [默认值：['1', '1.5','1.75','2', '3', '4', '5'] ] //行内间距 值和显示的名字相同</p></li><li><p><strong>customstyle</strong> [Array] //自定义样式，不支持国际化，此处配置值即可最后显示值block的元素是依据设置段落的逻辑设置的，inline的元素依据BIU的逻辑设置，尽量使用一些常用的标签
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="com">//默认值：</span><span class="pln">
</span><span class="pun">[{</span><span class="pln">
        tag</span><span class="pun">:</span><span class="pln"> </span><span class="str">'h1'</span><span class="pun">,</span><span class="pln"> </span><span class="com">//tag 使用的标签名字</span><span class="pln">
        name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'tc'</span><span class="pun">,</span><span class="pln"> </span><span class="com">//</span><span class="pln">
        label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln"> </span><span class="com">//label 显示的名字也是用来标识不同类型的标识符，注意这个值每个要不同</span><span class="pln">
        style</span><span class="pun">:</span><span class="pln"> </span><span class="str">'border-bottom:#ccc 2px solid;padding:0 4px 0 0;text-align:center;margin:0 0 20px 0;'</span><span class="pln"> </span><span class="com">//style 添加的样式</span><span class="pln">
    </span><span class="pun">},</span><span class="pln"> </span><span class="com">//每一个对象就是一个自定义的样式</span><span class="pln">
    </span><span class="pun">{</span><span class="pln">
        tag</span><span class="pun">:</span><span class="pln"> </span><span class="str">'h1'</span><span class="pun">,</span><span class="pln">
        name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'tl'</span><span class="pun">,</span><span class="pln">
        label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
        style</span><span class="pun">:</span><span class="pln"> </span><span class="str">'border-bottom:#ccc 2px solid;padding:0 4px 0 0;margin:0 0 10px 0;'</span><span class="pln">
    </span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
        tag</span><span class="pun">:</span><span class="pln"> </span><span class="str">'span'</span><span class="pun">,</span><span class="pln">
        name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'im'</span><span class="pun">,</span><span class="pln">
        label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
        style</span><span class="pun">:</span><span class="pln"> </span><span class="str">'font-style:italic;font-weight:bold'</span><span class="pln">
    </span><span class="pun">},</span><span class="pln"> </span><span class="pun">{</span><span class="pln">
        tag</span><span class="pun">:</span><span class="pln"> </span><span class="str">'span'</span><span class="pun">,</span><span class="pln">
        name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'hi'</span><span class="pun">,</span><span class="pln">
        label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln">
        style</span><span class="pun">:</span><span class="pln"> </span><span class="str">'font-style:italic;font-weight:bold;color:rgb(51, 153, 204)'</span><span class="pln">
    </span><span class="pun">}</span><span class="pln">
</span><span class="pun">]</span></pre><p></p></li><li><p><strong>enableContextMenu</strong> {Boolean} [默认值：true] //打开右键菜单功能</p></li><li><p><strong>contextMenu</strong> {Object} //右键菜单的内容，可以参考plugins/contextmenu.js里边的默认菜单的例子，label留空支持国际化，否则以此配置为准
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="com">//默认值：</span><span class="pln">
</span><span class="pun">[{</span><span class="pln">
    label</span><span class="pun">:</span><span class="pln"> </span><span class="str">''</span><span class="pun">,</span><span class="pln"> </span><span class="com">//显示的名称</span><span class="pln">
    cmdName</span><span class="pun">:</span><span class="pln"> </span><span class="str">'selectall'</span><span class="pun">,</span><span class="pln"> </span><span class="com">//执行的command命令，当点击这个右键菜单时</span><span class="pln">
    exec</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span><span class="pln"> </span><span class="com">//exec可选，有了exec就会在点击时执行这个function，优先级高于cmdName</span><span class="pln">
        </span><span class="com">//this是当前编辑器的实例</span><span class="pln">
        </span><span class="com">//this.ui._dialogs['inserttableDialog'].open();</span><span class="pln">
    </span><span class="pun">}</span><span class="pln">
</span><span class="pun">}]</span></pre><p></p></li><li><p><strong>shortcutMenu</strong> {Array} //快捷菜单
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="com">//默认值</span><span class="pln">
</span><span class="pun">[</span><span class="str">"fontfamily"</span><span class="pun">,</span><span class="pln"> </span><span class="str">"fontsize"</span><span class="pun">,</span><span class="pln"> </span><span class="str">"bold"</span><span class="pun">,</span><span class="pln"> </span><span class="str">"italic"</span><span class="pun">,</span><span class="pln"> </span><span class="str">"underline"</span><span class="pun">,</span><span class="pln"> </span><span class="str">"forecolor"</span><span class="pun">,</span><span class="pln"> </span><span class="str">"backcolor"</span><span class="pun">,</span><span class="pln"> </span><span class="str">"insertorderedlist"</span><span class="pun">,</span><span class="pln"> </span><span class="str">"insertunorderedlist"</span><span class="pun">]</span></pre><p></p></li><li><p><strong>elementPathEnabled</strong> {Boolean} [默认值：true] //是否启用元素路径，默认是显示</p></li><li><p><strong>wordCount</strong> {Boolean} [默认值：true] //是否开启字数统计</p></li><li><strong>maximumWords</strong> {Number} [默认值：10000] //允许的最大字符数</li><li><strong>wordCountMsg</strong> {String} [默认值：] //当前已输入 {#count} 个字符，您还可以输入{#leave} 个字符，字数统计提示，{#count}代表当前字数，{#leave}代表还可以输入多少字符数，留空支持多语言自动切换，否则按此配置显示
<pre class="prettyprint lang-javascrit prettyprinted"><span class="pln">\\</span><span class="pun">默认值：</span><span class="pln">
</span><span class="str">'当前已输入{#count}个字符, 您还可以输入{#leave}个字符。 '</span></pre></li><li><p><strong>wordOverFlowMsg</strong> {String} [默认值：] //超出字数限制提示  留空支持多语言自动切换，否则按此配置显示
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="pln">\\</span><span class="pun">默认值：</span><span class="pln">
</span><span class="str">'&lt;span style="color:red;"&gt;你输入的字符个数已经超出最大允许值，服务器可能会拒绝保存！&lt;/span&gt;'</span></pre><p></p></li><li><p><strong>tabSize</strong> {Number} [默认值：4] //点击tab键时移动的距离，tabSize倍数，tabNode什么字符做为单位</p></li><li><p><strong>tabNode</strong> {String} [默认值：'&amp;nbsp;']</p></li><li><p><strong>removeFormatTags</strong> //清除格式时可以删除的标签和属性
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="com">//默认值：</span><span class="pln">
</span><span class="str">'b,big,code,del,dfn,em,font,i,ins,kbd,q,samp,small,span,strike,strong,sub,sup,tt,u,var'</span></pre><p></p></li><li><p><strong>removeFormatAttributes</strong> [默认值：'class,style,lang,width,height,align,hspace,valign'</p></li><li><p><strong>maxUndoCount</strong> {Number} [默认值：20] //undo操作，可以最多回退的次数，默认20</p></li><li><p><strong>maxInputCount</strong> {Number} [默认值：1] //undo操作，当输入的字符数超过该值时，保存一次现场</p></li><li><p><strong>autoHeightEnabled</strong> {Boolean} [默认值：true] //是否自动长高，默认true</p></li><li><p><strong>scaleEnabled</strong> {Boolean} [默认值：false] //是否可以拉伸长高，默认true(当开启时，自动长高失效)</p></li><li><strong>minFrameWidth</strong> {Number} [默认值：800] //编辑器拖动时最小宽度，默认800</li><li><p><strong>minFrameHeight</strong> {Number} [默认值：220] //编辑器拖动时最小高度，默认220</p></li><li><p><strong>autoFloatEnabled</strong> [默认值：true] //是否保持toolbar的位置不动，默认true</p></li><li><p><strong>topOffset</strong> [默认值：30] //浮动时工具栏距离浏览器顶部的高度，用于某些具有固定头部的页面</p></li><li><p><strong>toolbarTopOffset</strong> [默认值：400] //编辑器底部距离工具栏高度(如果参数大于等于编辑器高度，则设置无效)</p></li><li><p><strong>pageBreakTag</strong> [默认值：'<em>ueditor</em>page<em>break</em>tag<em>'] //分页标识符，默认是</em>ueditor<em>page</em>break<em>tag</em></p></li><li><p><strong>autotypeset</strong> {Object} //自动排版参数 默认值：
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="pun">{</span><span class="pln">
    mergeEmptyline</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">true</span><span class="pun">,</span><span class="pln"> </span><span class="com">//合并空行</span><span class="pln">
    removeClass</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">true</span><span class="pun">,</span><span class="pln"> </span><span class="com">//去掉冗余的class</span><span class="pln">
    removeEmptyline</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">false</span><span class="pun">,</span><span class="pln"> </span><span class="com">//去掉空行</span><span class="pln">
    textAlign</span><span class="pun">:</span><span class="pln"> </span><span class="str">"left"</span><span class="pun">,</span><span class="pln"> </span><span class="com">//段落的排版方式，可以是 left，right，center，justify 去掉这个属性表示不执行排版</span><span class="pln">
    imageBlockLine</span><span class="pun">:</span><span class="pln"> </span><span class="str">'center'</span><span class="pun">,</span><span class="pln"> </span><span class="com">//图片的浮动方式，独占一行剧中，左右浮动，默认: center，left，right，none 去掉这个属性表示不执行排版</span><span class="pln">
    pasteFilter</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">false</span><span class="pun">,</span><span class="pln"> </span><span class="com">//根据规则过滤没事粘贴进来的内容</span><span class="pln">
    clearFontSize</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">false</span><span class="pun">,</span><span class="pln"> </span><span class="com">//去掉所有的内嵌字号，使用编辑器默认的字号</span><span class="pln">
    clearFontFamily</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">false</span><span class="pun">,</span><span class="pln"> </span><span class="com">//去掉所有的内嵌字体，使用编辑器默认的字体</span><span class="pln">
    removeEmptyNode</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">false</span><span class="pun">,</span><span class="pln"> </span><span class="com">// 去掉空节点</span><span class="pln">
    </span><span class="com">//可以去掉的标签</span><span class="pln">
    removeTagNames</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{标签名字:</span><span class="pln"> </span><span class="lit">1</span><span class="pln">
    </span><span class="pun">},</span><span class="pln">
    indent</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">false</span><span class="pun">,</span><span class="pln"> </span><span class="com">// 行首缩进</span><span class="pln">
    indentValue</span><span class="pun">:</span><span class="pln"> </span><span class="str">'2em'</span><span class="pun">,</span><span class="pln"> </span><span class="com">//行首缩进的大小</span><span class="pln">
    bdc2sb</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">false</span><span class="pun">,</span><span class="pln">
    tobdc</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">false</span><span class="pln">
</span><span class="pun">}</span></pre><p></p></li><li><p><strong>tableDragable</strong> {Boolean} [默认值：true] //表格是否可以拖拽</p></li><li><p><strong>disabledTableInTable</strong> {Boolean} [默认值：true]  //禁止表格嵌套</p></li><li><p><strong>sourceEditor</strong> {String} [默认值："codemirror"] //源码的查看方式，codemirror是代码高亮，textarea是文本框，默认是codemirror，注意默认codemirror只能在ie8+和非ie中使用</p></li><li><p><strong>codeMirrorJsUrl</strong> {Path String} [默认值：URL + "third-party/codemirror/codemirror.js"] //如果sourceEditor是codemirror需要配置这项，codeMirror js加载的路径</p></li><li><p><strong>codeMirrorCssUrl</strong> {Path String} [默认值：URL + "third-party/codemirror/codemirror.css"] //如果sourceEditor是codemirror需要配置这项，codeMirror css加载的路径</p></li><li><p><strong>sourceEditorFirst</strong> {String} [默认值：false] //编辑器初始化完成后是否进入源码模式，默认为否。</p></li><li><p><strong>iframeUrlMap</strong> {Object} //dialog内容的路径 ～会被替换成URL，垓属性一旦打开，将覆盖所有的dialog的默认路径
</p><pre class="prettyprint lang-javascript prettyprinted"><span class="com">//默认值：</span><span class="pln">
</span><span class="pun">{</span><span class="pln">
    </span><span class="str">'anchor'</span><span class="pun">:</span><span class="pln"> </span><span class="str">'~/dialogs/anchor/anchor.html'</span><span class="pun">,</span><span class="pln">
</span><span class="pun">}</span></pre><p></p></li><li><p><strong>webAppKey</strong> {String} //webAppKey 百度应用的APIkey，每个站长必须首先去百度官网注册一个key后方能正常使用app功能，注册介绍，http://app.baidu.com/static/cms/getapikey.html</p></li><li><strong>allowDivTransToP</strong> {Boolean} 默认会将外部进入的html数据中的Div标签转换成P标签，外部进入的数据包括粘贴和调用setContent接口进入编辑器的数据。如果设置成false将不在做这个转换。</li></ul><div class="pagebar"><a class="previous mardwodnlink" href="#start-toolbar">上一篇: 1.2 定制工具栏图标</a><a class="next mardwodnlink" href="#start-dir">下一篇: 1.4 目录介绍</a><span class="clearfloat"></span></div></div>
        </div>
</div>

<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor',{});


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>