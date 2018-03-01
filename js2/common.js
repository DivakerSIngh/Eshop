
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
    httpGet: function (url, data, async) {
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        async: async,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (n) {
            
            return n.data;
        },
        error: function (n, t, i) {

        }
    })
}
}