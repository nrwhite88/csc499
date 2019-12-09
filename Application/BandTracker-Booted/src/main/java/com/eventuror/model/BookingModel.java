package com.eventuror.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.sql.DataSource;

import com.eventuror.entity.Booking;

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
	
}
