package com.learnersacademy.web;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.learnersacademy.dao.AdminDAO;
import com.learnersacademy.dao.ClassDAO;
import com.learnersacademy.dao.StudentDAO;
import com.learnersacademy.dao.SubjectDAO;
import com.learnersacademy.dao.TeacherDAO;
import com.learnersacademy.model.Admin;
import com.learnersacademy.model.ClassX;
import com.learnersacademy.model.Student;
import com.learnersacademy.model.Subject;
import com.learnersacademy.model.Teacher;

@WebServlet("/admin-registration-initial")
public class START_LearnersAcademy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdminDAO adminDAO;
	StudentDAO studentDAO;
	SubjectDAO subjectDAO;
	TeacherDAO teacherDAO;
	ClassDAO classDAO;

	public void init(ServletConfig config) throws ServletException {
		adminDAO = new AdminDAO();
		studentDAO = new StudentDAO();
		subjectDAO = new SubjectDAO();
		teacherDAO = new TeacherDAO();
		classDAO = new ClassDAO();
		
		// Admin starter
		Admin admin1 = new Admin("Emily", "Johnson", "emily.johnson", "sunshine456");
		Admin admin2 = new Admin("Michael", "Davis", "michael.davis", "ocean789");
		Admin admin3 = new Admin("Sophia", "Martinez", "sophia.martinez", "raindrop2023");
		Admin admin4 = new Admin("Daniel", "Garcia", "daniel.garcia", "mountain123");
		Admin admin5 = new Admin("Olivia", "Rodriguez", "olivia.rodriguez", "flower987");
		Admin admin6 = new Admin("Ethan", "Lopez", "ethan.lopez", "forest567");

		adminDAO.saveAdmin(admin1);
		adminDAO.saveAdmin(admin2);
		adminDAO.saveAdmin(admin3);
		adminDAO.saveAdmin(admin4);
		adminDAO.saveAdmin(admin5);
		adminDAO.saveAdmin(admin6);
		
		// Student starter
		Student student1 = new Student("011/2024", "David", "Martinez", 22);
		Student student2 = new Student("012/2024", "Sarah", "Garcia", 20);
		Student student3 = new Student("013/2024", "Joseph", "Brown", 21);
		Student student4 = new Student("014/2024", "Jennifer", "Taylor", 23);
		Student student5 = new Student("015/2024", "Christopher", "Hernandez", 19);
		Student student6 = new Student("016/2024", "Amy", "Young", 22);
		Student student7 = new Student("017/2024", "Daniel", "Rodriguez", 20);
		Student student8 = new Student("018/2024", "Karen", "Lopez", 21);
		Student student9 = new Student("019/2024", "Michael", "Lee", 23);
		Student student10 = new Student("020/2024", "Amanda", "Gonzalez", 19);

		studentDAO.saveStudent(student1);
		studentDAO.saveStudent(student2);
		studentDAO.saveStudent(student3);
		studentDAO.saveStudent(student4);
		studentDAO.saveStudent(student5);
		studentDAO.saveStudent(student6);
		studentDAO.saveStudent(student7);
		studentDAO.saveStudent(student8);
		studentDAO.saveStudent(student9);
		studentDAO.saveStudent(student10);

		// teacher starter
		Teacher teacher1 = new Teacher("A-1965-006", "William", "Lopez", 45);
		Teacher teacher2 = new Teacher("B-1963-007", "Emily", "Clark", 53);
		Teacher teacher3 = new Teacher("C-1970-008", "Alexander", "Perez", 50);
		Teacher teacher4 = new Teacher("D-1968-009", "Sophia", "Martinez", 48);
		Teacher teacher5 = new Teacher("E-1972-010", "Daniel", "Davis", 42);

		
		teacherDAO.saveTeacher(teacher1);
		teacherDAO.saveTeacher(teacher2);
		teacherDAO.saveTeacher(teacher3);
		teacherDAO.saveTeacher(teacher4);
		teacherDAO.saveTeacher(teacher5);

		// Subject starter
		Subject subject1 = new Subject("English", "ENG");
		Subject subject2 = new Subject("Mathematics", "MATH");
		Subject subject3 = new Subject("Chemistry", "CHEM");
		Subject subject4 = new Subject("Biology", "BIO");
		Subject subject5 = new Subject("History", "HIS");
		Subject subject6 = new Subject("Art", "ART");
		Subject subject7 = new Subject("Geography", "GEO");

		subjectDAO.saveSubject(subject1);
		subjectDAO.saveSubject(subject2);
		subjectDAO.saveSubject(subject3);
		subjectDAO.saveSubject(subject4);
		subjectDAO.saveSubject(subject5);
		subjectDAO.saveSubject(subject6);
		subjectDAO.saveSubject(subject7);

		// Class starter
		ClassX classX1 = new ClassX();
		classX1.setSubjectId(subject1.getId());
		classX1.setTeacherId(teacher1.getId());
		classX1.setDate("31-Dec-2023");
		classDAO.saveClassX(classX1);
		subject1.setClassX(classX1.getSubject().getSubjectName());
		subjectDAO.updateSubject(subject1);
		teacher1.setClassX(classX1.getSubject().getSubjectName());
		teacherDAO.updateTeacher(teacher1);
		student1.setClassX(classX1.getSubject().getSubjectName());
		student2.setClassX(classX1.getSubject().getSubjectName());
		studentDAO.updateStudent(student1);
		studentDAO.updateStudent(student2);

		ClassX classX2 = new ClassX();
		classX2.setSubjectId(subject2.getId());
		classX2.setTeacherId(teacher2.getId());
		classX2.setDate("30-Dec-2023");
		classDAO.saveClassX(classX2);
		subject2.setClassX(classX2.getSubject().getSubjectName());
		subjectDAO.updateSubject(subject2);
		teacher2.setClassX(classX2.getSubject().getSubjectName());
		teacherDAO.updateTeacher(teacher2);
		student3.setClassX(classX2.getSubject().getSubjectName());
		student4.setClassX(classX2.getSubject().getSubjectName());
		studentDAO.updateStudent(student3);
		studentDAO.updateStudent(student4);

		ClassX classX3 = new ClassX();
		classX3.setSubjectId(subject3.getId());
		classX3.setTeacherId(teacher3.getId());
		classX3.setDate("19-Dec-2023");
		classDAO.saveClassX(classX3);
		subject3.setClassX(classX3.getSubject().getSubjectName());
		subjectDAO.updateSubject(subject3);
		teacher3.setClassX(classX3.getSubject().getSubjectName());
		teacherDAO.updateTeacher(teacher3);
		student5.setClassX(classX3.getSubject().getSubjectName());
		student6.setClassX(classX3.getSubject().getSubjectName());
		studentDAO.updateStudent(student5);
		studentDAO.updateStudent(student6);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		adminAdd_thanLogin(request, response);
	}
	

	private void adminAdd_thanLogin(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		// Creating list of all Admin from database
		List<Admin> listOfAdmin = adminDAO.getAllAdmin();

		boolean shouldSaveAdmin = true;

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// Preventing duplicate username
		for (Admin admin : listOfAdmin) {
			String tempUsername = admin.getUsername();
			if (tempUsername.equalsIgnoreCase(username)) {

				shouldSaveAdmin = false;

				request.setAttribute("errorMessage",
						"The username you entered: > " + username + " < is already taken, please try again!");

				RequestDispatcher dispatcher = request.getRequestDispatcher("admin-registration-initial.jsp");
				// The code below will case an error but that is OK
				dispatcher.forward(request, response);

			}
		}

		if (shouldSaveAdmin) {
			Admin admin = new Admin();
			admin.setFirstName(firstName);
			admin.setLastName(lastName);
			admin.setUsername(username);
			admin.setPassword(password);

			adminDAO.saveAdmin(admin);

			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}

	}

}