<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>open方法</title>
    <script type="text/javascript" src="static/jquery-jbox/2.3/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="static/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
    <script type="text/javascript" src="static/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js"></script>

    <link rel="stylesheet" href="static/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css">

    <script type="text/javascript">
        $(document).ready(function () {

        });
        function openWin() {
            $.jBox.open("iframe:https://www.baidu.com/index.php",
                    "百度一下",
                    800, 350,
                    {buttons: {'关闭': true}}
            );
        }

        function openMultiState() {
            var html1 = '<div class="msg-div">' +
                    '<p>购买数量：</p><div class="field"><input type="text" id="amount" name="amount" value="1" /></div>' +
                    '<p>收货地址：</p><div class="field"><textarea id="address" name="address"></textarea></div>' +
                    '<div class="errorBlock" style="display: none;"></div>' +
                    '</div>';

            var html2 = '<div class="msg-div">' +
                    '<p>给卖家留言：</p><div class="field"><textarea id="message" name="message"></textarea></div>' +
                    '</div>';

            var data = {};
            var states = {};
            states.state1 = {
                content: html1,
                buttons: {'下一步': 1, '取消': 0},
                submit: function (v, h, f) {
                    if (v == 0) {
                        return true;//close the window
                    } else {
                        debugger;
                        h.find('.errorBlock').hide(
                                'fast',
                                function () {
                                    $(this).remove();
                                }
                        );
                        data.amout = f.amount;//或 h.find("#amount").val()
                        if (data.amount == '' || parseInt(data.amount) < 1) {
                            $('<div class="errorBlock" style="display:none;">请输入购买数量！</div>')
                                    .prependTo(h).show('fast');
                            return false;
                        }
                        data.address = f.address;
                        if (data.address == '') {
                            $('<div class="errorBlcok" style="display: none;">请输入收货地址！</div>')
                                    .prependTo(h).show("fast");
                            return false;
                        }
                        $.jBox.nextState();//go forward
                        //或 $.jBox.goToState('state2');
                    }
                    return false;
                }
            };
            states.state2 = {
                content: html2,
                buttons: {'上一步': -1, '提交': 1, '取消': 0},
                buttonsFocus: 1, // focus on the second button
                submit: function (v, o, f) {
                    if (v == 0) {
                        return true; // close the window
                    } else if (v == -1) {
                        $.jBox.prevState() //go back
                        // 或 $.jBox.goToState('state1');
                    }
                    else {
                        data.message = f.message;

                        // do ajax request here
                        $.jBox.nextState('<div class="msg-div">正在提交...</div>');
                        // 或 $.jBox.goToState('state3', '<div class="msg-div">正在提交...</div>')

                        // asume that the ajax is done, than show the result
                        var msg = [];
                        msg.push('<div class="msg-div">');
                        msg.push('<p>下面是提交的数据</p>');
                        for (var p in data) {
                            msg.push('<p>' + p + ':' + data[p] + '</p>');
                        }
                        msg.push('</div>');
                        window.setTimeout(function () {
                            $.jBox.nextState(msg.join(''));
                        }, 2000);
                    }

                    return false;
                }
            };
            states.state3 = {
                content: '',
                buttons: {} // no buttons
            };
            states.state4 = {
                content: '',
                buttons: {'确定': 0}
            };
            jBox.open(states,'提交订单',450,'auto');
        }

    </script>

</head>
<body>
<button type="button" onclick="openWin();">点我试试</button>
<button type="button" onclick="openMultiState()">打开连续窗口</button>
</body>
</html>
