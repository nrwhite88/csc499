package org.bandtracker.hibernate.dao;

import org.bandtracker.hibernate.entity.Booking;
import org.bandtracker.hibernate.entity.Show;
import org.bandtracker.hibernate.entity.Tour;
import org.bandtracker.hibernate.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class TourDAO {
	
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
	
	public void addTourDetails(Tour tour, int bandId) {
		factory = getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		User band = (User) session.get(User.class, bandId);
		tour.setmUser(band);
		System.out.println(tour);
		
		session.save(tour);
		session.getTransaction().commit();
		
		System.out.println(tour.getTourName() + " tour was added for " + band.getUsername());	
	}

	
}
