/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.controller;

import hust.sie.inpg12.sonnc.entities.CongTy;
import hust.sie.inpg12.sonnc.entities.DaiDienCongTy;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.Email;
import hust.sie.inpg12.sonnc.entities.Login;
import hust.sie.inpg12.sonnc.entities.Logs;
import hust.sie.inpg12.sonnc.entities.NguoiHuongDan;
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

    public DeTai getInfoDeTaiByDDCT(int ms) {
        DeTai dt = new DeTai();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            dt = (DeTai) session.get(DeTai.class, ms);
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

    public boolean updateDeleteDeTaiByDDCT(DeTai dt) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(dt);
            r = true;
            transaction.commit();
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

    public CongTy getInfoCongTyByDDCT(int msct) {
        CongTy ct = new CongTy();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            ct = (CongTy) session.get(CongTy.class, msct);
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

    public int saveDaiDienCongTy(DaiDienCongTy ddct) {
        int madaidien = 0;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            madaidien = (int) session.save(ddct);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return madaidien;
    }

    public boolean updateCongty(CongTy ct) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(ct);
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

    public boolean saveCongty(CongTy ct) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(ct);
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
    public List chiTietCongTy(int mct) {
        List<Object[]> results = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("select a.ma_cong_ty, a.ten_cong_ty, a.dia_chi, a.dien_thoai, a.email, a.website, a.linh_vuc_hoat_dong,\n"
                    + "a.mo_ta, a.logo, a.trang_thai, b.ma_dai_dien, b.ho_ten, b.chuc_vu, \n"
                    + "b.dia_chi as dia_chi_dd, b.dien_thoai as dien_thoai_dd, b.email as email_dd, b.avatar\n"
                    + "from cong_ty a join dai_dien_cong_ty b on a.ma_dai_dien = b.ma_dai_dien\n"
                    + "where a.ma_cong_ty =:mct ");
            q.setParameter("mct", mct);
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
                    + "                    join nguoi_huong_dan e on a.ma_gvhd = e.ma_gvhd\n"
                    + "                    where a.ma_cong_ty = \n"
                    + "                    (\n"
                    + "                    select d.ma_cong_ty from cong_ty d join dai_dien_cong_ty c on c.ma_dai_dien = d.ma_dai_dien\n"
                    + "                    where c.email =:email\n"
                    + "                    )\n"
                    + "                    and a.trang_thai <> 3\n"
                    + "                    order by a.ma_de_tai desc");
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

//    public List GetAllNguoiHuongDanByCongTy(String email) {
//        List<Object[]> results = new ArrayList<>();
//        try {
//            session = HibernateUtil.getSessionFactory().openSession();
//            transaction = session.beginTransaction();
//            Query q = session.createSQLQuery("select a.* from nguoi_huong_dan a join cong_ty b on a.ma_cong_ty = b.ma_cong_ty\n"
//                    + "join dai_dien_cong_ty c on b.ma_dai_dien = c.ma_dai_dien\n"
//                    + "where c.email =:email");
//            q.setParameter("email", email);
//            results = q.list();
//            transaction.commit();
//        } catch (Exception e) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return results;
//    }
    public int GetMaCongTy(String email) {
        int maCongTy = 0;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createSQLQuery("select b.ma_cong_ty, b.ten_cong_ty from dai_dien_cong_ty a join cong_ty b on a.ma_dai_dien = b.ma_dai_dien\n"
                    + "where a.email =:email");
            q.setParameter("email", email);
            List<Object[]> results = q.list();
            for (Object[] result : results) {
                maCongTy = ((Integer) result[0]);
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

    public boolean SaveDeTai(DeTai deTai) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(deTai);
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

    public List GetAllNguoiHuongDanByCongTy(int maCongTy) {
        List<NguoiHuongDan> lstNguoiHuongDans = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM NguoiHuongDan WHERE maCongTy =:maCongTy");
            q.setParameter("maCongTy", maCongTy);
            lstNguoiHuongDans = q.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstNguoiHuongDans;
    }

    public boolean AddAcountNguoiHuongDan(NguoiHuongDan nhd, Login login) {
        boolean r = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(login);
            session.save(nhd);
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

    public List getAllEmail(String email) {
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

    public List getAllEmailRead(String email) {
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

    public List getAllEmailUnread(String email) {
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

    public List getAllEmailSend(String email) {
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

    public boolean sendEmail(Email email) {
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
