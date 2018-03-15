/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.systemauto;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletContext;

/**
 *
 * @author sonnc
 */
public class Controller implements Runnable {

    private ServletContext context;

    public Controller(ServletContext context) {
        this.context = context;
    }

    @Override
    public void run() {
        Date date = new Date();
        date.getTime();
        System.err.println("Hệ thống truy vấn tự động - " + date);
        try {
            this.createFile();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Đã thực hiện truy vấn xong!");
    }

    /**
     * Phương thức này cho phép thực hiện các câu lệnh truy vấn 
     * Thực hiện lấy danh sách các email/ sms cần gửi
     * Gửi tự động
     * 
     */
    
    private void createFile() throws IOException {
//        System.out.println("Generate file sitemap.xml to: "
//                + context.getRealPath(""));
//        String path = context.getRealPath("sitemap.txt");
//        File file = new File("sitemap.txt");
        String FILENAME = "C:\\Users\\sonnc\\Documents\\NetBeansProjects\\QT5315\\build\\web\\newFileWrite.txt";

        BufferedWriter bw = null;
        FileWriter fw = null;

        try {

            String content = "Anh yeu em den nay chung co the\nNgon Luu tinh chua han da tan phai";

            fw = new FileWriter(FILENAME);
            bw = new BufferedWriter(fw);
            bw.write(content);

            System.out.println("Viet file xong!");

        } catch (IOException e) {

            e.printStackTrace();

        } finally {

            try {

                if (bw != null) {
                    bw.close();
                }

                if (fw != null) {
                    fw.close();
                }

            } catch (IOException ex) {

                ex.printStackTrace();

            }

        }

    }

}
