package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Course;
import kr.ac.hansung.model.DivisionCourse;
import kr.ac.hansung.model.SemesterCourse;

@Repository
public class CourseDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Course> getCourses(Integer year, Integer semester) {
		String sqlStatement = "select * from course where year=? and semester=?";
		
		return jdbcTemplate.query(sqlStatement,  new Object[] { year, semester }, new RowMapper<Course>() {

			@Override
			public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
				Course course = new Course();

				course.setYear(rs.getInt("year"));
				course.setSemester(rs.getInt("semester"));
				course.setCourse_id(rs.getString("course_id"));
				course.setName(rs.getString("name"));
				course.setDivision(rs.getString("division"));
				course.setGrades(rs.getInt("grades"));
				
				return course;
			}

		});
	}

	public List<SemesterCourse> getSemesterCourses() {
		String sqlStatement = "SELECT year,semester,sum(grades) FROM gradesystem.course where year < 2018 group by semester,year order by year,semester asc";

		return jdbcTemplate.query(sqlStatement, new RowMapper<SemesterCourse>() {

			@Override
			public SemesterCourse mapRow(ResultSet rs, int rowNum) throws SQLException {
				SemesterCourse semesterCourse = new SemesterCourse();

				semesterCourse.setYear(rs.getInt("year"));
				semesterCourse.setSemester(rs.getInt("semester"));
				semesterCourse.setTotalGrades(rs.getInt("sum(grades)"));

				return semesterCourse;
			}

		});
	}

	public List<DivisionCourse> getDevisionCourses() {
		String sqlStatement = "select division, sum(grades) from gradesystem.course where year < 2018 group by division";

		return jdbcTemplate.query(sqlStatement, new RowMapper<DivisionCourse>() {

			@Override
			public DivisionCourse mapRow(ResultSet rs, int rowNum) throws SQLException {
				DivisionCourse divisionCourse = new DivisionCourse();

				divisionCourse.setDivision(rs.getString("division"));
				divisionCourse.setTotalGrades(rs.getInt("sum(grades)"));

				return divisionCourse;
			}

		});
	}

	public boolean insert(Course course){
		Integer year = new Integer(2018);
		Integer semester = new Integer(1);
		String course_id = course.getCourse_id();
		String name = course.getName();
		String division = course.getDivision();
		Integer grades = course.getGrades();
		
		String sqlStatement = "insert into course (year, semester, course_id ,name, division, grades) values (?,?,?,?,?,?)";
		
		return jdbcTemplate.update(sqlStatement, new Object[] { year, semester, course_id, name, division, grades }) == 1 ;
	}

}
