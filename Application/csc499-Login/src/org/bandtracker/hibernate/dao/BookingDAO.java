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

public class BookingDAO {
	
    private static SessionFactory factory;
    
    public static SessionFactory getSessionFactory() {
        if (factory == null) {
            // loads configuration and mappings
            Configuration configuration = new Configuration().configure()
            		.addAnnotatedClass(User.class)
            		.addAnnotatedClass(Booking.class)
            		.addAnnotatedClass(Show.class);
            ServiceRegistry serviceRegistry
                = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();
             
            // builds a session factory from the service registry
            factory = configuration.buildSessionFactory(serviceRegistry);           
        }
         
        return factory;
    }
	
    //Testing
	public void addBooking(Booking booking) {
		factory = getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		User user = (User) session.get(User.class, 10);
		Show show = (Show) session.get(Show.class, 4);
		
		booking.setmUser(user);
		booking.setmShow(show);
		
		session.save(booking);
		session.getTransaction().commit();
		
		System.out.println(booking.getRequestedDatetime() + "booking was added for" + user.getUsername());	
	}
	
	public void addBookingDetails(Booking booking, int bandId, int showId) {
		factory = getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		User band = (User) session.get(User.class, bandId);
		Show show = (Show) session.get(Show.class, showId);		
		
		booking.setmUser(band);
		booking.setmShow(show);
		
		session.save(booking);
		session.getTransaction().commit();
		
		System.out.println(booking.getRequestedDatetime() + "booking was added for" + band.getUsername());	
	}
	
	public List<Booking> listBookingsByUserId(int uid) {

		factory = getSessionFactory();
		PreparedStatement statement = null;
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		List<Booking> bookings =  session.createQuery("select b from Bookings b "
				+ "where band_id=?1").setParameter(1, uid).getResultList();
		session.getTransaction().commit();
		System.out.println(bookings);
		return bookings;
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
