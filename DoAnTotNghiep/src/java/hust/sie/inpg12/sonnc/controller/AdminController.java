/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.controller;

import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.FileAll;
import hust.sie.inpg12.sonnc.entities.HeSoDiem;
import hust.sie.inpg12.sonnc.entities.Login;
import hust.sie.inpg12.sonnc.entities.SinhVienDiem;
import hust.sie.inpg12.sonnc.entities.ThongBao;
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
public class AdminController {

    Session session;
    Transaction transaction;

    public AdminController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public List getAllSinhVienByAdmin() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("select b.mssv, b.ho_ten, b.lop, b.khoa, b.khoa_vien, a.email, a.status\n"
                    + "from login a left join sinh_vien b on a.email = b.email\n"
                    + "where a.rule = 0 ");
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

    public boolean addAcountLogin(Login l) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(l);
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

    public boolean COAcountByAdmin(String email, String status) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("UPDATE Login SET status=:status"
                    + " WHERE email=:email");
            q.setParameter("email", email);
            q.setParameter("status", status);
            q.executeUpdate();
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

    public boolean deleteAcountSVByAdmin() {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.createQuery("DELETE FROM SinhVienInfo WHERE mssv =:mssv");
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

    public List getAllGVHDByAdmin() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("select b.ho_ten, b.dia_chi, a.email, b.dien_thoai, b.khoa_vien, b.bo_mon, a.status \n"
                    + "from login a left join giang_vien_huong_dan b on a.email = b.email\n"
                    + "where rule = 2");
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

    public List getAllNHDByAdmin() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("select b.ho_ten, b.dien_thoai, b.email, b.chucvu, c.ten_cong_ty, a.status\n"
                    + "from login a join nguoi_huong_dan b on a.email = b.email\n"
                    + "join cong_ty c on b.ma_cong_ty = c.ma_cong_ty\n"
                    + "where c.trang_thai <> 3 and a.rule = 3");
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

    public List<Object[]> getAllCongTy() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select  a.ma_cong_ty, a.logo, a.ten_cong_ty, a.dia_chi,\n"
                    + "a.dien_thoai, a.email, b.ho_ten, b.ma_dai_dien, a.trang_thai, a.website, b.chuc_vu\n"
                    + "from cong_ty a join dai_dien_cong_ty b on a.ma_dai_dien = b.ma_dai_dien \n"
                    + "where a.trang_thai <> 3");
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

    public boolean deleteCongTyByAdmin(int maCongTy) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("UPDATE CongTy SET trangThai = 3 WHERE maCongTy =:maCongTy");
            q.setParameter("maCongTy", maCongTy);
            q.executeUpdate();
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

