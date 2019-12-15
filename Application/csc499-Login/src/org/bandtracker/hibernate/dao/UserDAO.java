package org.bandtracker.hibernate.dao;

import java.sql.PreparedStatement;
import java.util.List;

import org.bandtracker.hibernate.entity.Booking;
import org.bandtracker.hibernate.entity.Show;
import org.bandtracker.hibernate.entity.Tour;
import org.bandtracker.hibernate.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class UserDAO {
	
    private static SessionFactory factory;
    
    public static SessionFactory getSessionFactory() {
        if (factory == null) {
            // loads configuration and mappings
            Configuration configuration = new Configuration().configure()
            		.addAnnotatedClass(User.class)
            		.addAnnotatedClass(Booking.class)
            		.addAnnotatedClass(Show.class)
            		.addAnnotatedClass(Tour.class);
            ServiceRegistry serviceRegistry
                = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();
             
            // builds a session factory from the service registry
            factory = configuration.buildSessionFactory(serviceRegistry);           
        }
         
        return factory;
    }
	
	public void addUserDetails(User user) {
		factory = getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		System.out.println(user.getUsername() + "was added");	
	}
	
	public int getUserIdByUsername(String username) {
		factory = getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		List<User> user =  (List)session.createQuery("from Users"
				+ "where username=?!").setParameter(1, username).getSingleResult();
		session.getTransaction().commit();	
		System.out.println(user);

		return user.get(0).getUserId();
	}
	
	public List<User> getUsersByUsernameSearch(String username) {
		factory = getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		String query = "from Users where username like :userName";
		List<User> users = (List<User>)session.createQuery(query).setString("userName", "%" + username + "%").list();

		return users;
	}
	
	public User getUserById(int uid) {

		factory = getSessionFactory();
		PreparedStatement statement = null;
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		User user = (User) session.get(User.class, uid);

		session.getTransaction().commit();
		System.out.println(user);
		
		return user;
	}
	
	public List<User> listUsers() {
		factory = getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		List<User> users =  session.createQuery("from Users").getResultList();
		session.getTransaction().commit();	
		System.out.println(users);
		return users;
	}
	
}
