define(function(require,exports,module){
	$('.fetch_apiurl').bind('click',function(){
        $('input[name="golden_price[apiurl]"]').val($(this).find('td').text());
    });

	require('ajaxSubmit');
    $('.btn-form-save').bind('click',function(){
    	$('.do-result').empty();
    	var form = $('#'+$(this).attr('form'));
    	form.ajaxSubmit({
    		dataType:'json',
    		success:function(json){
    			if(json.code==1){
    				$('.do-result').html('<div class="alert alert-success">设置参数已保存！</div>').fadeOut(2000);
    			}
    		}
    	})
    });
});