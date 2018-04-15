/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.controller;

import hust.sie.inpg12.sonnc.entities.SinhVienDangKy;
import hust.sie.inpg12.sonnc.entities.SinhVienDiem;
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
public class GvhdController {

    Session session;
    Transaction transaction;

    public GvhdController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public List<Object[]> getAllDanhSachSinhVien() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            results = (List<Object[]>) session.createSQLQuery("select a.mssv, a.ho_ten, a.lop, a.khoa, a.khoa_vien, b.dot_thuc_tap, b.trang_thai \n"
                    + "from sinh_vien a, sinh_vien_thuc_tap b\n"
                    + "where a.mssv = b.mssv\n"
                    + "order by b.dot_thuc_tap desc").list();
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

    public List<Object[]> getAllDeTaiSV() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            results = (List<Object[]>) session.createSQLQuery("SELECT a.mssv, a.ho_ten as sinhvienname, b.ten_de_tai, e.ten_cong_ty, c.ho_ten as nguoihuongdanname, d.so_khop, \n"
                    + "d.dot_thuc_tap, d.trang_thai, e.ma_cong_ty, b.ma_de_tai, c.ma_gvhd\n"
                    + "from sinh_vien a, de_tai b, giang_vien_huong_dan c, sinh_vien_dang_ky d, cong_ty e\n"
                    + "where a.mssv = d.mssv\n"
                    + "and d.ma_cong_ty = e.ma_cong_ty\n"
                    + "and d.ma_de_tai = b.ma_de_tai\n"
                    + "and e.ma_cong_ty = c.ma_cong_ty").list();
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

    public List<Object[]> deTaiSVChuaDuyet() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            results = (List<Object[]>) session.createSQLQuery("SELECT a.mssv, a.ho_ten as sinhvienname, b.ten_de_tai, e.ten_cong_ty, c.ho_ten as nguoihuongdanname, d.so_khop,  \n"
                    + "                     d.dot_thuc_tap, d.trang_thai, e.ma_cong_ty, b.ma_de_tai, c.ma_gvhd \n"
                    + "                     from sinh_vien a, de_tai b, giang_vien_huong_dan c, sinh_vien_dang_ky d, cong_ty e \n"
                    + "                     where a.mssv = d.mssv \n"
                    + "                     and d.ma_cong_ty = e.ma_cong_ty \n"
                    + "                     and d.ma_de_tai = b.ma_de_tai \n"
                    + "                     and e.ma_cong_ty = c.ma_cong_ty \n"
                    + "                     and d.trang_thai = 2\n"
                    + "                     group by a.mssv, a.ho_ten , b.ten_de_tai, e.ten_cong_ty, c.ho_ten , d.so_khop,  \n"
                    + "                     d.dot_thuc_tap, d.trang_thai, e.ma_cong_ty, b.ma_de_tai, c.ma_gvhd ").list();
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

    public List<Object[]> deTaiSVDaDuyet() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            results = (List<Object[]>) session.createSQLQuery("SELECT a.mssv, a.ho_ten as sinhvienname, b.ten_de_tai, e.ten_cong_ty, c.ho_ten as nguoihuongdanname, d.so_khop, \n"
                    + "d.dot_thuc_tap, d.trang_thai, e.ma_cong_ty, b.ma_de_tai, c.ma_gvhd\n"
                    + "from sinh_vien a, de_tai b, giang_vien_huong_dan c, sinh_vien_dang_ky d, cong_ty e\n"
                    + "where a.mssv = d.mssv\n"
                    + "and d.ma_cong_ty = e.ma_cong_ty\n"
                    + "and d.ma_de_tai = b.ma_de_tai\n"
                    + "and e.ma_cong_ty = c.ma_cong_ty\n"
                    + "and (d.trang_thai = 1 or d.trang_thai = 0)").list();
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

    public List listDetaiMotSinhVienDangKy(int mssv, int dotThucTap) {
        List<SinhVienDangKy> lstSinhVienDangKys = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("From SinhVienDangKy where mssv =:ms and dotThucTap =:dtt and trangThai = 2");
            q.setParameter("ms", mssv);
            q.setParameter("dtt", dotThucTap);
            lstSinhVienDangKys = q.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstSinhVienDangKys;
    }

    public SinhVienDangKy detaiMotSinhVienDangKyGetID(int mssv, int dotThucTap, int madt) {
        List<SinhVienDangKy> lstSinhVienDangKys = new ArrayList<>();
        SinhVienDangKy sinhVienDangKy = new SinhVienDangKy();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("From SinhVienDangKy where mssv =:ms and maDeTai =:mdt and dotThucTap =:dtt and trangThai = 2");
            q.setParameter("ms", mssv);
            q.setParameter("dtt", dotThucTap);
            q.setParameter("mdt", madt);
            lstSinhVienDangKys = q.list();
            int id = lstSinhVienDangKys.get(0).getId();
            sinhVienDangKy = (SinhVienDangKy) session.get(SinhVienDangKy.class, id);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return sinhVienDangKy;
    }

    public boolean updateDetaiMotSinhVienDangKy(SinhVienDangKy svdk) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(svdk);
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

    public boolean saveSVTT(SinhVienThucTap svtt, SinhVienDiem svd) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            try {
                session.update(svtt);
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                session.save(svd);
            } catch (Exception e) {
                e.printStackTrace();
            }

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

    public List getSinhVienThucTapByID(int ms, int dot) {
        List<SinhVienThucTap> lst = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM SinhVienThucTap where mssv =:ms and trangThai = True");
            q.setParameter("ms", ms);
            lst = q.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lst;
    }

    public List<Object[]> getDanhSachChamDiem() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            results = (List<Object[]>) session.createSQLQuery("select a.mssv, a.ho_ten, a.lop, a.khoa, a.khoa_vien, b.dot_thuc_tap, b.trang_thai \n"
                    + "                   from sinh_vien a, sinh_vien_thuc_tap b, sinh_vien_diem c\n"
                    + "                   where a.mssv = b.mssv\n"
                    + "                   and c.mssv = a.mssv\n"
                    + "                   and c.dot_thuc_tap = b.dot_thuc_tap\n"
                    + "                   and b.trang_thai = true\n"
                    + "                   order by b.dot_thuc_tap desc").list();
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

//    public List getAllDiemSV() {
//        List<SinhVienDiem> lstSinhVienDiems = new ArrayList<>();
//        try {
//            session = HibernateUtil.getSessionFactory().openSession();
//            transaction = session.beginTransaction();
//            Query q = session.createQuery("From SinhVienDiem");
//            q.setParameter("ms", mssv);
//            q.setParameter("dtt", dotThucTap);
//            q.setParameter("mdt", madt);
//            lstSinhVienDangKys = q.list();
//            int id = lstSinhVienDangKys.get(0).getId();
//            sinhVienDangKy = (SinhVienDangKy) session.get(SinhVienDangKy.class, id);
//            transaction.commit();
//        } catch (Exception e) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//    }
}
