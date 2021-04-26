package group2it81.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import group2it81.configs.HibernateUtils;
import group2it81.pojo.Producer;

public class ProducerService {
    public List<Producer> getProducer(){
        String hql = "FROM Producer";
        try(Session session = HibernateUtils.getSessionFactory().openSession()){
            Query<Producer> q = session.createQuery(hql);
            return q.list();
    }
}
}   
