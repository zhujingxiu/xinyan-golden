
define(function(require,exports,modules){
    require('datatables');
    require('datatables.bs');

    $('#list').DataTable({
        "language": {
            "url": "/public/lib/datatables/Chinese.json"
        },
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": false
    });

    $('#btn-new').bind('click',function(){
        exports.render_detail(false);
    })

    $('.btn-detail').bind('click',function(){

        exports.render_detail($(this).parent().parent().data('entry'));
    })

    exports.render_detail = function(aid){
        require('layer');
        require('ajaxSubmit');

        require('ueditor/ueditor.config');
        require('ueditor');
        require('jqueryvalidate');

        $.get('/article/article/form', {article_id:aid}, function(json){
            layer.open({
                type: 1,
                title:json.title,
                area:'800px',
                offset: '100px',
                zIndex:99,
                btn: ['保存', '取消'],
                content: json.html ,//注意，如果str是object，那么需要字符拼接。
                yes: function(index, layero){
                    $('#form-article').submit();
                }
            });
        },'json');
    }
})