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
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.FlushMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

/**
 *
 * @author sonnc
 */
public class LoginController {

    Session session;
    Transaction transaction;

    public LoginController() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    /**
     * Phương thức này cho phép lấy thông tài khoản người dùng
     *
     * @param email
     * @param pass
     * @since 16.03.18 v1
     */
    public List<Login> login(String email, String pass) {
        List<Login> lstLogin = new ArrayList<>();
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Login WHERE email =:email and pass =:pass");
            query.setParameter("email", email);
            query.setParameter("pass", pass);
            lstLogin = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return lstLogin;
    }

    public List<DeTai> getTest() {
        List<DeTai> list = new ArrayList<>();
        try {
            transaction = session.beginTransaction();
            Criteria criteria = session.createCriteria(DeTai.class, "dt");
            criteria.createAlias("dt.congTy", "ct");
            criteria.createAlias("dt.giangVienHuongDan", "gvhd");
            criteria.createAlias("dt.giangVienHuongDan.login", "login.email");
            list = criteria.list();
//            Query query1 = session.createQuery("FROM DeTai d join d.congTy  ");
//            list = query1.list();
//            for (int i = 0; i < list.size(); i++) {
//                System.out.println(list.get(i).getGiangVienHuongDan().getHoTen());
//                System.out.println(list.get(i).getNoiDung());
//            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

}
