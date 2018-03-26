/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.controller;

import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.SinhVien;
import hust.sie.inpg12.sonnc.entities.SinhVienInfo;
import hust.sie.inpg12.sonnc.model.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

/**
 *
 * @author sonnc
 */
public class SinhVienController {

    Session session;
    Transaction transaction;

    public SinhVienController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    /**
     * Phương thức lưu thông tin chi tiết của sinh viên Phương thức này cần thêm
     * điều kiện kiểm tra nếu hành động save(sv) thành công nhưng hành động
     * save(svi) thất bại.
     *
     * @param sv
     * @param svi
     * @since v1 - 25.03.18
     * @author SonNC
     */
    public boolean saveSinhVienInfo(SinhVien sv, SinhVienInfo svi) {
        boolean r = false;
        try {
            transaction = session.beginTransaction();
            session.save(sv);
            session.save(svi);
            transaction.commit();
            r = true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return r;
    }

    /**
     * Phương thức lấy thông tin của một sinh viên
     *
     * @param mssv
     * @since v1 - 26.03.18
     * @author SonNC
     */
    public List<SinhVien> getSinhVien(int mssv) {
        List<SinhVien> lstSV = new ArrayList<>();
        try {
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM SinhVien WHERE mssv =:ms");
            q.setParameter("ms", mssv);
            lstSV = q.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstSV;
    }

    /**
     * Phương thức lấy thông tin của một sinh viên
     *
     * @param mssv
     * @since v1 - 26.03.18
     * @author SonNC
     */
    public SinhVienInfo getSinhVienInfo(int mssv) {
        SinhVienInfo sv = new SinhVienInfo();
        try {
            transaction = session.beginTransaction();
            sv = (SinhVienInfo) session.get(SinhVienInfo.class, mssv);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return sv;
    }

    /**
     * Phương thức cập nhật thông tin sinh viên
     *
     * @param mssv
     * @since v1 - 26.03.18
     * @author SonNC
     */
    public boolean updateSinhVienThongTin(SinhVien sv, SinhVienInfo svi) {
        boolean r = false;
        try {
            transaction = session.beginTransaction();
            session.update(sv);
            session.update(svi);
            transaction.commit();
            r = true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return r;
    }

    /**
     * Phương thức lấy thông tin đề tài
     *
     * @return list
     * @since v1 26.03.18
     * @autor SonNC
     */
    public List<DeTai> getAllDeTai() {
        List<DeTai> lstDeTai = new ArrayList<>();
        try {
            transaction = session.beginTransaction();
            List<Object[]> results;
            results = (List<Object[]>) session.createQuery("select d.ten_de_tai, d.noi_dung, d.yeu_cau_lap_trinh, d.yeu_cau_khac,\n"
                    + "d.nguoi_dang, d.so_luong, d.so_luong_con, d.ngay_dang, d.han_dang_ky,\n"
                    + "c.ten_cong_ty, c.logo\n"
                    + "from de_tai d join cong_ty c on d.ma_cong_ty = c.ma_cong_ty\n"
                    + "join giang_vien_huong_dan g on d.ma_gvhd = g.ma_gvhd;").list();
            for (Object[] result : results) {
                System.out.println(result[0] + " - " + result[1] + " - " + result[2]);
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
        return lstDeTai;
    }
}
