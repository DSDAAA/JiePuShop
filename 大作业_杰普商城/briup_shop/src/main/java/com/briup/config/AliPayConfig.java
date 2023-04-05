package com.briup.config;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;

public class AliPayConfig {
    /*
     * 服务网关  ---  沙箱环境
     */

    private static String serverURL = "https://openapi.alipaydev.com/gateway.do";

    /*
     * 应用id,
     */

    private static String APP_ID = "2021000119669314";

    /*
     * 用户私钥,可以替换成你们的自己的私钥
     *
     */

    private static String APP_PRIVATE_KEY = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCDetjLI9KxSWJrmii8W0yAFcHFmqxBQiyU41pUw4jPjd55wwps9oTXquRhEgwGgyBR93pii+cnp8YTBixvEY6gcDtd0hhe6iPhZ6cg4mT6MncKRBFl3CoNNk9qc9ok8DJ8udxu5FaFqMOAf9qUCd5T1EM1D3TVkEDz82jRycOiXKHw1O3Mo4cvmH9l+RHX48LUI2d2kkJnmYudKol2eWleVEFFmHJr+DhZGtKgAmqHmCNQywp/kqDHgEumFAey5qmg20OkvlBJRREwK4s22RMHe4CKD+JjC94xkhtgTXIwhoDm09hdLXpVYR/o8UreftfNZS0/tY7zsBjCj8ZOSGJDAgMBAAECggEAQR77ecIIfR7nzHvSaVifD2G3U/REFR59jlD9ULZ4cLTH2G8uHsILEfbmnt2dbyxLOc3lpCG/H/kNNib8oxaDGhv8i3+f6oL1upLoSHVZpkKQi1kjdNwTR+/6bbNr/JerqfM0pwgZgqIQEvlAfcpVgBfGIeXB7HVCdpG8/Qt+BlA3xGYdoPVtjWNazScUNVMwgi3ID4aHbr9MdKvppdNa4gAskX7QPtU08eIxxRtA9VFSax344uR+/t3ysFRkiWjZBWJVndCCxFvU7gY5RxGyePM6IzSrYW7zBudEQKEYk3re8Vj/YlGPSDh1yVDedIPzbyWl6IoCDGNaOBTMjCezwQKBgQDriYIb4kTpPhp22fXJ3EDcf8ZStoh/D9AyzQxXjDI832vuaSYH6R/AtvskVWwLyDpLmh8+LWwfplRgnohhZTc4rG61pqVz7HIrh+9dZtc3BL0hUJeq+A7q8bnCnARYyImK08QtV7wxQ7OwAsN3Ls7r4clY5zzO6dgX9wixRaeoCQKBgQCO5wpfiP4w5XdH631CxkvA97mW3oXwOTpaU9Je0tzTLUXGl5X0i7LdmUwqBbaYKF3weV+ExD5GjX6vErhgMWCORoNe5HbtjHBFw8goB4Fz8w02wz4ecrLYAphghytXY/xv9+6Bw4jOdxoBIBPVmYXGm6E3MfQ7/1Pls3clbiyS6wKBgA/swSY/eydF8qYcgHjAcoY2AWOwQbRNjmcQ5Ae7S94/wN1isJaSVXpDJOHFAMQfKonYBsq+aXQOW+AYd+IV5NDpH6caeE9JKkL1MuLexChNIrhw6YA+u0t5QnT89XJHRL1lKfti1i+Cg1CgLzUMriLWpjVjlQHsX5bnNeg+bGJ5AoGAVbTICehV2+mkEqRwKf5YLNHmo0+usRcBom8neuuouZcrhCIiM9sdWb65aXKnwrZjMPj6itxQJWxzkHj/z+GNcYdk/yKzGWHjbFQx1aA6ydn6EOAkf4p3LQrRbQNkwTMckeL3TyiBAqN4Gzir7K35B9cLZ9k0DE/kd52dVfuwDCUCgYAJ3HPhk6fWJ3cu1m3rpTfmoQVvo28q62f6DUDrfCRs3gTSkUOaJZ/9/EKwxs1ZXbuQiTbDNVCZ1XvBg93vJsOombsJ2AleqSUP/KKC1LMpZMzeYZg14mnI0z71UNWnXqaFyxqEoHJz94O9bQWls7h36/k86wcLIaUzBItHo+H8qQ==";
    /*
     * 发送数据的格式,  目前为json
     *
     */

    private static String format = "json";

    /*
     * 设置字符集的编码格式 utf-8
     */

    private static String CHARSET = "utf-8";

    /*
     * 支付宝公钥,  可以替换成你们自己的
     */

    private static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlP3Et/MG2VDK5MvZ3Etd0tktN8cjczWYmlObEHm939eEBRCJ0tHUHFtZaw13IX11xoRrwL6i1BqdP6n++jhCPUmmRccfm+aeCYVNL1R61CkG8h19dEAEd+4seno8ttfB2FeZJrTrCQcDL6KUbug27+o1gpo8E/hUrGCkFGYzmk+T7eR1PNtP9WolxEFzfDK6RABqS9mIrVSPYT3umw8fp/7sCAu27oniLV7izkjYHtdvuTPXn2H3np2Ol4m0E0oVyGeF2uLwAfYfHwJRRilQPeX0O5cxQvRV7dEVDcAWw5UWNaL1cZlcpSz0+PjTjiztVEZZ39GCoHRcqUs0Qn+hhQIDAQAB";
    /*
     * 支付宝签名  目前采用的是RSA2
     */

    private static String signType = "RSA2";
    /*
     * 页面跳转同步通知页面   http      ?12345464.外网可以访问的地址
     */



    public static AlipayClient getAlipayClient() {
        return new DefaultAlipayClient(serverURL,APP_ID,APP_PRIVATE_KEY,format,
                CHARSET,ALIPAY_PUBLIC_KEY,signType);
    }
}
