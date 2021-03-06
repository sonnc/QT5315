/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.controller;

import hust.sie.inpg12.sonnc.entities.CongTy;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.Email;
import hust.sie.inpg12.sonnc.entities.FileAll;
import hust.sie.inpg12.sonnc.entities.GiangVienHuongDan;
import hust.sie.inpg12.sonnc.entities.HeSoDiem;
import hust.sie.inpg12.sonnc.entities.Logs;
import hust.sie.inpg12.sonnc.entities.QuyTrinh;
import hust.sie.inpg12.sonnc.entities.SinhVienDangKy;
import hust.sie.inpg12.sonnc.entities.SinhVienDiem;
import hust.sie.inpg12.sonnc.entities.SinhVienThucTap;
import hust.sie.inpg12.sonnc.model.HibernateUtil;
import hust.sie.inpg12.sonnc.other.CongTyvaDaiDienCongTy;
import hust.sie.inpg12.sonnc.other.DetaiCongtyNguoihuongdan;
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
            results = (List<Object[]>) session.createSQLQuery("select a.mssv, a.ho_ten, a.lop, a.khoa, a.khoa_vien, \n"
                    + "b.dot_thuc_tap, ifnull(b.trang_thai, true) as trang_thai\n"
                    + "from sinh_vien a left join sinh_vien_thuc_tap b on a.mssv = b.mssv\n"
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
                    + "from sinh_vien a, de_tai b, nguoi_huong_dan c, sinh_vien_dang_ky d, cong_ty e\n"
                    + "where a.mssv = d.mssv\n"
                    + "and d.ma_cong_ty = e.ma_cong_ty\n"
                    + "and d.ma_de_tai = b.ma_de_tai\n"
                    + "and b.ma_gvhd = c.ma_gvhd\n"
                    + "and e.ma_cong_ty = c.ma_cong_ty order by d.dot_thuc_tap desc").list();
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
                    + "                     from sinh_vien a, de_tai b, nguoi_huong_dan c, sinh_vien_dang_ky d, cong_ty e \n"
                    + "                     where a.mssv = d.mssv \n"
                    + "                     and d.ma_cong_ty = e.ma_cong_ty \n"
                    + "                     and d.ma_de_tai = b.ma_de_tai \n"
                    + "                     and e.ma_cong_ty = c.ma_cong_ty \n"
                    + "                     and d.trang_thai = 2\n"
                    + "                     and b.ma_gvhd = c.ma_gvhd\n"
                    + "                     group by a.mssv, a.ho_ten , b.ten_de_tai, e.ten_cong_ty, c.ho_ten , d.so_khop,  \n"
                    + "                     d.dot_thuc_tap, d.trang_thai, e.ma_cong_ty, b.ma_de_tai, c.ma_gvhd order by d.dot_thuc_tap desc").list();
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
                    + "from sinh_vien a, de_tai b, nguoi_huong_dan c, sinh_vien_dang_ky d, cong_ty e\n"
                    + "where a.mssv = d.mssv\n"
                    + "and d.ma_cong_ty = e.ma_cong_ty\n"
                    + "and d.ma_de_tai = b.ma_de_tai\n"
                    + "and e.ma_cong_ty = c.ma_cong_ty\n"
                    + "and b.ma_gvhd = c.ma_gvhd\n"
                    + "and (d.trang_thai = 1 or d.trang_thai = 0) order by d.dot_thuc_tap desc").list();
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
            Query q = session.createQuery("FROM SinhVienThucTap where mssv =:ms and trangThai = True and dotThucTap =:dot");
            q.setParameter("ms", ms);
            q.setParameter("dot", dot);
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
                    + "                   and (c.diem_bcqt is null or c.diem_cuoi_ky is null \n"
                    + "                   or c.diem_phan_hoi is null or c.diem_qua_trinh is null )\n"
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

    public List getMSSVDiemByID(int mssv, int dotThucTap) {
        List<SinhVienDiem> lst = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM SinhVienDiem where mssv =:ms and dotThucTap =:dot");
            q.setParameter("ms", mssv);
            q.setParameter("dot", dotThucTap);
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

    public boolean chamDiem(SinhVienDiem svd) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(svd);
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

    public boolean CloseThucTapSinhVien(int mssv, int dotThucTap) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("UPDATE SinhVienThucTap SET trangThai=FALSE"
                    + " WHERE mssv=:mssv and dotThucTap=:dotThucTap");
            q.setParameter("mssv", mssv);
            q.setParameter("dotThucTap", dotThucTap);
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

    public List getSLPhanHoi(int mssv, int dotThucTap) {
        List<SinhVienDiem> lst = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM Email where mssv =:ms and dotThucTap =:dot and type = 1");
            q.setParameter("ms", mssv);
            q.setParameter("dot", dotThucTap);
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

    public List<Object[]> getAllDiemSinhVien() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            results = (List<Object[]>) session.createSQLQuery("select a.mssv, a.ho_ten, a.lop, a.khoa, a.khoa_vien, b.dot_thuc_tap, b.trang_thai, \n"
                    + "c.diem_phan_hoi, c.diem_bcqt, c.diem_qua_trinh, c.diem_cuoi_ky\n"
                    + "from sinh_vien a, sinh_vien_thuc_tap b, sinh_vien_diem c\n"
                    + "where a.mssv = b.mssv\n"
                    + "and c.mssv = a.mssv\n"
                    + "and c.dot_thuc_tap = b.dot_thuc_tap\n"
                    + "and b.trang_thai = true\n"
                    + "and (c.diem_bcqt is not null or c.diem_cuoi_ky is not null \n"
                    + "or c.diem_phan_hoi is not null or c.diem_qua_trinh is not null )\n"
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

    public List<Object[]> getAllDiemSinhVienByKTT(int kyThucTap) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("select a.mssv, a.ho_ten, a.lop, b.dot_thuc_tap, c.diem_qua_trinh, c.diem_cuoi_ky\n"
                    + "from sinh_vien a, sinh_vien_thuc_tap b, sinh_vien_diem c\n"
                    + "where a.mssv = b.mssv\n"
                    + "and c.mssv = a.mssv\n"
                    + "and c.dot_thuc_tap = b.dot_thuc_tap\n"
                    + "and b.trang_thai = false\n"
                    + "and b.dot_thuc_tap =:ktt");
            q.setParameter("ktt", kyThucTap);
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

    public List<Object[]> reportNguyenVongSinhVien(int kyThucTap) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("SELECT a.mssv, a.ho_ten, a.lop, d.thoi_gian_bat_dau, e.ten_cong_ty, b.ten_de_tai, f.so_khop\n"
                    + "from sinh_vien a, de_tai b, sinh_vien_thuc_tap d, cong_ty e, sinh_vien_dang_ky f\n"
                    + "where a.mssv = d.mssv\n"
                    + "and a.mssv = f.mssv\n"
                    + "and d.mssv = f.mssv\n"
                    + "and d.ma_de_tai = b.ma_de_tai\n"
                    + "and b.ma_cong_ty = e.ma_cong_ty\n"
                    + "and f.trang_thai = 1\n"
                    + "and d.trang_thai = true\n"
                    + "and d.dot_thuc_tap =:kyThucTap");
            q.setParameter("kyThucTap", kyThucTap);
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

    public List getAllFileGVHD(String email) {
        List<FileAll> lst = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM FileAll where email =:email");
            q.setParameter("email", email);
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

    public boolean UploadFileGVHD(FileAll file) {
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

    public boolean deleteTaiLieuGVHD(int id, String email) {
        boolean r = false;
        FileAll fa = new FileAll();
        fa.setId(id);
        fa.setEmail(email);
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.delete(fa);
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

    public List<Object[]> getAllCongTy() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select  a.ma_cong_ty, a.logo, a.ten_cong_ty, a.dia_chi,\n"
                    + "a.dien_thoai, a.email, b.ho_ten, b.ma_dai_dien, a.trang_thai\n"
                    + "from cong_ty a join dai_dien_cong_ty b on a.ma_dai_dien = b.ma_dai_dien ");
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

    // Lấy toàn bộ danh sách công ty chưa được duyệt
    public List<Object[]> GetAllCongTyReview() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select  a.ma_cong_ty, a.logo, a.ten_cong_ty, a.dia_chi,\n"
                    + "a.dien_thoai, a.email, b.ho_ten, b.ma_dai_dien, a.trang_thai\n"
                    + "from cong_ty a join dai_dien_cong_ty b on a.ma_dai_dien = b.ma_dai_dien \n"
                    + "where a.trang_thai = 2 ");
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

    public List<Object[]> GetAllCongTyReviewed() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select  a.ma_cong_ty, a.logo, a.ten_cong_ty, a.dia_chi,\n"
                    + "a.dien_thoai, a.email, b.ho_ten, b.ma_dai_dien, a.trang_thai\n"
                    + "from cong_ty a join dai_dien_cong_ty b on a.ma_dai_dien = b.ma_dai_dien \n"
                    + "where a.trang_thai = 0 or a.trang_thai = 1");
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

    public boolean AcceptRefuseCongTy(CongTy congTy) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(congTy);
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

    public CongTy getCongTyByID(int maCongTy) {
        CongTy ct = new CongTy();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            ct = (CongTy) session.get(CongTy.class, maCongTy);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return ct;
    }

    public List GetAllDeTaiCT() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select a.ten_cong_ty, c.ho_ten, b.*, a.logo\n"
                    + "from cong_ty a join de_tai b on a.ma_cong_ty = b.ma_cong_ty\n"
                    + "join nguoi_huong_dan c on a.ma_cong_ty = c.ma_cong_ty\n"
                    + " where b.ma_gvhd = c.ma_gvhd\n"
                    + "and b.trang_thai <> 3");
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

    // đề tài chưa được duyệt
    public List<Object[]> GetAllDeTaiReview() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select a.ten_cong_ty, c.ho_ten, b.*, a.logo\n"
                    + "                    from cong_ty a join de_tai b on a.ma_cong_ty = b.ma_cong_ty\n"
                    + "                    join nguoi_huong_dan c on b.ma_cong_ty = c.ma_cong_ty\n"
                    + "                    where b.trang_thai = 2\n"
                    + "                     and b.ma_gvhd = c.ma_gvhd");
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

    public boolean AcceptRefuseDeTai(DeTai dt) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(dt);
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

    public DeTai getDeTaiByID(int maDeTai) {
        DeTai dt = new DeTai();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            dt = (DeTai) session.get(DeTai.class, maDeTai);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return dt;
    }

    public List<Object[]> GetAllDeTaiReviewed() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select a.ten_cong_ty, c.ho_ten, b.* , a.logo\n"
                    + "from de_tai b join cong_ty a on a.ma_cong_ty = b.ma_cong_ty\n"
                    + "join nguoi_huong_dan c on b.ma_gvhd = c.ma_gvhd\n"
                    + "where b.trang_thai = 1 or b.trang_thai = 0\n"
                    + "and a.ma_cong_ty = c.ma_cong_ty");
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

    public List getAllEmailGVHD(String email) {
        List<Email> lstEmails = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM Email WHERE nguoiGui =:email OR nguoiNhan =:email  ORDER BY id DESC");
            q.setParameter("email", email);
            lstEmails = q.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstEmails;
    }

    public List getAllEmailGVHDRead(String email) {
        List<Email> lstEmails = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM Email WHERE nguoiNhan =:email and trangThai = TRUE  ORDER BY id DESC");
            q.setParameter("email", email);
            lstEmails = q.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstEmails;
    }

    public List getAllEmailGVHDUnread(String email) {
        List<Email> lstEmails = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM Email WHERE nguoiNhan =:email and trangThai = FALSE  ORDER BY id DESC");
            q.setParameter("email", email);
            lstEmails = q.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstEmails;
    }

    public List getAllEmailGVHDSend(String email) {
        List<Email> lstEmails = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM Email WHERE nguoiGui =:email ORDER BY id DESC");
            q.setParameter("email", email);
            lstEmails = q.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstEmails;
    }

    public boolean sendEmailGVHD(Email email) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(email);
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

    public List getLichTrinhForGVHD() {
        List<QuyTrinh> lstQuyTrinhs = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM QuyTrinh ORDER BY id DESC");
            lstQuyTrinhs = q.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstQuyTrinhs;
    }

    public boolean SaveLichTrinh(QuyTrinh qt) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(qt);
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

    public boolean DeleteLichTrinh(int id) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("DELETE FROM Quy_Trinh WHERE id =:id");
            q.setParameter("id", id);
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

    public boolean SaveThongTinCaNhan(GiangVienHuongDan gvpt) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(gvpt);
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

    public boolean updateThongTinCaNhan(GiangVienHuongDan gvpt) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(gvpt);
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

    public int getMaGVHDId(String email) {
        List<GiangVienHuongDan> lst = new ArrayList<>();
        int m = 0;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM GiangVienHuongDan where email =:email");
            q.setParameter("email", email);
            lst = q.list();
            if (lst.size() != 0) {
                m = lst.get(0).getMaGvpt();
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
        return m;
    }

    public GiangVienHuongDan getInfoGVHD(int ma) {
        GiangVienHuongDan gvhd = new GiangVienHuongDan();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            gvhd = (GiangVienHuongDan) session.get(GiangVienHuongDan.class, ma);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return gvhd;
    }

    public List<Object[]> GetAllBaoCaoQTCK() {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select a.mssv, a.ho_ten, a.lop, a.khoa, c.dot_thuc_tap, \n"
                    + "(  \n"
                    + "select b.link as link\n"
                    + "from sinh_vien_thuc_tap a join sinh_vien_file b on a.mssv = b.mssv\n"
                    + "where b.loai_file = 1\n"
                    + ")as baocaoquatrinh,\n"
                    + "(  \n"
                    + "select b.link\n"
                    + "from sinh_vien_thuc_tap a join sinh_vien_file b on a.mssv = b.mssv\n"
                    + "where b.loai_file = 2\n"
                    + ") as baocaocuoiky,\n"
                    + "(\n"
                    + "select b.link\n"
                    + "from sinh_vien_thuc_tap a join sinh_vien_file b on a.mssv = b.mssv\n"
                    + "where b.loai_file = 3\n"
                    + ") as danhgia\n"
                    + "from sinh_vien a join sinh_vien_thuc_tap c on a.mssv = c.mssv;");
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

    public void logs(Logs logs) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(logs);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

}
