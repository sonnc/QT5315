/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.controller;

import hust.sie.inpg12.sonnc.entities.*;
import hust.sie.inpg12.sonnc.model.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.Session;

/**
 *
 * @author sonnc
 */
public class NhdController {

    Session session;
    Transaction transaction;

    public NhdController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public List getAllDanhSachSinhVienByNHD(String email) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select a.mssv, a.ho_ten, a.lop, a.khoa_vien, d.ten_de_tai, c.trang_thai, d.ma_de_tai,\n"
                    + "c.thoi_gian_bat_dau, c.thoi_gian_ket_thuc\n"
                    + "from sinh_vien a join sinh_vien_thuc_tap c on a.mssv = c.mssv\n"
                    + "join de_tai d on c.ma_de_tai = d.ma_de_tai\n"
                    + "join nguoi_huong_dan b on d.ma_gvhd = b.ma_gvhd\n"
                    + "where b.email =:email \n"
                    + " order by c.trang_thai");
            query.setParameter("email", email);
            results = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return results;
    }

    public List ChamDiem(String email) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select a.mssv, a.ho_ten, d.ten_de_tai\n"
                    + "from sinh_vien a join sinh_vien_thuc_tap c on a.mssv = c.mssv\n"
                    + "join de_tai d on c.ma_de_tai = d.ma_de_tai\n"
                    + "join nguoi_huong_dan b on d.ma_gvhd = b.ma_gvhd\n"
                    + "where b.email =:email and c.trang_thai = true");
            query.setParameter("email", email);
            results = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return results;
    }

    public List GetBaoCaoSV(int loaiFile, int mssv, int dotThucTap) {
        List<SinhVienFile> lstSinhVienFile = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM SinhVienFile WHERE mssv =:mssv and loaiFile =:loaiFile and dotThucTap =: dotThucTap");
            query.setParameter("mssv", mssv);
            query.setParameter("loaiFile", loaiFile);
            query.getFirstResult();
            lstSinhVienFile = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstSinhVienFile;
    }
}
