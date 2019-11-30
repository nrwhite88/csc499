package org.bandtracker.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.sql.DataSource;

import org.bandtracker.hibernate.entity.Booking;
import org.bandtracker.hibernate.entity.Show;

public class ShowModel {

	public Boolean addShow(DataSource dataSource, Show show, int bar_id) {
		Connection connect = null;
		PreparedStatement statement = null;
		
		try {
			connect = dataSource.getConnection();
			
			String query = "insert into shows (start_datetime, end_datetime)"
					+ "values(?,?)";
			statement = connect.prepareStatement(query);
			statement.setString(1, show.getStartDatetime());
			statement.setString(2, show.getEndDatetime());
			System.out.println(statement);
			
			return statement.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public Boolean getShowById(DataSource dataSource, Show show, int bar_id) {
		Connection connect = null;
		PreparedStatement statement = null;
		
		try {
			connect = dataSource.getConnection();
			
			String query = "select show_ID from shows"
					+ "where ";
			statement = connect.prepareStatement(query);
			statement.setString(1, show.getStartDatetime());
			statement.setString(2, show.getEndDatetime());
			System.out.println(statement);
			
			return statement.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
