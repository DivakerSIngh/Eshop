
var common = {
    

    httpPost: function (url, data, async,s,f) {
        
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            async: async,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (n) {
                
                s(n.d)
            },
            error: function (n) {
           f(n)
            }
        })
    },
    httpGet: function (url, async, s) {
    $.ajax({
        type: "POST",
        url: url,
        async: async,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (n) {
            s(n.d)
           
        },
        error: function (n, t, i) {

        }
    })
}
}