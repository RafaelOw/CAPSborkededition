package sg.iss.caps.repo;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import sg.iss.caps.model.Course;
import sg.iss.caps.model.Studentcourse;
import sg.iss.caps.model.StudentcoursePK;

public interface StudentCourseRepository extends JpaRepository<Studentcourse, StudentcoursePK> {
	@Query(value = "select * from studentcourse  where Student_StudentID = ?1",nativeQuery = true)
	public ArrayList<Studentcourse> findByStudentID(String studentID);
	@Query(value = "select * from studentcourse sc where Student_StudentID = ?1", nativeQuery = true)
	public ArrayList<Studentcourse> studentViewGrade(String studentID);
	@Query(value = "select * from studentcourse where Status = ?1 and Student_StudentID = ?2", nativeQuery = true)
	public ArrayList<Studentcourse> findAllStudentCourseByStatus(String status, String sid);

	
	
	
	
}
