/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.controller;

import hust.sie.inpg12.sonnc.entities.CongTy;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.SinhVienThucTap;
import hust.sie.inpg12.sonnc.model.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author sonnc
 */
public class DdctController {

    Session session;
    Transaction transaction;

    public DdctController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public List GetCongTy(String email) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("select a.ma_cong_ty, a.ten_cong_ty, a.dia_chi, a.dien_thoai, a.email, a.website, a.linh_vuc_hoat_dong,\n"
                    + "a.mo_ta, a.logo, a.trang_thai, b.ma_dai_dien, b.ho_ten, b.chuc_vu, \n"
                    + "b.dia_chi as dia_chi_dd, b.dien_thoai as dien_thoai_dd, b.email as email_dd, b.avatar\n"
                    + "from cong_ty a join dai_dien_cong_ty b on a.ma_dai_dien = b.ma_dai_dien\n"
                    + "where b.email =:email ");
            q.setParameter("email", email);
            q.getFirstResult();
            results = q.list();
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

    public List getAllDanhSachSinhVienByCongTy(String email) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("select a.mssv, a.ho_ten, a.lop, a.khoa_vien, d.ten_de_tai, c.trang_thai, d.ma_de_tai,\n"
                    + "                    c.thoi_gian_bat_dau, c.thoi_gian_ket_thuc\n"
                    + "                    from sinh_vien a join sinh_vien_thuc_tap c on a.mssv = c.mssv\n"
                    + "                    join de_tai d on c.ma_de_tai = d.ma_de_tai\n"
                    + "                    join cong_ty e on e.ma_cong_ty = d.ma_cong_ty\n"
                    + "                    join dai_dien_cong_ty b on b.ma_dai_dien = e.ma_dai_dien\n"
                    + "                    where b.email =:email");
            q.setParameter("email", email);
            q.getFirstResult();
            results = q.list();
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

    public List GetAllDeTaiByCongTy(String email) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("SELECT a.*, e.ho_ten, e.email, e.dien_thoai, e.chucvu, e.avatar, e.dia_chi  FROM de_tai a\n"
                    + "join nguoi_huong_dan e on a.ma_gvhd = e.ma_gvhd\n"
                    + "where a.ma_cong_ty = \n"
                    + "(\n"
                    + "select d.ma_cong_ty from cong_ty d join dai_dien_cong_ty c on c.ma_dai_dien = d.ma_dai_dien\n"
                    + "where c.email =:email\n"
                    + ")"
                    + "order by a.ma_de_tai desc");
            q.setParameter("email", email);
            results = q.list();
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

    public List GetAllNguoiHuongDanByCongTy(String email) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("select a.* from nguoi_huong_dan a join cong_ty b on a.ma_cong_ty = b.ma_cong_ty\n"
                    + "join dai_dien_cong_ty c on b.ma_dai_dien = c.ma_dai_dien\n"
                    + "where c.email =:email");
            q.setParameter("email", email);
            results = q.list();
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

    public int GetMaCongTy(String email) {
        List<Object[]> results = new ArrayList<>();
        int maCongTy = 0;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("select b.ma_cong_ty from dai_dien_cong_ty a join cong_ty b on a.ma_dai_dien = b.ma_dai_dien\n"
                    + "where a.email =:email");
            q.setParameter("email", email);
            results = q.list();

            for (Object[] result : results) {
                maCongTy = (int) result[0];
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return maCongTy;
    }
}
