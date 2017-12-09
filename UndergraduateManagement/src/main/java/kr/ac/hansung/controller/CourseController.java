package kr.ac.hansung.controller;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hansung.model.Course;
import kr.ac.hansung.model.DivisionCourse;
import kr.ac.hansung.model.SemesterCourse;
import kr.ac.hansung.service.CourseService;

@Controller
public class CourseController {

	@Autowired
	private CourseService courseService;

	@RequestMapping(value = "/divisionCourse", method = RequestMethod.GET)
	public String showDivisionCourse(Model model) {
		List<DivisionCourse> divisionCourseList = courseService.getDevisionCourses();
		
		int sum = 0;
		
		for(DivisionCourse divisionCourse: divisionCourseList){
			sum += divisionCourse.getTotalGrades();
		}
		
		model.addAttribute("divisionCourses", divisionCourseList);
		model.addAttribute("totalGrades", sum);
		
		return "divisionCourse";
	}
	
	@RequestMapping(value = "/semesterCourse", method = RequestMethod.GET)
	public String showSemesterCourse(Model model) {
		List<SemesterCourse> semesterCourseList = courseService.getSemesterCourses();
		
		model.addAttribute("semesterCourses", semesterCourseList);
		
		return "semesterCourse";
	}	
	
	@RequestMapping(value = "/details", method = RequestMethod.POST)
	public String showDetails(
			@RequestParam("year") Integer year,
			@RequestParam("semester") Integer semester, Model model) {
		
		List<Course> courseList = courseService.getCourses(year, semester);
		
		model.addAttribute("courses", courseList);
		
		return "details";
	}
	
	@RequestMapping(value = "/searchCourse", method = RequestMethod.GET)
	public String showSearchCourse( Model model) {
		
		List<Course> courseList = courseService.getCourses(2018, 1);
		
		if(courseList.size()==0)
			model.addAttribute("courses", null);
		else
			model.addAttribute("courses", courseList);
		
		return "searchCourse";
	}
	
	@RequestMapping(value = "/applyCourse", method = RequestMethod.GET)
	public String showApplycourse(Model model) {
		Course course = new Course();
		
		model.addAttribute("course", course);
		
		return "applyCourse";
	}
	
	@RequestMapping(value = "/courseapplied", method = RequestMethod.POST)
	public String showCourseApplied(Model model, @Valid Course course, BindingResult result ) {
		if(result.hasErrors()){
			System.out.println("===Form data does not validated");
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error:errors){
				System.out.println(error.getDefaultMessage());
			}
			
			return "applyCourse";
		}
		
		if(courseService.insert(course) ){
			model.addAttribute("applylecture", new Boolean(true));
			course.setCourse_id(null);
			course.setDivision(null);
			course.setName(null);
			course.setGrades(null);
			//model.addAttribute("course", null);
		}
		return "applyCourse";
	}
	
}
