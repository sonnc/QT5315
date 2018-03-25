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
     * Phương thức lấy thông tin của 1 sinh viên
     *
     * @param mssv
     * @return lstSinhVien
     */
    public List<SinhVien> getSinhVienInfo(int mssv) {
        List<SinhVien> lstSinhVien = new ArrayList<>();
        try {
            transaction = session.beginTransaction();
            Query q = session.createQuery("FROM SinhVien WHERE mssv =:mssv");
            q.setParameter("mssv", mssv);
            lstSinhVien = q.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstSinhVien;
    }

    /**
     * Phương thức lưu thông tin chi tiết của sinh viên
     */
    public boolean saveSinhVienInfo(SinhVien sv, SinhVienInfo svi) {
        try {
            transaction = session.beginTransaction();
            session.save(sv);
            session.save(svi);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return false;
    }
}
