/**
 * 通过jsonp调用自动绑定html select 标签
 */
jQuery.fn.txwebInitSelect = function(options) {
	var defaults = {
		'url' : '',
		'params' : {},
		'hasDefault': true,
		'defaultText':'--请选择--',
		'defaultValue':'',
		'selectedIndex':-1, // 默认不选中
		'callfunc':null ,// 加载完毕后回调函数，默认空, function(data, selectedValue)
		'valueName':null,
		'textName':null
	};
	var settings = $.extend(defaults, options);
	if(settings.url ==''){
		alert('请设置JSONP请求URL!');
		return this;
	}
	if(settings.valueName == null){
		alert('请设置option标签value对应的数据名称!');
		return this;
	}
	if(settings.textName == null){
		alert('请设置option标签text对应的数据名称');
		return this;
	}
	var select = this;
	jQuery.ajax({
		url:settings.url,
		data:$.param(settings.params),
		type:'get',
		dataType:'jsonp',
		success : function(data) {
			if (settings.hasDefault) {
				select.append('<option value="' + settings.defaultValue + '">'
						+ settings.defaultText + '</option>');
			}
			var selectedValue = null;
			if (data) {
				$.each(data, function(i, v) {
					if (i == settings.selectedIndex) {
						select.append('<option value="' + v[defaults.valueName]
								+ '" selected="selected">'
								+ v[defaults.textName] + '</option>');
						selectedValue = v[defaults.valueName];
					} else {
						select.append('<option value="' + v[defaults.valueName]
								+ '">' + v[defaults.textName] + '</option>');
					}

				});
			}
			if (null != settings.callfunc && typeof (settings.callfunc) == 'function') {
				settings.callfunc(data, selectedValue);
			}
		}
	});
};

/**
 * 返回json数组格式的表单数据
 * 已剔除没有值的参数名
 */
jQuery.fn.parseFormJsonData = function(options){
	var datas = this.serializeArray();
	var json = {};
	jQuery.each(datas, function(i, e){
		  if(e.value!=''){
			  json[e.name]=e.value;
		  }
	});
	return json;
};

var ArrayUtil = {};
/**
 * 提取array中的ID值，返回多个ID值的连接串
 * 可指定连接串字符：concatChar，默认: , 
 * 可指定ARRAY中的ID名称：idName, 默认: id
 */
ArrayUtil.getKeyConcatText=function(arr, concatChar, key){
	var vs = ArrayUtil.getValueArray(arr, key);
	return vs.join(concatChar || ',');
};

/**
 * 将array数组中的JSON名称为IDNAME的值转换为查询地址串文本，查询名称以queryName开头使用[n]标注多个值
 */
ArrayUtil.getQueryText = function(arr, queryName, idName) {
	var vs = ArrayUtil.getValueArray(arr, idName);
	var qt = [];
	var qn = queryName || 'id';
	for ( var k in vs) {
		qt.push( (qn+'[' + k + ']=')+encodeURIComponent(String(vs[k])));
	}
	return qt.join('&');
};

/**
 * 从一个数组中提取JSON属性为idName的值作为新数组返回
 */
ArrayUtil.getValueArray=function(arr, key){
	if(!jQuery.isArray(arr)){
		alert('不是数组对象');
		return [];
	}
	var idkey = key || 'id';
	var vs = [];
	for(var k in arr){
		var idval = arr[k][idkey];
		if(idval!=='undefined'){
			vs.push(idval);
		}
	}
	return vs;
};
