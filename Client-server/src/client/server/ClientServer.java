/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.server;

/**
 *
 * @author sonnc
 */
import java.io.*;
import java.net.*;

public class ClientServer {

    public static void main(String[] args) throws IOException {

        ServerSocket ss = null;
        Socket cs = null;
        PrintWriter out = null;
        BufferedReader in = null;

        try {
            ss = new ServerSocket(3333);
        } catch (IOException e) {
            System.out.println("Could not listen on port: 3333");
            System.exit(1);
        }

        try {
            cs = ss.accept();
        } catch (IOException e) {
            System.out.println("Accept failed: 3333");
            System.exit(1);
        }

        out = new PrintWriter(cs.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(cs.getInputStream()));

        String clientInput;

        while (true) {
            clientInput = in.readLine();
            if (clientInput == null) {
                break;
            }else if (clientInput.contains("hi") || clientInput.contains("xin chao")|| clientInput.contains("chao")) {
                out.println("Xin chao ban, toi co the giup gi?");
            }else if (clientInput.contains("old") || clientInput.contains("tuoi")) {
                out.println("Toi duoc sinh ra boi SonNC cach day 2 tuan tuoi thoi, hihi.");
            }else if (clientInput.contains("ten") || clientInput.contains("ban ten la")) {
                out.println("Toi ten la Sonng Jong Ky");
            }else{
                out.println("Toi dang ban, toi da ghi lai cau hoi cua ban: "+clientInput);
            }
            
        }
        out.close();
        in.close();
        ss.close();
        cs.close();
    }
}
