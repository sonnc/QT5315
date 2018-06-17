/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.apachepoi;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.apache.xmlbeans.XmlException;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTRow;

/**
 *
 * @author sonnc
 */
public class TestRead {

    public static String STR_FIRST_FIELD = "#";
    public static String STR_LAST_FIELD = "#";
    public static String STR_MATCHER = "(?i).*#[a-zA-Z_0-9]+#.*";
    public static String STR_MATCHER_CHILD = "#[a-zA-Z_0-9]+#";

    /**
     * Lay file tu local
     *
     * @param path
     * @return document
     */
    public static XWPFDocument getFile(String path) {
        try {
            InputStream fis = new FileInputStream(path);
            XWPFDocument document = new XWPFDocument(fis);
            fis.close();
            return document;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    /**
     * Thay the cac ky tu dinh san trong file bang cac ky tu moi can thay the
     *
     * @param document
     * @param fieldsForReport
     * @param str_first_field
     * @param str_last_field
     * @param str_matcher
     * @param str_matcher_child
     * @return document
     */
    public static XWPFDocument replaceDocument(XWPFDocument document, Map<String, String> fieldsForReport, String str_first_field, String str_last_field,
            String str_matcher, String str_matcher_child) {
        if (document == null) {
            return null;
        }
        document = iterateThroughParagraphs(document, fieldsForReport, str_first_field, str_last_field,
                str_matcher, str_matcher_child);
        // Iterate Through table
        document = iterateThroughTables(document, fieldsForReport, str_first_field, str_last_field,
                str_matcher, str_matcher_child);
        return document;
    }

    /**
     * Lay doan van ban va duyet cac tu, xwr ly van ban.
     *
     * @param document
     * @param fieldsForReport
     * @param str_first_field
     * @param str_last_field
     * @param str_matcher
     * @param str_matcher_child
     * @return document
     */
    private static XWPFDocument iterateThroughParagraphs(XWPFDocument document, Map<String, String> fieldsForReport,
            String str_first_field, String str_last_field, String str_matcher, String str_matcher_child) {
        for (XWPFParagraph paragraph : document.getParagraphs()) {
            // Check Field Report
            if (paragraph.getText() != null && paragraph.getText().contains(str_first_field)) {
                // Iterate Through Runs in Paragraphs
                iterateThroughRuns(paragraph, fieldsForReport, str_first_field, str_last_field,
                        str_matcher, str_matcher_child);
            }
        }
        return document;
    }

    /**
     * Cai dat lai font chu cho cac tu can duoc thay the
     *
     * @param addBreak
     * @param bold
     * @param colorRGB
     * @param fontFamily
     * @param fontSize
     * @param run
     * @param text
     */
    private static void setRun(XWPFRun run, String fontFamily, int fontSize, String colorRGB, String text, boolean bold, boolean addBreak) {
        run.setFontFamily(fontFamily);
        run.setFontSize(fontSize);
        run.setColor(colorRGB);
        run.setText(text);
        run.setBold(bold);
        if (addBreak) {
            run.addBreak();
        }
    }

    /**
     * xu ly bang
     *
     * @param document
     * @param fieldsForReport
     * @param str_first_field
     * @param str_last_field
     * @param str_matcher
     * @param str_matcher_child
     * @return document
     */
    private static XWPFDocument iterateThroughTables(XWPFDocument document, Map<String, String> fieldsForReport,
            String str_first_field, String str_last_field, String str_matcher, String str_matcher_child) {
        for (XWPFTable table : document.getTables()) {
            //   iterateThoughAddRows(table);
            boolean check = false;
            boolean check2 = false;
            boolean check3 = false;
            for (XWPFTableRow row : table.getRows()) {
                for (XWPFTableCell cell : row.getTableCells()) {
                    for (XWPFParagraph paragraph : cell.getParagraphs()) {
                        iterateThroughRuns(paragraph, fieldsForReport, str_first_field, str_last_field,
                                str_matcher, str_matcher_child);
                    }
                }
            }

        }
        return document;
    }

    /**
     * Chia truong hop co the xay ra khi thay the
     *
     * @param document
     * @param fieldsForReport
     * @param str_first_field
     * @param str_last_field
     * @param str_matcher
     * @param str_matcher_child
     * @return document
     */
    private static void iterateThroughRuns(XWPFParagraph paragraph, Map<String, String> fieldsForReport,
            String str_first_field, String str_last_field, String str_matcher, String str_matcher_child) {
        List<XWPFRun> runs = paragraph.getRuns();
        // Runs null
        if (runs == null) {
            return;
        }
        for (XWPFRun run : runs) {
            // Case 1: run.text = STR_FIRST_FIELD
            if (str_first_field.equals(run.text())) {
//                System.out.println(run.getText(0));
                replaceDataRunCase1(run, paragraph, fieldsForReport, str_first_field, str_last_field);
            } // Case 2: run.text = ...#DataField1#...
            else if (run.text().matches(str_matcher)) {
//                System.out.println(run.getText(0));
                replaceDataRunCase2(run, paragraph, fieldsForReport, str_first_field, str_matcher_child);
            } // Case 3: run.text = ...#DataField1... 
            else if (run.text().contains(str_first_field)) {
//                System.out.println(run.getText(0));
                replaceDataRunCase3(run, paragraph, fieldsForReport, str_first_field, str_last_field);
            }
        }
    }

    /**
     * Truong hop co ky tu nhu sau: #DataField#
     *
     * @param run
     * @param paragraph
     * @param fieldsForReport
     */
    private static void replaceDataRunCase2(XWPFRun run, XWPFParagraph paragraph, Map<String, String> fieldsForReport,
            String str_first_field, String str_matcher_child) {
        Matcher matcher = Pattern.compile(str_matcher_child).matcher(run.text());
        while (matcher.find()) {
            String variableWithHash = matcher.group();
            String variableWithoutHash = variableWithHash.replace(str_first_field, "");
            // If variableWithoutHash not exist fieldsForReport
            if (fieldsForReport.get(variableWithoutHash) == null) {
                continue;
            }
            // Replace Text
            String newText = run.getText(0).replace(variableWithHash, fieldsForReport.get(variableWithoutHash));
            run.setText(newText, 0);
        }
    }

    /**
     * Truong hop co ky tu nhu sau: #DataField#
     *
     * @param run
     * @param paragraph
     * @param fieldsForReport
     */
    private static void replaceDataRunCase1(XWPFRun run, XWPFParagraph paragraph, Map<String, String> fieldsForReport,
            String str_first_field, String str_last_field) {
        int run_start = paragraph.getRuns().indexOf(run);
        int run_finish = -1;
        StringBuilder field = new StringBuilder();
        for (int i = run_start + 1; i < paragraph.getRuns().size(); i++) {
            System.out.println(paragraph.getText());
            if (paragraph.getRuns().get(i).text() != null && paragraph.getRuns().get(i).text().contains(str_last_field)) {
//                 Nếu như trong runs là # và 1 dấu cách sau nó
                if (paragraph.getRuns().get(i).text().length() > 1) {
                    paragraph.getRuns().get(i).setText(" ");
                }
                run_finish = i;
                break;
            } else {
                field.append(paragraph.getRuns().get(i).text());
            }
        }
        // run_finish = "#", 
        if (run_finish >= 0 && fieldsForReport.get(field.toString()) != null) {
            // Example: for branch_name#, set text = ""
            for (int i = run_finish; i > run_start; i--) {
                paragraph.getRuns().get(i).setText("", 0);
            }
            // Replace Text
            paragraph.getRuns().get(run_start).setText(fieldsForReport.get(field.toString()).toString(), 0);
        }
    }

    /**
     * Truong hop co ky tu nhu sau: #DataField#
     *
     * @param run
     * @param paragraph
     * @param fieldsForReport
     */
    private static void replaceDataRunCase3(XWPFRun run, XWPFParagraph paragraph, Map<String, String> fieldsForReport,
            String str_first_field, String str_last_field) {
        int run_start = paragraph.getRuns().indexOf(run);
        int run_finish = -1;
        int first_index = run.text().indexOf(str_first_field);
        int last_index = -1;
        StringBuilder field = new StringBuilder();
        field.append(run.text().substring(first_index + 1, run.text().length()));
        // For run start + 1 -> name#
        for (int i = run_start + 1; i < paragraph.getRuns().size(); i++) {
            if (paragraph.getRuns().get(i).text().contains(str_last_field)) {
                run_finish = i;
                last_index = paragraph.getRuns().get(i).text().indexOf(str_last_field);
                field.append(paragraph.getRuns().get(i).text().substring(0, last_index));
                break;
            } else {
                field.append(paragraph.getRuns().get(i).text());
            }
        }
        if (run_finish >= 0 && last_index > -1 && fieldsForReport.get(field.toString()) != null) {
            // Remove Text not start and finish
            for (int i = run_start + 1; i < run_finish; i++) {
                paragraph.getRuns().get(i).setText("", 0);
            }
            // Replace Text
            paragraph.getRuns().get(run_start).setText(paragraph.getRuns().get(run_start).text().split(str_first_field)[0]
                    + fieldsForReport.get(field.toString()).toString(), 0);
            paragraph.getRuns().get(run_finish).setText(paragraph.getRuns().get(run_finish).text().substring(last_index + 1), 0);
        }
    }

    /**
     * Thuc hien luu file
     *
     * @param filePath
     * @param document
     * @return boolean
     */
    public static boolean saveDocxFile(String filePath, XWPFDocument document) {
        try {
            if (document == null || filePath == null) {
                return false;
            }
            FileOutputStream outputStream = new FileOutputStream(filePath);
            document.write(outputStream);
            outputStream.close();
            document.close();
            return true;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static XWPFDocument loopRow(XWPFDocument document, XWPFTable table, int loopRow, String doc) {
        if (doc.equals("BM01_2_7")) {
            try {
                // create loop for each query
                for (int j = 0; j < loopRow; j++) {
                    // create row: copy and replace row
                    XWPFTableRow row = table.createRow();
                    row.getCell(0).setText("#STT" + j + "#");
                    row.getCell(1).setText("#MSSV" + j + "#");
                    row.getCell(2).setText("#HOTEN" + j + "#");
                    row.getCell(3).setText("#LOP" + j + "#");
                    row.getCell(4).setText("#KTT" + j + "#");
                    row.getCell(5).setText("#DQT" + j + "#");
                    row.getCell(6).setText("#DCK" + j + "#");
                    // add new row
                    //  table.addRow(newRow, j + 1);
                }
                // delete row originally
                //     table.removeRow(1);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                // create loop for each query
                for (int j = 0; j < loopRow; j++) {
                    // create row: copy and replace row
                    XWPFTableRow row = table.createRow();
                    row.getCell(0).setText("#STT" + j + "#");
                    row.getCell(1).setText("#MSSV" + j + "#");
                    row.getCell(2).setText("#HOTEN" + j + "#");
                    row.getCell(3).setText("#LOP" + j + "#");
                    row.getCell(4).setText("#STARTDATE" + j + "#");
                    row.getCell(5).setText("#TENCONGTY" + j + "#");
                    row.getCell(6).setText("#TENDETAI" + j + "#");
                    row.getCell(6).setText("#SOKHOP" + j + "#");
                    // add new row
                    //  table.addRow(newRow, j + 1);
                }
                // delete row originally
                //     table.removeRow(1);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return document;
    }

}
