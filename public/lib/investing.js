/**
 * Created by Administrator on 2016/8/8 0008.
 */
window.UEDITOR_HOME_URL = "/public/lib/ueditor/";
define(function(require,exports,modules){
    require('datatables')
    require('datatables.bs')
    $('#example2').DataTable({
        "language": {
            "url": "/public/lib/datatables/Chinese.json"
        },
        "processing": true,
        "serverSide": true,
        "ajax": {
            url:'/project/investing/all',
            type:'post'
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

    exports.render_detail = function(pid){
        require('layer');
        require('ajaxSubmit');

        require('ueditor/ueditor.config');
        require('ueditor');
        require('jqueryvalidate');
        require('customValidate');

        $.get('/project/investing/apply', {project:pid}, function(json){
            layer.open({
                type: 1,
                title:json.title,
                area:'800px',
                offset: '100px',
                zIndex:99,
                btn: ['保存', '取消'],
                content: json.html ,
                yes: function(index, layero){
                    $('#form-investing').submit();
                }
            });
        },'json');
    }
})