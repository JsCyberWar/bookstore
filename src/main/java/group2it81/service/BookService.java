package group2it81.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;


import org.hibernate.Session;
import org.hibernate.query.Query;

import group2it81.configs.HibernateUtils;
import group2it81.pojo.Book;
import group2it81.pojo.BookType;

public class BookService {
    public List<Book> loadBooks(){
        String hql = "FROM Book";
        try (Session session = HibernateUtils.getSessionFactory().openSession()){
            Query<Book> q = session.createQuery(hql);
            return q.list();
        }
        
    }
    
    public List<Object[]> getBooksByKeyWord(String kw){
        Session session = HibernateUtils.getSessionFactory().openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = builder.createQuery(Object[].class);

        Root<Book> bookRoot = q.from(Book.class);
        Root<BookType> bookTypeRoot = q.from(BookType.class);

        q = q.where(builder.equal(bookRoot.get("type"), bookTypeRoot.get("id")));
        
        if (!kw.isEmpty())
        {
            String p = String.format("%%%s%%", kw);
            Predicate p1 = builder.like(bookRoot.get("tenSach").as(String.class), p);
            Predicate p2 = builder.like(bookTypeRoot.get("tenLoai").as(String.class), p);
            q = q.where(builder.or(p1,p2));
        }
        q = q.multiselect(bookRoot.get("tenSach"), 
            bookRoot.get("lanTaiBan").as(Integer.class),
            bookRoot.get("donGia").as(Integer.class),
            bookRoot.get("soLuongTon").as(Integer.class),
            bookTypeRoot.get("tenLoai").as(String.class));
         q = q.orderBy(builder.asc(bookRoot.get("tenSach")));
        Query<Object[]> query = session.createQuery(q);
        List<Object[]> books = query.getResultList();
        return books;
    }
    
}
