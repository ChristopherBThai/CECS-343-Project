<?php //common.php
    function error($msg){?>
        <html>
            <head>
                <script language="JavaScript">
                    <!--
                        alert("<?=$msg?>");
                        history.back();
                    //-->
                </script>
            </head>
            <body></body>
        </html>
    <?php }

    function msg($msg){?>
        <html>
            <head>
                <script language="JavaScript">
                    <!--
                        console.log("<?=$msg?>");
                    //-->
                </script>
            </head>
            <body></body>
        </html>
    <?php }

