<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title?></title>
  
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <?php if(isset($includes['css']) AND count($includes['css']) > 0): ?>
    <?php foreach($includes['css'] as $file): ?>
    <link rel="stylesheet" href="<?php echo $file['file']; ?>">
    <?php endforeach; ?>
    <?php endif; ?>
    <link rel="stylesheet" href="<?php echo asset_url('adminlte/css/style.css')?>">
    <!--[if lt IE 9]>
    <script src="<?php echo asset_url('base/html5shiv.min.js')?>"></script>
    <script src="<?php echo asset_url('base/respond.min.js')?>"></script>
    <![endif]-->
    <script src="<?php echo asset_url('base/jquery.min.js')?>" type="text/javascript"></script>
    <script src="<?php echo asset_url('base/app.js')?>"></script>
    <script src="<?php echo asset_url('base/config.js')?>"></script>
    <script>
        var HTTP_SERVER = '<?php echo base_url();?>';
        seajs.use('layout',function(l){
            l.price();
            <?php if(!empty($error_permission)) : ?>
            l.render_message('<?php echo $error_permission;?>','<?php echo lang("error_permission");?>');
            <?php endif?>

        });
    </script>

    <link rel="icon" href="/favicon.ico">
</head>
<body class="hold-transition skin-blue-light fixed sidebar-mini">
    <div class="wrapper">
        <header class="main-header">
            <!-- Logo -->
            <a href="<?php echo site_url('');?>" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini">信研黄金</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg">信研黄金</span>
            </a>
        <!-- Header Navbar: style can be found in header.less -->
            <?php echo $navbar ?>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <?php echo $sidebar ?>
        <!-- /.sidebar -->
        </aside>
		<div class="content-wrapper">
			<?php echo $content; ?>
		</div>

	    <footer class="main-footer">

	        <strong>Copyright &copy; 2016 <a href="https://www.gong-e.com">信研普惠金融</a>.</strong>
	    </footer>
	    <?php echo $controlbar; ?>
	</div>
<!-- ./wrapper -->

</body>
</html>