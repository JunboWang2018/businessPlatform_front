function deleteAllOrder() {
    if (!confirm("您要取消所有订单吗？")) {
       return;
    }
    $.ajax({
        type : "post",
        url : "/businessPlatform/data/order/deleteOrder",
        dataType : "json",
        success : function (result) {
            if (result.code == 1000) {
                jAlert("取消所有订单成功", "成功", function () {
                    document.location.reload();
                });
            }  else {
                jAlert("取消所有订单失败，原因是：" + result.message, "失败");
            }
        },
        error : function () {
            jAlert("请求失败", "失败");
        }
    });
}

function deleteOrder(orderNumber) {
    if (!confirm("您要取消该订单吗？")) {
        return;
    }
    $.ajax({
        type : "post",
        url : "/businessPlatform/data/order/deleteOrder",
        dataType : "json",
        data : {
            "orderNumber" : orderNumber
        },
        success : function (result) {
            if (result.code == 1000) {
                jAlert("取消该订单成功", "成功",function () {
                    document.location.reload();
                });
            }  else {
                jAlert("取消该订单失败，原因是：" + result.message, "失败");
            }
        },
        error : function () {
            jAlert("请求失败", "失败");
        }
    });
}

function prodInfoBuy(prodNumber) {
  var quantity = document.getElementById("number_" + prodNumber).value;
  var confirmStr = "您要购买的数量是 " + quantity + " 。是否确认下单？";
  if (!confirm(confirmStr)) {
    return;
  }
    $.ajax({
        type : "post",
        url : "/businessPlatform/data/order/prodInfoBuy",
        dataType : "json",
        data : {
            "prodNumber" : prodNumber,
            "quantity" : quantity
        },
        success : function (result) {
            if (result.code == 1000) {
                window.location.href = getRootPath() + "/view/order/toAddOrderSuccess";
            } else if (result.code == 0) {
                jAlert("下单失败", "失败");
            } else {
                jAlert("下单失败，原因是：" + result.message, "失败");
            }
        },
        error : function () {
            jAlert("请求失败", "失败");
        }
    });
}