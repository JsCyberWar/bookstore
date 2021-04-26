package group2it81.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import group2it81.configs.HibernateUtils;
import group2it81.pojo.BookType;

public class BookTypeService {
    public List<BookType> getBookType(){
        String hql = "FROM BookType";
        try(Session session = HibernateUtils.getSessionFactory().openSession()){
            Query<BookType> q = session.createQuery(hql);
            return q.list();
        }
    }
}
