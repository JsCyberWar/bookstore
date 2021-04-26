package group2it81.service;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;

import group2it81.configs.HibernateUtils;
import group2it81.pojo.Author;

public class AuthorService {
    public List<Author> getAuthor(){
        String hql = "FROM Author a";
        try(Session session = HibernateUtils.getSessionFactory().openSession()){
            Query<Author> q = session.createQuery(hql);
            return q.list();
        }
    }
}
