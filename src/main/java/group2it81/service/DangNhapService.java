package group2it81.service;

import java.util.List;
import java.util.Collections;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Criterion;

import group2it81.configs.HibernateUtils;
import group2it81.pojo.User;

public class DangNhapService {
    public static String TEN_NV;
    public static int ID_ROLE;
    public List<User> getUser(String username, String pass){
        String hql = "FROM User user WHERE user.username = '" + username + "' AND user.password = '" + pass + "'";
        try(Session session = HibernateUtils.getSessionFactory().openSession()){
            Query<User> query = session.createQuery(hql);
            return query.list();
        }
    }
}

