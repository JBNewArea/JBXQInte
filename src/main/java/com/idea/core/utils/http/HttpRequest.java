package com.idea.core.utils.http;

import java.io.BufferedReader;
import java.io.Closeable;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

import com.idea.core.utils.StringUtils;

/**
 * HTTP网络请求
 * 
 * @author 王存见但是
 *
 */
public class HttpRequest {

	/**
	 * 向指定URL发送GET方法的请求
	 * 
	 * @param url
	 *            发送请求的URL
	 * @param param
	 *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
	 * @return URL 所代表远程资源的响应结果
	 * @throws IOException
	 */
	 public static final String POST = "POST";
	 public static final String GET = "GET";
	public static String sendGet(String url, String param) throws IOException {
		String result = "";
		BufferedReader in = null;

		String urlNameString = url + "?" + param;
		URL realUrl = new URL(urlNameString);
		// 打开和URL之间的连接
		URLConnection connection = realUrl.openConnection();
		// 设置通用的请求属性
		connection.setRequestProperty("accept", "*/*");
		connection.setRequestProperty("connection", "Keep-Alive");
		connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
		// 建立实际的连接
		connection.connect();
		// 获取所有响应头字段
		Map<String, List<String>> map = connection.getHeaderFields();
		// 遍历所有的响应头字段
		for (String key : map.keySet()) {
			System.out.println(key + "--->" + map.get(key));
		}
		// 定义 BufferedReader输入流来读取URL的响应
		in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		String line;
		while ((line = in.readLine()) != null) {
			result += line;
		}
		// 输入流
		if (in != null) {
			in.close();
		}
		return result;
	}

	/**
	 * 向指定 URL 发送POST方法的请求
	 * 
	 * @param url
	 *            发送请求的 URL
	 * @param param
	 *            Map方式请求
	 * @return 所代表远程资源的响应结果
	 * @throws IOException
	 */
	public static String sendGet(String url, Map<String, String> param) throws IOException {
		String paramStr = "";
		if (null != param) {
			for (String key : param.keySet()) {
				if (!StringUtils.isEmpty(paramStr)) {
					paramStr += "&";
				}
				paramStr += key + "=" + param.get(key);
			}
		}
		return sendGet(url, paramStr);
	}

	/**
	 * 向指定 URL 发送POST方法的请求
	 * 
	 * @param url
	 *            发送请求的 URL
	 * @param param
	 *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
	 * @return 所代表远程资源的响应结果
	 * @throws IOException
	 */
	public static String sendPost(String path,String body) throws IOException {
		DataOutputStream out = null;
        BufferedReader reader = null;
        try {
            URL url = new URL(path);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setUseCaches(false);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestMethod(POST); 
            connection.setRequestProperty("Accept", "text/xml,text/javascript,text/html"); 
            connection.setRequestProperty("Connection", "keep-alive");
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8"); 
            connection.connect();
            if(body != null) {
                out = new DataOutputStream(connection.getOutputStream());
                out.write(body.getBytes("utf-8")); 
                out.flush();
                out.close();
            }
            reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            StringBuilder builder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                builder.append(line);
            }
           String reslut= builder.toString();
            connection.disconnect(); 
            return reslut;
        }
        catch (Exception e) {
        	e.printStackTrace();
            System.out.println("HTTP POST发生异常" + e.getLocalizedMessage());
        }
        finally {
        	close(out);
        	close(reader);
        }
        return null;
    }
	//关闭
    public static void close(Closeable closeable) {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        }
        catch (Exception e) {
        	e.printStackTrace();
            System.out.println("发生异常" + e.getMessage());
        }
    }
	/**
	 * 向指定 URL 发送POST方法的请求
	 * 
	 * @param url
	 *            发送请求的 URL
	 * @param param
	 *            Map方式请求
	 * @return 所代表远程资源的响应结果
	 * @throws IOException
	 */
	public static String sendPost(String url, Map<String, String> param) throws IOException {
		String paramStr = "";
		if (null != param) {
			for (String key : param.keySet()) {
				if (!StringUtils.isEmpty(paramStr)) {
					paramStr += "&";
				}
				paramStr += key + "=" + param.get(key);
			}
		}
		return sendPost(url, paramStr);
	}
}