    public List getAllDeTaiByAdmin() {
        List<DeTai> lstDeTai = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM DeTai WHERE trangThai <> 3 ORDER BY maDeTai DESC");
            lstDeTai = query.list();
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

    public boolean deleteDeTaiByAdmin(int maDeTai) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("UPDATE DeTai SET trangThai = 3 WHERE maDeTai =:maDeTai");
            q.setParameter("maDeTai", maDeTai);
            q.executeUpdate();
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

    public List<Object[]> getAllSVTTByAdmin() {
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

    public List<Object[]> getAllDTSVTTByAdmin() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            results = (List<Object[]>) session.createSQLQuery("SELECT a.mssv, a.ho_ten as sinhvienname, b.ten_de_tai, e.ten_cong_ty, c.ho_ten as nguoihuongdanname, d.so_khop, \n"
                    + "d.dot_thuc_tap, d.trang_thai, e.ma_cong_ty, b.ma_de_tai, c.ma_gvhd\n"
                    + "from sinh_vien a, de_tai b, nguoi_huong_dan c, sinh_vien_dang_ky d, cong_ty e, sinh_vien_thuc_tap f\n"
                    + "where a.mssv = d.mssv\n"
                    + "and d.ma_cong_ty = e.ma_cong_ty\n"
                    + "and d.ma_de_tai = b.ma_de_tai\n"
                    + "and b.ma_gvhd = c.ma_gvhd\n"
                    + "and e.ma_cong_ty = c.ma_cong_ty\n"
                    + "and a.mssv = f.mssv\n"
                    + "and f.ma_de_tai = d.ma_de_tai\n"
                    + "and f.trang_thai = 1").list();
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

    public List<Object[]> getAllDiemThiSVTTByAdmin() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            results = (List<Object[]>) session.createSQLQuery("SELECT a.mssv, a.ho_ten, a.lop, a.khoa, a.khoa_vien, IFNULL(b.diem_phan_hoi, 99.99) as diem_phan_hoi, \n"
                    + "IFNULL(b.diem_bcqt, 99.99) as diem_bcqt, IFNULL(b.diem_qua_trinh, 99.99) as diem_qua_trinh, \n"
                    + "IFNULL(b.diem_cuoi_ky, 99.99) as diem_cuoi_ky, b.dot_thuc_tap, c.trang_thai\n"
                    + "FROM sinh_vien a join sinh_vien_diem b on a.mssv = b.mssv\n"
                    + "join sinh_vien_thuc_tap c on a.mssv = c.mssv\n"
                    + "and c.mssv = b.mssv\n"
                    + "order by b.dot_thuc_tap DESC").list();
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

    public List<Object[]> viewDiemThiSVTTByAdmin(int mssv, int dotThucTap) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("SELECT a.mssv, a.ho_ten, a.lop, a.khoa, a.khoa_vien, b.diem_phan_hoi, b.diem_bcqt,\n"
                    + "b.diem_qua_trinh, b.diem_cuoi_ky, b.dot_thuc_tap, c.trang_thai\n"
                    + "FROM sinh_vien a join sinh_vien_diem b on a.mssv = b.mssv\n"
                    + "join sinh_vien_thuc_tap c on a.mssv = c.mssv\n"
                    + "and c.mssv = b.mssv\n"
                    + "and a.mssv =:mssv\n"
                    + "and c.dot_thuc_tap =:dotThucTap");
            query.setParameter("mssv", mssv);
            query.setParameter("dotThucTap", dotThucTap);
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

    public boolean deleteThongBao(int id) {
        boolean check = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("delete ThongBao where id =:id");
            query.setParameter("id", id);
            transaction.commit();
            int result = query.executeUpdate();
            if (result > 0) {
                check = true;
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return check;
    }

    public List viewThongBao(int id) {
        List<ThongBao> lstThongBaos = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM ThongBao WHERE id =:id");
            query.setParameter("id", id);
            query.getFirstResult();
            lstThongBaos = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstThongBaos;
    }

    public List getAllThongBaoByAdmin() {
        List<ThongBao> lstThongBaos = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM ThongBao ORDER BY id DESC");
            lstThongBaos = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstThongBaos;
    }

    public boolean saveThongBao(ThongBao thongBao) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(thongBao);
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

    public List getAllHeSoDiem() {
        List<HeSoDiem> lstHeSoDiem = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM HeSoDiem h ORDER BY h.id DESC");
            query.setMaxResults(1);
            lstHeSoDiem = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstHeSoDiem;
    }

    public boolean updateDiem(double diemQuaTrinh, double diemBcqt, double diemCuoiKy, int kyThucTap, int mssv) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("UPDATE SinhVienDiem SET diemBcqt=:diemBcqt, diemCuoiKy=:diemCuoiKy, diemQuaTrinh=:diemQuaTrinh"
                    + " WHERE mssv=:mssv and dotThucTap=:kyThucTap");
            q.setParameter("diemBcqt", diemBcqt);
            q.setParameter("diemQuaTrinh", diemQuaTrinh);
            q.setParameter("diemCuoiKy", diemCuoiKy);
            q.setParameter("kyThucTap", kyThucTap);
            q.setParameter("mssv", mssv);
            q.executeUpdate();
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

    public boolean deleteDiemThi(int mssv, int dotThucTap) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("DELETE FROM SinhVienDiem WHERE mssv=:mssv and dotThucTap=:dotThucTap");
            q.setParameter("dotThucTap", dotThucTap);
            q.setParameter("mssv", mssv);
            q.executeUpdate();
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

    public List getAllFileByAdmin() {

        List<FileAll> lstFileAlls = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM FileAll h ORDER BY h.id DESC");
            lstFileAlls = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstFileAlls;
    }

    public boolean deleteFileByAdmin(int id) {
        boolean check = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("delete FileAll where id =:id");
            query.setParameter("id", id);
            transaction.commit();
            int result = query.executeUpdate();
            if (result > 0) {
                check = true;
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return check;
    }

    public boolean UploadFileByAdmin(FileAll file) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(file);
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
}
