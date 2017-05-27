package project.ims.bckrest;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStream;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibatis.common.jdbc.ScriptRunner;
import com.mysql.jdbc.Statement;

@Controller
public class BackUpRestore {

	//backup method
	@RequestMapping(value = "/download", method = RequestMethod.POST)
	public void export(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("filename") String filename) throws Exception {

		// tell browser program going to return an application file
		// instead of html page
		System.out.println("backup file name is " + filename);

		try {
			Runtime rt = Runtime.getRuntime();
			Process p = rt.exec(
					"mysqldump -u root --no-create-info --single-transaction --dump-date --replace inventory brand");

			response.setContentType("application/text");
			response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".sql");

			InputStream is = p.getInputStream();
			ServletOutputStream out = response.getOutputStream();
			System.out.println("output stream content is ");
			int ch;
			while ((ch = is.read()) != -1) {
				out.write(ch);

			}
			out.close();
			is.close();
		} catch (Exception e) {
			e.getMessage();
		}
	}
	
	// restore method
	public void restore(String fileabsolutepath) throws SQLException, ClassNotFoundException {
		String aSQLScriptFilePath = fileabsolutepath;

		System.out.println("restore method reached");
		// Create MySql Connection
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory", "root", "");
		Statement stmt = null;

		try {
			// Initialize object for ScripRunner
			ScriptRunner sr = new ScriptRunner(con, false, false);

			// Give the input file to Reader
			Reader reader = new BufferedReader(new FileReader(aSQLScriptFilePath));

			// Exctute script
			sr.runScript(reader);

		} catch (Exception e) {
			System.err.println("Failed to Execute" + aSQLScriptFilePath + " The error is " + e.getMessage());
		}
	}
	
}
