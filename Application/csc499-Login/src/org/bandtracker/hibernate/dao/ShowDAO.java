package org.bandtracker.hibernate.dao;

import java.sql.PreparedStatement;
import java.util.List;

import org.bandtracker.hibernate.entity.Booking;
import org.bandtracker.hibernate.entity.Show;
import org.bandtracker.hibernate.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class ShowDAO {
	
    private static SessionFactory factory;
    
    public static SessionFactory getSessionFactory() {
        if (factory == null) {
            // loads configuration and mappings
            Configuration configuration = new Configuration().configure()
            		.addAnnotatedClass(User.class)
            		.addAnnotatedClass(Show.class)
            		.addAnnotatedClass(Booking.class);
            ServiceRegistry serviceRegistry
                = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();
             
            // builds a session factory from the service registry
            factory = configuration.buildSessionFactory(serviceRegistry);           
        }
         
        return factory;
    }
	
    //Testing
	public void addShow(Show show) {
		factory = getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		User user = (User) session.get(User.class, 12);
		
		show.setmUser(user);
		System.out.println(show);
		
		session.save(show);
		session.getTransaction().commit();
		
		System.out.println(show.getStartDatetime() + "show was added for" + user.getUsername());	
	}
	
	public void addShowDetails(Show show, int barId) {
		factory = getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		User bar = (User) session.get(User.class, barId);
		show.setmUser(bar);
		System.out.println(show);
		
		session.save(show);
		session.getTransaction().commit();
		
		System.out.println(show.getStartDatetime() + "show was added for" + bar.getUsername());	
	}
	
	public List<Show> listShowsByUserId(int uid) {

		factory = getSessionFactory();
		PreparedStatement statement = null;
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		List<Show> shows =  session.createQuery("select s from Shows s "
				+ "where bar_id=?1").setParameter(1, uid).getResultList();
		session.getTransaction().commit();
		System.out.println(shows);
		return shows;
	}
		
	public List<Booking> listShowsByBookingId(int bid) {

		factory = getSessionFactory();
		PreparedStatement statement = null;
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		List<Booking> bookings = session.createQuery("select s from Shows s "
				+ "where booking_ID=?1").setParameter(1, bid).getResultList();
		session.getTransaction().commit();
		System.out.println(bookings);
		return bookings;
	}
	
	public List<Object> listShowsWithDetailsByShowId(int sid) {

		factory = getSessionFactory();
		PreparedStatement statement = null;
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		/**
		List<Booking> bookings =  session.createQuery("select bookings "
				+ "from Shows as shows "
				+ "inner join shows.bookings as bookings "
				+ "where show_ID=4").getResultList();
		session.getTransaction().commit();
		*/
		
		/**
		List<Object> something =  session.createQuery("select s from Shows s "
				+ "where booking_id IN "
				+ "(select b.bookingId from Bookings b "
				+ "where band_id=10)").getResultList();
		session.getTransaction().commit();
		*/
		
		List<Object> something =  session.createQuery("select s from Shows s "
				+ "where booking_id=10").getResultList();
		session.getTransaction().commit();
		
		System.out.println("Something" + something);
		return something;
	}
	
	public List<Show> listShowsByBandId(int uid) {

		factory = getSessionFactory();
		PreparedStatement statement = null;
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		List<Show> shows =  session.createQuery("from Users "
				+ "inner join Users.Bookings "
				+ "inner join Bookings.Shows "
				+ "WHERE Users.Bookings.Shows.show_id=?1").setParameter(1, uid).getResultList();
		session.getTransaction().commit();
		System.out.println(shows);
		return shows;
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
