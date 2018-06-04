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
                    + "                    c.thoi_gian_bat_dau, c.thoi_gian_ket_thuc\n"
                    + "                    from sinh_vien a join sinh_vien_thuc_tap c on a.mssv = c.mssv\n"
                    + "                    join de_tai d on c.ma_de_tai = d.ma_de_tai\n"
                    + "                    join nguoi_huong_dan b on d.ma_gvhd = b.ma_gvhd\n"
                    + "                    where b.email =:email\n"
                    + "                     order by a.mssv");
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

    public List getAllDSSVDanhGia(String email) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select a.mssv, a.ho_ten from sinh_vien a join sinh_vien_file b on a.mssv = b.mssv\n"
                    + "join sinh_vien_thuc_tap c on a.mssv = c.mssv \n"
                    + "join de_tai d on c.ma_de_tai = d.ma_de_tai\n"
                    + "join nguoi_huong_dan e on d.ma_gvhd = e.ma_gvhd\n"
                    + "where c.trang_thai = true and b.loai_file = 3\n"
                    + "and e.email =:email");
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

    public List getAllDSSVChamCong(String email) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("select a.mssv, a.ho_ten from sinh_vien a join sinh_vien_file b on a.mssv = b.mssv\n"
                    + "join sinh_vien_thuc_tap c on a.mssv = c.mssv \n"
                    + "join de_tai d on c.ma_de_tai = d.ma_de_tai\n"
                    + "join nguoi_huong_dan e on d.ma_gvhd = e.ma_gvhd\n"
                    + "where c.trang_thai = true and b.loai_file = 4\n"
                    + "and e.email =:email");
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

    public int getMaNHD(String email) {
        int getMaNHD = 0;
        List<NguoiHuongDan> lstNHD = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM NguoiHuongDan WHERE email =:email");
            query.setParameter("email", email);
            query.getFirstResult();
            lstNHD = query.list();
            getMaNHD = lstNHD.get(0).getMaGvhd();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return getMaNHD;

    }

    public int getMaCongTy(String email) {
        int getMaCongTy = 0;
        List<NguoiHuongDan> lstNguoiHuongDan = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM NguoiHuongDan WHERE email =:email");
            query.setParameter("email", email);
            query.getFirstResult();
            lstNguoiHuongDan = query.list();
            getMaCongTy = lstNguoiHuongDan.get(0).getMaCongTy();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return getMaCongTy;
    }

    public List getAllDeTaiNHD(int maNHD) {
        List<DeTai> lstDeTai = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM DeTai WHERE maGvhd =:maNHD");
            query.setParameter("maNHD", maNHD);
            query.getFirstResult();
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

    public List getAllDeTai(int manguoihuongdan) {
        List<DeTai> lstDeTai = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM DeTai WHERE maGvhd =:manguoihuongdan");
            query.setParameter("manguoihuongdan", manguoihuongdan);
            query.getFirstResult();
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

    public boolean saveFileSV(SinhVienFile svf) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(svf);
            transaction.commit();
            r = false;
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

    // 
    public boolean updateInFo(NguoiHuongDan nhd) {

        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(nhd);
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

    public List GetCongTy(String email) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("select a.ma_cong_ty, a.ten_cong_ty, a.dia_chi, a.dien_thoai, a.email, a.website, a.linh_vuc_hoat_dong,\n"
                    + "a.mo_ta, a.logo, a.trang_thai, b.ma_dai_dien, b.ho_ten, b.chuc_vu, \n"
                    + "b.dia_chi as dia_chi_dd, b.dien_thoai as dien_thoai_dd, b.email as email_dd, b.avatar\n"
                    + "from cong_ty a join dai_dien_cong_ty b on a.ma_dai_dien = b.ma_dai_dien\n"
                    + "join nguoi_huong_dan c on a.ma_cong_ty = c.ma_cong_ty\n"
                    + "where c.email =:email");
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

    public NguoiHuongDan getInfoNHD(int maNHD) {
        NguoiHuongDan nhd = new NguoiHuongDan();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            nhd = (NguoiHuongDan) session.get(NguoiHuongDan.class, maNHD);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return nhd;
    }
    public CongTy getInfoct(int MACT) {
        CongTy ct = new CongTy();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            ct = (CongTy) session.get(CongTy.class, MACT);
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
