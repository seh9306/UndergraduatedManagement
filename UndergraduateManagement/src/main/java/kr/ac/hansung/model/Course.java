package kr.ac.hansung.model;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Course {
	private Integer year;
	private Integer semester;
	@NotNull
	@Pattern(regexp="[A-Z]{3}[0-9]{4}",message="잘못된 교과코드입니다.")
	private String course_id;
	@NotNull
	@Size(min=2, max=100, message="교과목의 이름이 너무 짧습니다.")
	private String name;
	@NotNull
	@Size(min=2, max=100, message="구분을 입력해주세요.")
	private String division;
	@NotNull
	private Integer grades;
}
