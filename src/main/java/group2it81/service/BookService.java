package group2it81.service;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.query.Query;

import group2it81.configs.HibernateUtils;
import group2it81.pojo.Book;

public class BookService {
    public List<Book> loadBooks(){
        String hql = "FROM Book";
        try (Session session = HibernateUtils.getSessionFactory().openSession()){
            Query<Book> q = session.createQuery(hql);
            return q.list();
        }       
    }
}
