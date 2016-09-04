/**
 * Created by Administrator on 2016/9/2.
 */
/**
 * Created by Jason Chu on 2016/8/16.
 */
window.UEDITOR_HOME_URL = "/public/lib/ueditor/";
define(function(require,exports,module){

    require('jqueryvalidate');
    require('ajaxSubmit');
    require('layer');
    require('ueditor/ueditor.config');
    require('ueditor');
    $('.setting-system-form .form-control').bind('change', function () {
        exports.setting_save($(this).attr('name'),$(this).val(),$(this));
    });
    $('.setting-system-form .input-group input[type="checkbox"]').bind('click', function () {
        var _name = $(this).attr('name');
        var _value = [];
        $('input[name="'+_name+'"]').each(function() {
            if ($(this).is(':checked') == true) {
                _value.push($(this).val());
            }
        });
        exports.setting_save(_name,_value.join(),$(this).parent());
    })
    exports.setting_save = function (code,value,el) {

        $.post('/setting/system/save',{code:code,value:value}, function (json) {
            if(json.code==1){
                layer.tips('参数已保存', el,{tips: [1, '#00CC99']});
            }
        },'json')
    }
});