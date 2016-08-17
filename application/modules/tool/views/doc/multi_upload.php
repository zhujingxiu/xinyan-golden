<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/12 0012
 * Time: 10:55
 */
?>
<div class="col-sm-12">
<article class="markdown-body entry-content" itemprop="text"><h1><a id="user-content-codeigniter-multi-upload" class="anchor" href="#codeigniter-multi-upload" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>CodeIgniter Multi-Upload</h1>

    <p>Extends native CodeIgniter Upload library to support multiple file uploading. Multiple upload functionality will fallback to CodeIgniters native upload if non-multiple upload is detected.</p>

    <h2><a id="user-content-installation" class="anchor" href="#installation" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Installation</h2>

    <p>Simply copy the <strong>MY_Upload.php</strong> file to your applications library directory.</p>

    <h2><a id="user-content-configuration" class="anchor" href="#configuration" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Configuration</h2>

    <p>Multiple upload functionality will fallback to CodeIgniters default <strong>do_upload()</strong> method so configuration is backwards compatible between <strong>do_upload()</strong> and the new <strong>do_multi_upload()</strong> method provided by this extension. However, if supplying new names for multiple uploaded items, you must configure them as an array for the <strong>file_name</strong> configuration option. Names will be processed in the same order as the <strong>$_FILES</strong> array is read, meaning the first file uploaded will be renamed to the first name supplied in the <strong>file_name</strong> configuration array and so-on. If the uploaded file count exceeds the configured <strong>file_name</strong> configuration array, those exceeding files will default to their given upload name.</p>

<pre><code>//HTML
        &lt;form&gt;
            &lt;input type="file" name="files[]" multiple /&gt;
            &lt;input type="submit" name="submit" value="submit" /&gt;
        &lt;/form&gt;

        //PHP
        //Configure upload.
        $this-&gt;upload-&gt;initialize(array(
            "file_name"     =&gt; array("file_1.ext", "file_2.ext", "file_3.ext"),
            "upload_path"   =&gt; "/path/to/upload/to/"
        ));

        //Perform upload.
        if($this-&gt;upload-&gt;do_multi_upload("files")) {
            //Code to run upon successful upload.
        }
    </code></pre>

    <h2><a id="user-content-do_multi_uploadfield" class="anchor" href="#do_multi_uploadfield" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>do_multi_upload($field)</h2>

    <p>The <strong>do_multi_upload()</strong> method is referenced in the same way as CodeIgniters <strong>do_upload()</strong> method but expects <strong>$field</strong> to reference a multiple file <strong>$_FILES</strong> array. If multiple files are not detected, <strong>do_multi_upload</strong> will fallback to CodeIgniters <strong>do_upload()</strong> method.</p>

<pre><code>//Using multiple inputs.
        //HTML
        &lt;form&gt;
            &lt;input type="file" name="files[]" /&gt;
            &lt;input type="file" name="files[]" /&gt;
            &lt;input type="file" name="files[]" /&gt;
            &lt;input type="submit" name="submit" value="submit" /&gt;
        &lt;/form&gt;

        //PHP
        //Configure upload.
        $this-&gt;upload-&gt;initialize(array(
            "upload_path"   =&gt; "/path/to/upload/to/"
        ));

        //Perform upload.
        if($this-&gt;upload-&gt;do_multi_upload("files")) {
            //Code to run upon successful upload.
        }

        //Using HTML5 "multiple" attribute.
        //HTML
        &lt;form&gt;
            &lt;input type="file" name="files[]" multiple /&gt;
            &lt;input type="submit" name="submit" value="submit" /&gt;
        &lt;/form&gt;

        //PHP
        //Configure upload.
        $this-&gt;upload-&gt;initialize(array(
            "upload_path"   =&gt; "/path/to/upload/to/"
        ));

        //Perform upload.
        if($this-&gt;upload-&gt;do_multi_upload("files")) {
            //Code to run upon successful upload.
        }
    </code></pre>

    <h2><a id="user-content-get_multi_upload_data" class="anchor" href="#get_multi_upload_data" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>get_multi_upload_data()</h2>

    <p>The extended library also comes with a get_multi_upload_data() method that will return data about each uploaded file as a multi-dimensional array.</p>

<pre><code>        //Perform upload.
        if($this-&gt;upload-&gt;do_multi_upload("files")) {
            //Print data for all uploaded files.
            print_r($this-&gt;upload-&gt;get_multi_upload_data());
        }

        //Possible output given files "file_1.jpg", "file_2.jpg" and "file_3.jpg" without renaming.
        Array(
            [0] =&gt; Array(
                [file_name] =&gt; file_1.jpg
                [file_type] =&gt; image/jpeg
                [file_path] =&gt; /path/to/file/
                [full_path] =&gt; /path/to/file/file_1.jpg
                [raw_name] =&gt; file_1
                [orig_name] =&gt; file_1.jpg
                [client_name] =&gt; file_1.jpg
                [file_ext] =&gt; .jpg
                [file_size] =&gt; 2182.91
                [is_image] =&gt; 1
                [image_width] =&gt; 1024
                [image_height] =&gt; 768
                [image_type] =&gt; jpeg
                [image_size_str] =&gt; width="1024" height="768"
            )

            [1] =&gt; Array(
                [file_name] =&gt; file_2.jpg
                [file_type] =&gt; image/jpeg
                [file_path] =&gt; /path/to/file/
                [full_path] =&gt; /path/to/file/file_2.jpg
                [raw_name] =&gt; file_2
                [orig_name] =&gt; file_2.jpg
                [client_name] =&gt; file_2.jpg
                [file_ext] =&gt; .jpg
                [file_size] =&gt; 67.58
                [is_image] =&gt; 1
                [image_width] =&gt; 1024
                [image_height] =&gt; 768
                [image_type] =&gt; jpeg
                [image_size_str] =&gt; width="1024" height="768"
            )

            [2] =&gt; Array(
                [file_name] =&gt; file_3.jpg
                [file_type] =&gt; image/jpeg
                [file_path] =&gt; /path/to/file/
                [full_path] =&gt; /path/to/file/file_3.jpg
                [raw_name] =&gt; file_3
                [orig_name] =&gt; file_3.jpg
                [client_name] =&gt; file_3.jpg
                [file_ext] =&gt; .jpg
                [file_size] =&gt; 517.97
                [is_image] =&gt; 1
                [image_width] =&gt; 1024
                [image_height] =&gt; 768
                [image_type] =&gt; jpeg
                [image_size_str] =&gt; width="1024" height="768"
            )
        )
    </code></pre>
</article>
</div>