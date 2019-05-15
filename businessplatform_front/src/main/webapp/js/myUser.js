//保存修改用户信息
function modifyUserInfo() {
    var address = $("#address").val();
    $.ajax({
        type : "post",
        url : "/businessPlatform/data/user/modifyUserInfo",
        dataType : "json",
        data : {
            "address" : address
        },
        success : function (result) {
            if (result.code == 1000) {
                jAlert("修改成功", "成功", function () {
                    document.location.reload();
                });
            } else if (result.code == 0) {
                jAlert("修改失败", "失败");
            } else {
                jAlert("修改失败，原因是：" + result.message, "失败");
            }
        },
        error : function () {
            jAlert("请求失败", "失败");
        }
    });
}

//修改密码
function modifyPassword() {
    var newPWD = $("#newPWD").val();
    var surePWD = $("#surePWD").val();
    if (newPWD != surePWD) {
        jAlert("两次输入的密码不一致", "失败");
        return;
    }
    var confirmStr = "您确定要修改密码吗？";
    if (!confirm(confirmStr)) {
        return;
    }
    $.ajax({
        type : "post",
        url : "/businessPlatform/data/user/modifyUserInfo",
        dataType : "json",
        data : {
            "password" : newPWD
        },
        success : function (result) {
            if (result.code == 1000) {
                jAlert("修改成功", "成功", function () {
                    document.location.reload();
                });
            } else if (result.code == 0) {
                jAlert("修改失败", "失败");
            } else {
                jAlert("修改失败，原因是：" + result.message, "失败");
            }
        },
        error : function () {
            jAlert("请求失败", "失败");
        }
    });
    
}