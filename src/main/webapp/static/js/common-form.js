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