package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.CourseDAO;
import kr.ac.hansung.model.Course;
import kr.ac.hansung.model.DivisionCourse;
import kr.ac.hansung.model.SemesterCourse;

@Service
public class CourseService {
	
	@Autowired
	private CourseDAO courseDao;
	
	public List<Course> getCourses(Integer year, Integer semester){
		return courseDao.getCourses(year, semester);
	}
	
	public List<SemesterCourse> getSemesterCourses() {
		return courseDao.getSemesterCourses();
	}
	
	public List<DivisionCourse> getDevisionCourses(){
		return courseDao.getDevisionCourses();
	}

	public boolean insert(Course course) {
		return courseDao.insert(course);
	}
}
