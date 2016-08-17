/**
 * Created by Administrator on 2016/8/8 0008.
 */
define([
    'jquery'
    , 'domReady'
    , 'bootstrap'
    , 'dataTables.bootstrap'
    , 'adminlte/js/adminlte'
    , 'adminlte/js/layout'
    ],function($,domReady,bs,dataTables){
    $('#example2').DataTable({
        "language": {
            "url": "/public/asset/lib/plugins/datatables/Chinese.json"
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
})