package org.bandtracker.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.bandtracker.hibernate.entity.Booking;

public class TourModel {
	
	public List<Object> listToursByBandId(DataSource dataSource, int bandId) {
		List<Object> listTours = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			connect = dataSource.getConnection();
			String query = "SELECT t.tour_id, t.tour_name, t.start_datetime, t.end_datetime from Users band\n" + 
					"JOIN BandTours bt on bt.band_ID=band.user_ID\n" + 
					"JOIN Tours t on t.tour_ID=bt.tour_ID\n" +
					"WHERE band.user_ID=?;";

			stmt = connect.prepareStatement(query);
			stmt.setInt(1, bandId);

			rs = stmt.executeQuery();

			while(rs.next()) {
				List<Object> booking = Arrays.asList(
						rs.getInt("tour_id"),
						rs.getString("tour_name"),
						rs.getString("start_datetime"),
						rs.getString("end_datetime")
						);
				listTours.add(booking);
			}
			System.out.println(listTours);
			return listTours;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listTours;
	}
	
	public List<Object> listToursWithBookingsByUserId(DataSource dataSource, int tourId) {
		List<Object> listTourBookings = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			connect = dataSource.getConnection();
			String query = "SELECT t.tour_name, t.tour_description, t.start_datetime, t.end_datetime, \n" + 
					"s.show_name, bar.public_name as bar, bar.town, bar.state,\n" + 
					"b.requested_datetime, b.duration_hrs from Users band\n" + 
					"JOIN BandTours bt on bt.band_ID=band.user_ID\n" + 
					"JOIN Tours t on t.tour_ID=bt.tour_ID\n" + 
					"JOIN TourStops ts on ts.tour_ID=t.tour_ID\n" + 
					"JOIN Shows s on s.show_ID=ts.show_ID\n" + 
					"JOIN ShowVenues sv on sv.show_ID=s.show_ID\n" + 
					"JOIN Users bar on bar.user_ID=sv.bar_ID\n" + 
					"JOIN BandBookings bb on bb.band_ID=band.user_ID\n" + 
					"JOIN Bookings b on b.booking_ID=bb.booking_ID\n" + 
					"WHERE band.user_ID=? and b.band_confirmed=true and b.bar_confirmed=true";

			stmt = connect.prepareStatement(query);
			stmt.setInt(1, tourId);

			rs = stmt.executeQuery();

			while(rs.next()) {
				List<Object> booking = Arrays.asList(rs.getInt("booking_ID"),
						rs.getString("tour_name"),
						rs.getString("tour_description"),
						rs.getString("start_datetime"),
						rs.getString("end_datetime"),
						rs.getString("show_name"),
						rs.getString("public_name"),
						rs.getString("town"),
						rs.getString("state"),
						rs.getString("bar"),
						rs.getString("requested_datetime"),
						rs.getString("duration_hrs")
						);
				listTourBookings.add(booking);
			}
			System.out.println(listTourBookings);
			return listTourBookings;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listTourBookings;
	}
	
	public Boolean addBookingToTour(DataSource dataSource, int tourId, int bookingId) {
		Connection connect = null;
		PreparedStatement stmt = null;

		try {
			connect = dataSource.getConnection();
			
			String query = "insert into TourStops values(?,?)";
			stmt = connect.prepareStatement(query);
			stmt.setInt(1, tourId);
			stmt.setInt(2, bookingId);
			System.out.println(query);
			
			return stmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
			//FIXME add handler for case where username is taken
			return false;
		}
	}
	
}
