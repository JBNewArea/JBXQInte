package com.idea.core.utils.http;

import java.io.BufferedReader;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.idea.core.utils.StringUtils;

/**
 * HTTP网络请求
 * 
 * @author 王存见哈哈
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
	
	 //带文件上传的表单提交
		public static String fileUpload(String urlStr, HttpServletRequest request,MultipartFile multipartFile) {
			  //获取文件名
			  String fileName = multipartFile.getOriginalFilename();
			  if(fileName.equals("blob")){
				  fileName = "在线表" + new Date().getTime() + ".png";
			  }
			  //将MultipartFile转化为File
			  CommonsMultipartFile cf= (CommonsMultipartFile)multipartFile; 
			  DiskFileItem fi = (DiskFileItem)cf.getFileItem(); 
			  File file = fi.getStoreLocation();
			  //手动创建临时文件  
			  if(!file.exists()){  
				  file = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") +   
	                    file.getName());  
		            try {
						multipartFile.transferTo(file);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}  
		        }  
			  //封装参数为map
			  @SuppressWarnings("unchecked")
			  Map<String,String[]> readOnlyMap = request.getParameterMap();
			  Map<String,String> map = new HashMap<String,String>();
			  Set<String> keySet = readOnlyMap.keySet();
			  Iterator<String> it =  keySet.iterator();
			  while (it.hasNext()) {  
				  String str = it.next();  
				  map.put(str, readOnlyMap.get(str)[0]);
			  } 
		  
			  String res = "";  
			  HttpURLConnection conn = null;  
			  String BOUNDARY = "---------------------------123821742118716"; // boundary就是request头和上传文件内容的分隔符  
			  try {  
				    URL url = new URL(urlStr);  
				    conn = (HttpURLConnection) url.openConnection();  
				    conn.setConnectTimeout(5000);  
				    conn.setReadTimeout(30000);  
				    conn.setDoOutput(true);  
				    conn.setDoInput(true);  
				    conn.setUseCaches(false);  
				    conn.setRequestMethod("POST");  
				    conn.setRequestProperty("Connection", "Keep-Alive");  
				    conn.setRequestProperty("User-Agent",  
				            "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)");  
				    conn.setRequestProperty("Content-Type",  
				            "multipart/form-data; boundary=" + BOUNDARY);  
				
				    OutputStream out = new DataOutputStream(conn.getOutputStream());  
				    // text  
				    if (map != null) {  
				        StringBuffer strBuf = new StringBuffer();  
				        Iterator<Entry<String, String>> iter = map.entrySet().iterator();  
				        while (iter.hasNext()) {  
				            @SuppressWarnings("rawtypes")
							Map.Entry entry = (Map.Entry) iter.next();  
				            String inputName = (String) entry.getKey();  
				            String inputValue = (String) entry.getValue();  
				            if (inputValue == null) {  
				                continue;  
				            }  
				            strBuf.append("\r\n").append("--").append(BOUNDARY)  
				                    .append("\r\n");  
				            strBuf.append("Content-Disposition: form-data; name=\""  
				                    + inputName + "\"\r\n\r\n");  
				            strBuf.append(inputValue);  
				        }  
				        out.write(strBuf.toString().getBytes());  
				    }  
				
				    // file
				    if(null != file){
				        String contentType = new MimetypesFileTypeMap().getContentType(file);  
				        if (fileName.endsWith(".png")) {  
				            contentType = "image/png";  
				        }  
				        if (contentType == null || contentType.equals("")) {  
				            contentType = "application/octet-stream";  
				        }
				        StringBuffer strBuf = new StringBuffer();  
				        strBuf.append("\r\n").append("--").append(BOUNDARY).append("\r\n");  
				        strBuf.append("Content-Disposition: form-data; name=\""  
				                    + "file\"; filename=\"" + fileName  
				                    + "\"\r\n");  
				        strBuf.append("Content-Type:" + contentType + "\r\n\r\n");  
				        out.write(strBuf.toString().getBytes());  
				        DataInputStream in = new DataInputStream(new FileInputStream(file));  
				        int bytes = 0;  
				        byte[] bufferOut = new byte[1024];  
				        while ((bytes = in.read(bufferOut)) != -1) {  
				             out.write(bufferOut, 0, bytes);  
				        }  
				        in.close(); 
				    }
				    byte[] endData = ("\r\n--" + BOUNDARY + "--\r\n").getBytes();  
				    out.write(endData);  
				    out.flush();  
				    out.close();  
				
				    // 数据返回  
				    StringBuffer strBuf = new StringBuffer();  
				    BufferedReader reader = new BufferedReader(new InputStreamReader(  
				            conn.getInputStream()));  
				    String line = null;  
				    while ((line = reader.readLine()) != null) {  
				        strBuf.append(line).append("\n");  
				    }  
				    res = strBuf.toString();  
				    reader.close();  
				    reader = null;  
			  } catch (Exception e) {  
				  	e.printStackTrace();  
			  } finally {  
				    if (conn != null) {  
				        conn.disconnect();  
				        conn = null;  
				    }  
			  }  
			  return res;  
		}
}