﻿package com.jeeplus.modules.home.pay.alipay;

public class AlipayConfig {
	

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2019121069826205";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCSOixr5dQwnpToJHg06I95T50VwWYRbkmoR8aV7Bqd6f4GDAbx7jR7YHCvSi8uPlIHLe9KCigJzaFgmNfC/fuqpgv2Xljz3DaPdA4cfzgM9I729lhhpJ9AFHJfw5hGsXLKx7PHl5yNXzkW+gHjZ3ev6xHpoARwek/3MKL1+6+tDFbJbsvHVxb2jc9+J7VIuVLi56PPGvKOlmo3yQd9kaGtva7uh5wuwQ592T9ythX3yJvS3Z0nAV3fNKKMsOA5ycGhLDfvV/sZPRu9ERAiXiLRBXPdk3j/XfH4Ni7VlFPGuCszWhSnqmFCVzvjv+WqbrIv98Zw4oMFIs2wApOI/FOPAgMBAAECggEAS4v4lUopRXE413K4FAWu0mr6aln/5LOJJILoq15PJhTVI8Sk9esufCuILFf0ZjzWXlUyEpuKsf3mCSUOG/TiR/j/pyp5ZIv6OEUqYTis+ayEDD2bzd6iVBX8PVOtYaCeAPwJ+u1ueW+f7CoAPb+gC2g0WfJNONtIYxpipxmAWrODcQfbs3XKv90haZw9YWAvEmZkwhzJUsVKwhEfOCBJAsaIKQoj/0VcPF49nqVHMrop24yaMVV6p87W3pogISBQQEYGbhDPVwToLZT01oEREzYUItCRISa6nsVWyGOLJhMPAI51V6IlIHZbYweOXECVd2Cu99MKR3c5DgSNRtlOQQKBgQDU5enr3PuNqDk+SxMzwHay7++HRXQwRIQV4YQTHa0TeRKLOdWaBL54uww12FsNRmXr9veeoTiVfQABRfJALUM/wJOYflIFyviejKa8uJOupszRW0mpDbp34qCRNWG4t5N+jDhivg8ABPuQfRGbTN19kj5VTswMcqQcS+Q5bIHqLwKBgQCv1NdhOY94PIKxfle0xkT3Gu6Pn7WobWQOrUtwhy6qQ2Z8+qNB0pjtURF6SCu8J70vVe7q+n6qJVxANyeEinwEh87Z0zaQNkZ9utRLW4gt5J+KsX4Qrmq4Tj7A4jkv419WfFd9l2FDFS8fZTy1rzlSQS3xc12tYFz7rH5CEpG0oQKBgF4HQX5jtlKFVur1W4DC42n6YK889KkQycmkNaH/vF5aXd9R5s5EhB9sdWMesHA3hHJoPEs6Z3RWpfbp/qlrlEUG9+kk+XMHhzD3a/j0CH3du55HlEvu/UlPtZ0Ml6Fuqtz8bzblPFjE2pqhMnKFy1lXiuJAkAx7YZIBzsWx79sPAoGAC4VAj2g8FD6yuXpzuK58+kvTcamfN2fjdGq6VKcm0ZUU8/9gDwIDbxkusfpkkzFvXdidjNvYzMEh6Ds05aRFN+7GCNOj8ZL8z2QcYMuggpFGOsoiXmlvKKBH0E+CO7cEGiCPgvUWNFUA/2ecsLLIaLFIl1ddvexga0UECMQ6s8ECgYEAmgHIjF/CmcNhZAqh56TExCftYdNqAsnYv7mbKvLaesLoLuNVlkzZY7FKf6TlGo9M0MJYGO4JTQJnj1HQ+9G5QCADI23ln4LWRHXIyOBQSuQz4djiz8w7s8G6IscH382evn3WYOGavylWpCv3FbEI5LqCkRAC+1vnncNoZ62xL1s=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnKr0qLA+w9DBq3OxmAdX7v1ZOwqlE+JFJKztYri2+wPbNyFC4hEa+VatvvxtKWYraqX8tsgmlwPYueiKOUKJhyKNQRe5tpl27OeRD8nbTWlJKzii1gnZG2QQ3OZXIUWMSOPANwwJu3v3eHuHxr3SGZs1Yedh35SAJN6F4e/wVPpfPUPLFHLd4Nz8KF59KB7dNeq2NM6kYOxUDOMxi7WnyIWW8kutQVTGvwKhX8fUNLsylHusfYGv9j2kTynsKlznG8iZmgN2GxXqTlnd4W20WR95LDB20KVgeiVlNUC4lSKg4v+4Y351yBRfGyFn9i9ukIRd43IThyp9IZZ5ziMpGQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "https://www.wzsrlzy.cn/rlzy/pay/aliNotify";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "https://www.wzsrlzy.cn/rlzy/pay/paysuccess";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";
    
}

