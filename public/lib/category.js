define(function(require,exports,modules){
	require('jqueryvalidate');
    require('customValidate');
    require('ajaxSubmit');
    // Highlight selected row
    $(function () {
        $.validator.setDefaults({
            errorElement : 'span',
            errorClass : 'help-block',
            highlight : function(element) {
                $(element).closest('.form-group').addClass('has-error');
            },

            success : function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement : function(error, element) {
                element.parent('div').append(error);
            }
        });

        $("#form-category").validate({
            rules : {
                code : {
                    required : true,
                    minlength : 2,
                    remote:{
                        url:"/article/category/check_code",             //servlet
                        data:{
                            category_id: function () {
                                return $("input[name='category_id']").val();
                            },
                            code: function () {
                                return $("#form-code").val();
                            }
                        }
                    }
                },
                title : {
                    required : true,
                    minlength : 2
                },

            },
            messages : {
                code : {
                    required : '请输入文章分类标识',
                    minlength : '文章分类标识不得少于2个字符。',
                    remote  :"文章分类标识已经被注册"
                },
                title : {
                    required : '请输入文章分类名称',
                    minlength : '文章分类名称不得少于2个字符。'
                },
            },

            //提交
            submitHandler : function(form){
                
                $(form).ajaxSubmit({
                        dataType:'json',
                        success: function (json) {
                            if(json.code==1){
                                location.reload()
                            }
                        }
                    }
                );
            }
        });
    });

    $('tr.category-row').bind('dblclick', function () {
        exports.row_detail($(this).data('entry'));
    });

    $('#new-category').bind('click', function () {
        exports.row_detail(false);
    })

    exports.row_detail = function (category_id) {
        
        
        if(category_id > 0) {
            $.get('/article/category/get_info', {category_id: category_id}, function (json) {
                if (json.code == 1) {
                    var info = json.info;
                    
                    $('#form-category input[name="category_id"]').val(info.id);
                    $('#form-category input[name="code"]').val(info.code);
                    $('#form-category input[name="title"]').val(info.title);

                    $('#form-category input[name="status"][value="' + info.status + '"]').prop('checked', true);
                    $('#form-category .box-title').text('编辑类别 ' + info.title);
                }
            }, 'json');
        }else{
            $('#form-category input[type="text"],#form-category input[name="category_id"]').val('');
            $('#form-category input[name="status"][value="1"]').prop('checked', true);
            $('#form-category .box-title').text('添加类别');
        }
    }
})