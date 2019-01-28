import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageDecoder;
import com.wangsong.Application;
import net.coobird.thumbnailator.Thumbnails;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class Test {



    @org.junit.Test
    public void test2() throws Exception {
        Thumbnails.of("D:/test/zxing.png")
            .scale(0.8) // 图片压缩80%质量
            .toFile("D:/test/2016010208_new.jpg");
    }


    @org.junit.Test
    public void test3() throws Exception {
       // String s=",，.。!！？?sad撒付付付付eee,112131非法非法,付付sdfsdf第三发沙发沙发舒服,sss1111的点点滴滴1,2312344";
        String s="撒";
        System.out.println(s.getBytes().length);

        //数字6
        //字母7
        //字母标点6

        //中文15-16
        //中文标点16
        String zhongwen2=   ".a1 ";
        String zhongwen ="。阿萨德";
    }

    @org.junit.Test
    public void testEncode() throws WriterException, IOException, JSONException {
        String filePath = "D://test/";
        String fileName = "zxing.png";
        JSONObject json = new JSONObject();
        json.put("zxing", "https://github.com/zxing/zxing/tree/zxing-3.0.0/javase/src/main/java/com/google/zxing");
        json.put("author", "shihy");
        String content = json.toString();// 内容
        int width = 200; // 图像宽度
        int height = 200; // 图像高度
        String format = "png";// 图像类型
        Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");

        BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, width, height, hints);// 生成矩阵
        Path path = FileSystems.getDefault().getPath(filePath, fileName);
        Integer onColor = 0xFF000000;  //前景色
        Integer offColor = 0x00FFFFFF; //背景色
        MatrixToImageConfig config = new MatrixToImageConfig(onColor, offColor);
        MatrixToImageWriter.writeToPath(bitMatrix, format, path,config);// 输出图像
        System.out.println("输出成功.");
    }

    public static final String TYPE_JPG = "jpg";
    public static final String TYPE_GIF = "gif";
    public static final String TYPE_PNG = "png";
    public static final String TYPE_BMP = "bmp";
    public static final String TYPE_UNKNOWN = "unknown";

    /**
     * byte数组转换成16进制字符串
     * @param src
     * @return
     */
    public static String bytesToHexString(byte[] src){
        StringBuilder stringBuilder = new StringBuilder();
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }


    /**
     * 根据文件流判断图片类型
     * @param fis
     * @return jpg/png/gif/bmp
     */
    public static String getPicType(String urlString ) throws IOException {
        URL url = new URL(urlString);
        InputStream input = url.openStream();
        //读取文件的前几个字节来判断图片格式
        byte[] b = new byte[4];
        try {
            input.read(b, 0, b.length);
            String type = bytesToHexString(b).toUpperCase();
            if (type.contains("FFD8FF")) {
                return TYPE_JPG;
            } else if (type.contains("89504E47")) {
                return TYPE_PNG;
            } else if (type.contains("47494638")) {
                return TYPE_GIF;
            } else if (type.contains("424D")) {
                return TYPE_BMP;
            }else{
                return TYPE_UNKNOWN;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            if(input != null){
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    /**
     * 读取 图片URL地址 转成 BufferedImage(主要的作用就是将图片加载到内存对图片进行操作)
     *
     * @param image
     * @return
     * @throws Exception
     */
    private BufferedImage String2BufferedImage(String image) throws Exception {
        BufferedImage img;
        if (image.contains(".jpg") || image.contains(".jpeg")) {
            //
            URL url = new URL(image);
            URLConnection urlConn = url.openConnection();
            InputStream input = urlConn.getInputStream();

            JPEGImageDecoder decoder = JPEGCodec.createJPEGDecoder(input);
            img = decoder.decodeAsBufferedImage();
        } else {

            img = ImageIO.read(new URL(image));
        }
        return img;
    }

    private BufferedImage String2BufferedImage2(String image) throws Exception {
        BufferedImage img;

        FileInputStream fis = new FileInputStream(image);



        JPEGImageDecoder decoder = JPEGCodec.createJPEGDecoder(fis);
            img = decoder.decodeAsBufferedImage();

        return img;
    }
    @org.junit.Test
    public void test17() throws IOException {
        //test code
        System.out.println("图片格式1： " + getPicType("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2771044129,1424843848&fm=26&gp=0.jpg"));
        System.out.println("图片格式2： " + getPicType("https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/JPEG_example_subimage.svg/1024px-JPEG_example_subimage.svg.png"));
        System.out.println("图片格式3： " + getPicType("https://thecodeway.com/blog/wp-content/uploads/2014/08/jpeg_21.gif"));
        System.out.println("图片格式4： " + getPicType("http://39.105.159.23:8080/uploads/pic/20181204/1543913632075.bmp"));

    }

    @org.junit.Test
    public void test18(){
        try {
            //String2BufferedImage("");
            String2BufferedImage2("d://test/dc2aa3d7-47aa-4be3-8f7b-98c9f9615021.jpg");
            //String2BufferedImage2("d://test/2016010208_new.jpg");
            String2BufferedImage2("d://test/jpeg_21.gif.JPG");


        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
