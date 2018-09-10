package com.idea.modules.onlineRep.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.codehaus.xfire.client.Client;

public class OnlineUtils {

	/**
	 * 接口项目地址
	 */
	public final static String INTERFACEURL="http://221.226.86.27:8090/xzsp-interface/a/rpc/";
	/**
	 * 网上申办事项地址
	 */
	public final static String ONLINE_MATTER_URL="trans/trans/showPageList";
	/**
	 * 通过编号得到单条数据
	 */
	public final static String ONLINE_TRANS_URL="trans/trans/findOne";
	/**
	 * 事项对应材料接口
	 */
	public final static String ONLIEN_MATERIAL_URL="material/material/findMaterialList";
	/**
	 * 附件上传
	 */
	public final static String ONLINE_MATERIALFILE_URL="userMaterial/userMaterial/save";
	/**
	 * 通过身份证查询附件
	 */
	public final static String ONLINE_APPLICATION_URL="application/application/";
	/**
	 * 通过身份证校验
	 */
	public final static String ONLINE_MATERIAL_URL="userMaterial/userMaterial/";
	/**
	 * 实名认证
	 */
	public final static String ONLINE_RAPPLYPERSON_URL="rapplyPerson/applyPerson/";
	/**
	 * 通过附件名称
	 */
	public final static String ONLINE_APPLICATION_ACTIONNAME="findListByapplicantDocumentNumber";
	/**
	 * 通过身份证查询办件材料
	 */
	public final static String ONLINE_APPLICATION_MATERIAL_ACTIONNAME="findMaterialsByUseridList";
	/**
	 * 实名认证方法
	 */
	public final static String ONLINE_REPPLYPERSON_ACTIONNAME="findByNumberandtype";
	
	/**
	 * 登录验证码
	 */
	public  static final String VALIDATE_CODE = "ImgValidateCode";
	private static int w = 90;
	private static int h = 40;
	
	
	/**
	 * 创建登录验证码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public static void createImage(HttpServletRequest request, HttpServletResponse response) throws IOException{
		    response.setHeader("Pragma", "no-cache");
		    response.setHeader("Cache-Control", "no-cache");
		    response.setDateHeader("Expires", 0L);
		    response.setContentType("image/jpeg");
		    
		    String width = request.getParameter("width");
		    String height = request.getParameter("height");
		    if ((StringUtils.isNumeric(width)) && (StringUtils.isNumeric(height)))
		    {
		      w = NumberUtils.toInt(width);
		      h = NumberUtils.toInt(height);
		    }
		    BufferedImage image = new BufferedImage(w, h, 1);
		    Graphics g = image.getGraphics();
		    createBackground(g);
		    String s = createCharacter(g);
		    request.getSession().setAttribute("ImgValidateCode", s);
		    
		    g.dispose();
		    OutputStream out = response.getOutputStream();
		    ImageIO.write(image, "JPEG", out);
		    out.close();
		  }
	    /**
	     * 创建背景颜色
	     * @param g
	     */
		private static void createBackground(Graphics g){
		    g.setColor(getRandColor(220, 250));
		    g.fillRect(0, 0, w, h);
		    for (int i = 0; i < 8; i++)
		    {
		      g.setColor(getRandColor(40, 150));
		      Random random = new Random();
		      int x = random.nextInt(w);
		      int y = random.nextInt(h);
		      int x1 = random.nextInt(w);
		      int y1 = random.nextInt(h);
		      g.drawLine(x, y, x1, y1);
		    }
		  }
	 /**
	  * 获取不同的颜色
	  * @param fc
	  * @param bc
	  * @return
	  */
	 private static Color getRandColor(int fc, int bc){
	    int f = fc;
	    int b = bc;
	    Random random = new Random();
	    if (f > 255) {
	      f = 255;
	    }
	    if (b > 255) {
	      b = 255;
	    }
	    return new Color(f + random.nextInt(b - f), f + random.nextInt(b - f), f + random.nextInt(b - f));
	  }
	 /**
	  * 得到不同的字符
	  * @param g
	  * @return
	  */
	 private static String createCharacter(Graphics g){
	    char[] codeSeq = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 
	      'K', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 
	      'X', 'Y', 'Z', '2', '3', '4', '5', '6', '7', '8', '9' };
	    String[] fontTypes = { "Arial", "Arial Black", "AvantGarde Bk BT", "Calibri" };
	    Random random = new Random();
	    StringBuilder s = new StringBuilder();
	    for (int i = 0; i < 4; i++)
	    {
	      String r = String.valueOf(codeSeq[random.nextInt(codeSeq.length)]);
	      g.setColor(new Color(50 + random.nextInt(100), 50 + random.nextInt(100), 50 + random.nextInt(100)));
	      g.setFont(new Font(fontTypes[random.nextInt(fontTypes.length)], 1, 26));
	      g.drawString(r, 15 * i + 5, 19 + random.nextInt(8));
	      
	      s.append(r);
	    }
	    System.out.println(s);
	    return s.toString();
	  }
	 
	 /**
	  * 随机数
	  * @return
	  */
	 public static String getSixRandom(){
	    Random random = new Random();
	    String sixRandom = String.valueOf(random.nextInt(1000000));
	    int randLength = sixRandom.length();
	    if (randLength < 6) {
	      for (int i = 1; i <= 6 - randLength; i++) {
	        sixRandom = "0" + sixRandom;
	      }
	    }
	    return sixRandom;
	  }
	 
	 /**
	  * 
	  * @throws MalformedURLException
	  * @throws Exception
	  */
	public static String xfireClient(String phone,String num) throws MalformedURLException, Exception{
		 Client client = new Client(new URL("http://10.196.109.218:8080/XFire/services/ProjectService?wsdl"));
		 Object[] results = client.invoke("backAudit", new Object[] {phone,num});
         return String.valueOf(results[0]);
	}
}
