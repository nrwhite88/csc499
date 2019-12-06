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

public class BookingModel {

	public Boolean addBooking(DataSource dataSource, Booking booking) {
		Connection connect = null;
		PreparedStatement statement = null;
		DateTimeFormatter dtFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String datetimeOfRequest = LocalDateTime.parse(booking.getDatetimeOfRequest()).format(dtFormat);
		
		try {
			connect = dataSource.getConnection();
			
			String query = "insert into bookings (datetime_of_request, duration_hrs, requested_datetime)"
					+ "values(?,?,?)";
			statement = connect.prepareStatement(query);
			statement.setString(1, datetimeOfRequest);
			statement.setString(2, Integer.toString(booking.getDuration()));
			statement.setString(3, booking.getRequestedDatetime());
			System.out.println(statement);
			
			return statement.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<Object> listBookingsWithEverythingByBandId(DataSource dataSource, int bandId) {
		List<Object> listBookings = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			connect = dataSource.getConnection();
			String query = "SELECT b.*, band.public_name as band, band.user_ID as band_ID,\n" + 
					"s.show_name, s.show_ID, bar.public_name as bar, bar.user_ID as bar_ID,\n" + 
					"bar.town, bar.state from Users band\n" + 
					"JOIN BandBookings bb on bb.band_ID=band.user_ID\n" + 
					"JOIN Bookings b on b.booking_ID=bb.booking_ID\n" + 
					"JOIN ShowBookings sb on sb.booking_ID=b.booking_ID\n" + 
					"JOIN Shows s on s.show_ID=sb.show_ID\n" + 
					"JOIN ShowVenues sv on sv.show_ID=s.show_ID\n" + 
					"JOIN Users bar on bar.user_ID=sv.bar_id\n" + 
					"WHERE band.user_ID=?";

			stmt = connect.prepareStatement(query);
			stmt.setInt(1, bandId);

			rs = stmt.executeQuery();

			while(rs.next()) {
				List<Object> booking = Arrays.asList(rs.getInt("booking_ID"),
						rs.getString("requested_datetime"),
						rs.getInt("duration_hrs"),
						rs.getString("datetime_of_request"),
						rs.getBoolean("bar_confirmed"),
						rs.getBoolean("band_confirmed"),
						rs.getString("band"),
						rs.getInt("band_ID"),
						rs.getString("show_name"),
						rs.getInt("show_ID"),
						rs.getString("bar"),
						rs.getInt("bar_ID"),
						rs.getString("town"),
						rs.getString("state")
						);
				listBookings.add(booking);
			}
			System.out.println(listBookings);
			return listBookings;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listBookings;
	}
	
	public List<Object> listMyBookingsByBarId(DataSource dataSource, int barId) {
		List<Object> listBookings = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			connect = dataSource.getConnection();
			String query = "SELECT b.*, band.public_name as band, band.user_ID as band_ID,\n" + 
					"	s.show_name, s.show_ID, bar.public_name as bar, bar.user_ID as bar_ID,\n" + 
					"    bar.town, bar.state from Users band\n" + 
					"JOIN BandBookings bb on bb.band_ID=band.user_ID\n" + 
					"JOIN Bookings b on b.booking_ID=bb.booking_ID\n" + 
					"JOIN ShowBookings sb on sb.booking_ID=b.booking_ID\n" + 
					"JOIN Shows s on s.show_ID=sb.show_ID\n" + 
					"JOIN ShowVenues sv on sv.show_ID=s.show_ID\n" + 
					"JOIN Users bar on bar.user_ID=sv.bar_id\n" + 
					"WHERE bar.user_id=?\n" + 
					"ORDER BY band_confirmed asc, requested_datetime asc;";

			stmt = connect.prepareStatement(query);
			stmt.setInt(1, barId);

			rs = stmt.executeQuery();

			while(rs.next()) {
				List<Object> booking = Arrays.asList(rs.getInt("booking_ID"),
						rs.getString("requested_datetime"),
						rs.getInt("duration_hrs"),
						rs.getString("datetime_of_request"),
						rs.getBoolean("bar_confirmed"),
						rs.getBoolean("band_confirmed"),
						rs.getString("band"),
						rs.getInt("band_ID"),
						rs.getString("show_name"),
						rs.getInt("show_ID"),
						rs.getString("bar"),
						rs.getInt("bar_ID"),
						rs.getString("town"),
						rs.getString("state")
						);
				listBookings.add(booking);
			}
			System.out.println(listBookings);
			return listBookings;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listBookings;
	}
	
	public List<Object> listBookingsWithEverythingByShowId(DataSource dataSource, int showId) {
		List<Object> listBookings = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			connect = dataSource.getConnection();
			String query = "SELECT b.*, band.public_name as band, band.user_ID as band_ID,\n" + 
					"s.show_name, s.show_ID, bar.public_name as bar, bar.user_ID as bar_ID,\n" + 
					"bar.town, bar.state from Users band\n" + 
					"JOIN BandBookings bb on bb.band_ID=band.user_ID\n" + 
					"JOIN Bookings b on b.booking_ID=bb.booking_ID\n" + 
					"JOIN ShowBookings sb on sb.booking_ID=b.booking_ID\n" + 
					"JOIN Shows s on s.show_ID=sb.show_ID\n" + 
					"JOIN ShowVenues sv on sv.show_ID=s.show_ID\n" + 
					"JOIN Users bar on bar.user_ID=sv.bar_id\n" + 
					"WHERE s.show_ID=?";

			stmt = connect.prepareStatement(query);
			stmt.setInt(1, showId);

			rs = stmt.executeQuery();

			while(rs.next()) {
				List<Object> booking = Arrays.asList(rs.getInt("booking_ID"),
						rs.getString("requested_datetime"),
						rs.getInt("duration_hrs"),
						rs.getString("datetime_of_request"),
						rs.getBoolean("bar_confirmed"),
						rs.getBoolean("band_confirmed"),
						rs.getString("band"),
						rs.getInt("band_ID"),
						rs.getString("show_name"),
						rs.getInt("show_ID"),
						rs.getString("bar"),
						rs.getInt("bar_ID"),
						rs.getString("town"),
						rs.getString("state")
						);
				listBookings.add(booking);
			}
			System.out.println(listBookings);
			return listBookings;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listBookings;
	}
	
}
