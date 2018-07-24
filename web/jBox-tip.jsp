<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>tip方法</title>
    <script type="text/javascript" src="static/jquery-jbox/2.3/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="static/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
    <script type="text/javascript" src="static/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js"></script>

    <link rel="stylesheet" href="static/jquery-jbox/2.3/Skins/ShareGreen/jbox.css">
    <script>
        $(document).ready(function () {
            $("#showFocusId").click(function () {
                jBox.tip('请输入用户名','info',{
                    focusId:'username1'
                });
            });
            $("#showClosed").click(function () {
                jBox.tip('请重置密码','info',{
                    closed:function () {
                        $("#password").select();
                    }
                });
            });
            $("#timeOutInfo").click(function () {
                $.jBox.tip('正在XX，你懂的','loading');
                window.setTimeout(function () {
                    $.jBox.tip('xx已经完成。','success');
                },2000);
            });
            $("#deleteData").click(function () {
                var submit=function (v,h,f) {
                    if(v=='ok'){
                        $.jBox.tip('正在删除数据...','loading');
                        window.setTimeout(function () {
                            jBox.tip('数据删除成功','info');
                        },2000);
                    }else if (v=='cancel'){
                        //alert(v);
                        jBox.tip('取消删除');
                    }
                    return true;//关闭
                }
                $.jBox.confirm('确定要删除数据吗?','询问',submit);

            });

        });
        function showTip() {
            $.jBox.tip('Hello,jBox');
        }

    </script>

</head>
<body>
<button type="button" onclick="showTip()">显示tip</button>
<br>
<button type="button" id="showFocusId">关闭后设为焦点</button>
<br>
<button type="button" id="showClosed">关闭后设为已经</button>
<br>
<button type="button" id="timeOutInfo">2秒后完成操作</button>

<button type="button" id="deleteData">删除数据</button>

<span>
    <label>用户名</label>
    <input type="text" id="username1" name="username1">
</span>
<span>
    <label>密码</label>
    <input type="password" id="password" name="password" value="1456">
</span>

</body>
</html>
